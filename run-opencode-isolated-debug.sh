#!/usr/bin/env bash

set -euo pipefail

root="/home/jumski/Code/jumski/opencode-supabase-consumer"
tmp="${TMPDIR:-/tmp}/opencode-isolated-$USER"
log_dir="$root/logs"
log_file="$log_dir/opencode-isolated-$(date +%Y%m%d-%H%M%S).log"

mkdir -p "$tmp/home" "$tmp/.config" "$tmp/.local/share" "$tmp/.cache" "$tmp/.local/state"
mkdir -p "$log_dir"

printf 'writing log to %s\n' "$log_file"

env \
  BROWSER="${BROWSER:-firefox}" \
  OPENCODE_TEST_HOME="$tmp/home" \
  OPENCODE_DISABLE_PROJECT_CONFIG=1 \
  XDG_CONFIG_HOME="$tmp/.config" \
  XDG_DATA_HOME="$tmp/.local/share" \
  XDG_CACHE_HOME="$tmp/.cache" \
  XDG_STATE_HOME="$tmp/.local/state" \
  OPENCODE_CONFIG_DIR="$root/.opencode" \
  opencode --print-logs "$@" 2>&1 | tee "$log_file"
