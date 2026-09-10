#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
# Prefer a compatible local Ruby without modifying the user's shell configuration.
for ruby_bin in /opt/homebrew/opt/ruby@3.3/bin /opt/homebrew/opt/ruby/bin /usr/local/opt/ruby/bin; do
  if [ -x "$ruby_bin/ruby" ]; then
    export PATH="$ruby_bin:$PATH"
    break
  fi
done
exec bundle exec jekyll "$@"
