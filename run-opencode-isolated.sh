#!/usr/bin/env bash

set -euo pipefail

root="/home/jumski/Code/jumski/opencode-supabase-consumer"
tmp="${TMPDIR:-/tmp}/opencode-isolated-$USER"

mkdir -p "$tmp/.config" "$tmp/.local/share" "$tmp/.cache" "$tmp/.local/state"

env \
  HOME="$tmp" \
  XDG_CONFIG_HOME="$tmp/.config" \
  XDG_DATA_HOME="$tmp/.local/share" \
  XDG_CACHE_HOME="$tmp/.cache" \
  XDG_STATE_HOME="$tmp/.local/state" \
  OPENCODE_CONFIG_DIR="$root/.opencode" \
  OPENCODE_DISABLE_PROJECT_CONFIG=1 \
  opencode --print-logs "$@"
