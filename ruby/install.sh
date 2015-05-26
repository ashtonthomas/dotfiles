#!/bin/sh

echo "Installing chruby ..."
  brew install chruby
  brew install ruby-install
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh

  ruby-install ruby 2.2.2
  chruby ruby-2.2.2

echo "Permit user to write to system rubies and gems ..."
  sudo chown -R $(whoami) /Library/Ruby/Gems/2.0.0

echo "Set number of cores available for bundler"
  number_of_cores=$(sysctl -n hw.ncpu)
  bundle config --global jobs $((number_of_cores - 1))
