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
cloc
git
gettext
calc
cloc
coreutils
fd
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
python
python3
ruby
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
battle-net
docker
dropbox
flux
google-chrome
google-cloud-sdk
iterm2
jetbrains-toolbox
minikube
qbittorrent
slack
sourcetree
spotify
vagrant
visual-studio-code
virtualbox
vlc
wkhtmltopdf
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

exit 0
