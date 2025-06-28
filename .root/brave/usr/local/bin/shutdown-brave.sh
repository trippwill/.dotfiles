#!/bin/sh

echo "[shutdown-brave] Checking if Brave is running..."

BRAVE_PIDS="$(pgrep -x brave)"

if [ -n "$BRAVE_PIDS" ]; then
  echo "[shutdown-brave] Brave is running. Sending SIGTERM..."
  # shellcheck disable=SC2086 # word splitting is intentional
  kill -TERM $BRAVE_PIDS

  echo "[shutdown-brave] Waiting up to 20 seconds for Brave to exit..."
  i=0
  while [ "$i" -lt 20 ]; do
    if ! pgrep -x brave >/dev/null; then
      echo "[shutdown-brave] Brave exited cleanly."
      exit 0
    fi
    sleep 1
    i=$(("$i" + 1))
  done

  echo "[shutdown-brave] Brave did not exit in time. Sending SIGKILL..."
  # shellcheck disable=SC2086 # word splitting is intentional
  kill -KILL $BRAVE_PIDS 2>/dev/null
else
  echo "[shutdown-brave] Brave is not running."
fi
