#!/usr/bin/env bash

set -euo pipefail

root="/home/jumski/Code/jumski/opencode-supabase-consumer"
tmp="${TMPDIR:-/tmp}/opencode-isolated-$USER"

mkdir -p "$tmp/home" "$tmp/.cache" "$tmp/.local/state"

mise exec -- env \
  OPENCODE_TEST_HOME="$tmp/home" \
  OPENCODE_DISABLE_PROJECT_CONFIG=1 \
  XDG_CACHE_HOME="$tmp/.cache" \
  XDG_STATE_HOME="$tmp/.local/state" \
  OPENCODE_CONFIG_DIR="$root/.opencode" \
  opencode "$@"
