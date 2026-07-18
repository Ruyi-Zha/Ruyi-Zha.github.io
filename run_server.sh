#!/usr/bin/env bash
set -e

# Use the chruby-managed Ruby 3.4.1 (macOS system Ruby is too old / not writable).
if [ -x "$HOME/.rubies/ruby-3.4.1/bin/ruby" ]; then
  export PATH="$HOME/.rubies/ruby-3.4.1/bin:$PATH"
fi

# Kill any stale Jekyll server still holding the ports (avoids "port is in use").
pkill -f "jekyll serve" 2>/dev/null || true
sleep 1

# The old `jekyll liveserve` (hawkins gem) is broken on modern Ruby/WEBrick,
# so use Jekyll's native live-reload command instead.
bundle exec jekyll serve --livereload
