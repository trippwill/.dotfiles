#!/bin/sh
# ~/.local/bin/graceful-logout.sh

# List of graphical apps and their preferred shutdown signals (app=signal)
APPS_SIGNALS="brave=INT code=TERM"

for entry in $APPS_SIGNALS; do
  app="${entry%=*}"
  sig="${entry#*=}"

  pids=$(pgrep -u "$USER" -x "$app")
  for pid in $pids; do
    # Check if this is a parent process (i.e. not a child like --type=renderer)
    children=$(pgrep -P "$pid")
    if [ -n "$children" ]; then
      echo "[graceful-logout] Sending SIG$sig to $app (PID $pid)"
      kill -s "$sig" "$pid"
      sleep 1
      if kill -0 "$pid" 2>/dev/null; then
        echo "[graceful-logout] $app (PID $pid) is still running after SIG$sig"
      else
        echo "[graceful-logout] $app (PID $pid) terminated successfully"
      fi
    fi
  done

done

exit 0
