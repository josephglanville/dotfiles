#!/bin/bash

set -eo pipefail

echo "Installing Mac dependencies"

# Install homebrew (ensure stdin is not a tty so we can get unattended install)
if [ ! -f /usr/local/bin/brew ]; then
  echo | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install packages with homebrew
PKGS="
awscli
calc
cloc
cloc
coreutils
fd
gettext
git
go
jq
kubectl
kubectx
kubernetes-helm
maven
neovim/neovim/neovim
node
oath-toolkit
packer
postgres
python@2
python@3
ruby
rustup-init
tree
vim
zsh
"

# Install brew cask
brew tap caskroom/cask

brew upgrade # To ensure that re-installs don't error
brew install $PKGS

# link gettext as it's keg-only
brew link -f "gettext"

CASKS="
adoptopenjdk
docker
google-chrome
google-cloud-sdk
iterm2
jetbrains-toolbox
qbittorrent
slack
steam
virtualbox
visual-studio-code
vlc
"

brew cask install $CASKS

# gradle requires java so has to be installed after zulu
brew install gradle

# Setup Rust
rustup-init -y

# Install Source Code Pro
./install_source_code_pro.sh $HOME/Library/Fonts

# Create code symlink
CODE="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
[ ! -f /usr/local/bin/code ] && ln -s "${CODE}" /usr/local/bin/code

exit 0
