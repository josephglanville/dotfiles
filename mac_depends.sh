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
go
gradle
neovim/neovim/neovim
packer
python
python3
zsh
"

# Install brew cask
brew tap caskroom/cask

brew upgrade # To ensure that re-installs don't error
brew install $PKGS

# link gettext as it's keg-only
brew link -f "gettext"

CASKS="
battle-net
flux
google-chrome
intellij-idea-ce
iterm2
qbittorrent
slack
spotify
vagrant
visual-studio-code
virtualbox
vlc
zulu
"

brew cask install $CASKS

# gradle requires java so has to be installed after zulu
brew install gradle

# Install Source Code Pro
./install_source_code_pro.sh $HOME/Library/Fonts

# Create code symlink
CODE="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
[ ! -f /usr/local/bin/code ] && ln -s "${CODE}" /usr/local/bin/code
