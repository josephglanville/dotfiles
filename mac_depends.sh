#!/bin/bash

set -eo pipefail

echo "Installing Mac dependencies"

# Install homebrew (ensure stdin is not a tty so we can get unattended install)
if [ ! -f /usr/local/bin/brew ]; then
  echo | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew upgrade # To ensure that re-installs don't error

# Install packages with homebrew
PKGS="
automake
awscli
aws-vault
calc
cloc
coreutils
fd
fzf
gettext
gh
git
git-delta
go
gradle
jq
jsonnet
kubectl
kubectx
kubernetes-helm
libtool
maven
node
nvim
oath-toolkit
openjdk@8
openjdk@11
openjdk@15
packer
postgres
python
re2
ripgrep
ruby
rustup-init
shellcheck
stern
tokei
tree
vault
wget
zsh
"

brew install $PKGS

# Generate fzf files
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc

# link gettext as it's keg-only
brew link -f "gettext"

# Symlink JDKs so they can be used with system Java wrapper
JDKS="8 11 15"
for jdk in $JDKS; do
  sudo ln -sfn "/usr/local/opt/openjdk@${jdk}/libexec/openjdk.jdk" "/Library/Java/JavaVirtualMachines/openjdk-${jdk}.jdk"
done

CASKS="
1password
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

brew install --cask $CASKS

# Setup Rust
rustup-init -y

# Install Source Code Pro
./install_source_code_pro.sh $HOME/Library/Fonts

# Create code symlink
CODE="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
[ ! -f /usr/local/bin/code ] && ln -s "${CODE}" /usr/local/bin/code

exit 0
