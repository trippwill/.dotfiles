#!/usr/bin/env bash
# patch-brave-preferences.sh  ── runs once per graphical login
# ▸ If a profile shows the compositor-shutdown pattern
#     exit_type="Crashed", exited_cleanly=true
#   set exit_type="Normal"  and save a timestamped backup first.

set -eu

cfg="$HOME/.config/BraveSoftware/Brave-Browser"
[[ -d $cfg ]] || {
  echo "Brave prefs patch: $cfg not found – nothing to do"
  exit 0
}

echo "Brave prefs patch: scanning $cfg for Preferences files"

timestamp=$(date +%Y%m%d-%H%M%S)

find "$cfg" -name Preferences -type f -print0 |
  while IFS= read -r -d '' f; do
    exit_type=$(jq -r '.profile.exit_type      // ""' "$f")
    clean_flag=$(jq -r '.profile.exited_cleanly // ""' "$f")

    case "$exit_type/$clean_flag" in
    Normal/*)
      echo "  skip   $f (already Normal)"
      ;;
    Crashed/true)
      echo "  patch  $f (was exit_type=Crashed, exited_cleanly=true)"
      bak="${f}.${timestamp}.bak"
      cp --preserve=mode,ownership,timestamps "$f" "$bak"

      tmp="${f}.tmp.$$"
      if jq -c '.profile.exit_type = "Normal"' "$f" >"$tmp"; then
        mv "$tmp" "$f"
        echo "  backup $bak"
        # Limit number of backups to 3 per Preferences file
        max_backups=3
        find_dir=$(dirname "$f")
        find_base=$(basename "$f")
        # Find matching backups, sort by mtime, keep newest $max_backups, delete the rest
        find "$find_dir" -maxdepth 1 -type f -name "${find_base}.*.bak" -print0 |
          xargs -0 ls -1t 2>/dev/null | tail -n +$((max_backups + 1)) | xargs -r rm --
      else
        echo "  ERROR  jq failed on $f – original left intact, not backed up"
        rm -f "$tmp" || true
        rm -f "$bak" || true
      fi
      ;;
    Crashed/false)
      echo "  skip   $f (real crash: exited_cleanly=false)"
      notify-send -u critical "Brave Browser Crash" "A real crash was detected in profile: $f"
      ;;
    *)
      echo "  skip   $f (unrecognised combo: exit_type=$exit_type, exited_cleanly=$clean_flag)"
      ;;
    esac
  done

echo "Brave prefs patch: done"
