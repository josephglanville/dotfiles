#!/bin/bash

set -eo pipefail

echo "Installing Mac dependencies"

# Install homebrew (ensure stdin is not a tty so we can get unattended install)
if [ ! -f /usr/local/bin/brew ]; then
  echo | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew upgrade # To ensure that re-installs don't error

# Install JDK so that Java apps can be installed
brew tap AdoptOpenJDK/openjdk
JDKS="8 11 12"
for jdk in $JDKS; do
  brew cask install "adoptopenjdk${JDK}"
done

# Install packages with homebrew
PKGS="
awscli
calc
cloc
coreutils
fd
gettext
git
go
gradle
jq
kubectl
kubectx
kubernetes-helm
neovim/neovim/neovim
node
maven
oath-toolkit
packer
postgres
python@2
python@3
ripgrep
ruby
rustup-init
shellcheck
tokei
tree
vim
zsh
"

brew install $PKGS

# link gettext as it's keg-only
brew link -f "gettext"

CASKS="
docker
firefox
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

# Setup Rust
rustup-init -y

# Install Source Code Pro
./install_source_code_pro.sh $HOME/Library/Fonts

# Create code symlink
CODE="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
[ ! -f /usr/local/bin/code ] && ln -s "${CODE}" /usr/local/bin/code

exit 0
