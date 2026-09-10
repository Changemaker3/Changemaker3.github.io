#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
for ruby_bin in /opt/homebrew/opt/ruby@3.3/bin /opt/homebrew/opt/ruby/bin /usr/local/opt/ruby/bin; do
  if [ -x "$ruby_bin/ruby" ]; then export PATH="$ruby_bin:$PATH"; break; fi
done
exec bundle exec ruby scripts/check_site.rb
