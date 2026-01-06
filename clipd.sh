#!/usr/bin/env bash

set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
HISTORY_FILE="${CLIPBOARD_HISTORY_FILE:-$SCRIPT_DIR/.clipboard_history}"
MAX_ENTRIES=100
POLL_INTERVAL=1

last_hash=""

touch "$HISTORY_FILE"

while true; do
  content=$(pbpaste 2>/dev/null || true)

  if [[ -n "$content" ]]; then
    current_hash=$(echo -n "$content" | md5 -q)

    if [[ "$current_hash" != "$last_hash" ]]; then
      encoded=$(echo -n "$content" | base64)

      {
        echo "$encoded"
        head -n $((MAX_ENTRIES - 1)) "$HISTORY_FILE"
      } > "$HISTORY_FILE.tmp"
      mv "$HISTORY_FILE.tmp" "$HISTORY_FILE"

      last_hash="$current_hash"
    fi
  fi

  sleep "$POLL_INTERVAL"
done
