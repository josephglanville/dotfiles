#!/bin/bash

set -eo pipefail

echo "Installing Mac dependencies"

# Install homebrew (ensure stdin is not a tty so we can get unattended install)
if [ ! -f /usr/local/bin/brew ]; then
  echo | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install packages with homebrew
PKGS="
git
gettext
calc
cloc
coreutils
neovim/neovim/neovim
zsh
"

brew upgrade # To ensure that re-installs don't error
brew install $PKGS

# link gettext as it's keg-only
brew link -f "gettext"
