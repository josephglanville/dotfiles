#!/bin/bash

set -eo pipefail

copy() {
  local src=$1
  local dest=$2
  local path=${dest%/*}
  mkdir -p "${path}"
  echo "Copying $src to $dest"
  cp -r "${src}" "${dest}"
}

template() {
  local src=$1
  local dest=$2
  local path=${dest%/*}
  mkdir -p "${path}"
  echo "Rendering template $src to $dest"
  envsubst < "${src}" > "${dest}"
}

copy_all() {
  copy bashrc "$HOME/.bashrc"
  copy bin "$HOME/bin"
  copy init.vim "$HOME/.config/nvim/init.vim"
  copy zshrc "$HOME/.zshrc"
}

copy_mac() {
  copy zshrc.mac "$HOME/.zshrc.mac"
  copy settings.json "$HOME/Library/Application Support/Code/User/settings.json"
  copy iterm2profile.plist "$HOME/Library/Application Support/iTerm2/DynamicProfiles/default.plist"
}

copy_linux() {
  copy xinitrc "$HOME/.xinitrc"
  copy xmobarrc "$HOME/.xmobarrc"
  copy xresources "$HOME/.Xresources"
  copy zshrc.linux "$HOME/.zshrc.linux"
}

template_all() {
  template gitconfig "$HOME/.gitconfig"
}

template_linux() {
  template xmonad.hs "$HOME/.xmonad/xmonad.hs"
}

# OS detection
if [ -f /proc ]; then
    OS="linux"
fi
if [ -f /System/Library/Kernels/kernel ]; then
    OS="mac"
fi

# Install OS specific dependencies and files/templates
case $OS in
  linux)
    ./linux_depends.sh
    copy_linux
    template_linux
    ;;
  mac)
    ./mac_depends.sh
    copy_mac
    ;;
esac

# Install multi-platform files/templates
copy_all
template_all

# Configure vim
PLUG_VIM="${HOME}/.local/share/nvim/site/autoload/plug.vim"
if [ ! -f "${PLUG_VIM}" ]; then
  curl -fLos "${PLUG_VIM}" --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
fi
nvim +PlugInstall +qall

# Install oh-my-zsh
OH_MY_ZSH_DIR="${HOME}/.oh-my-zsh"
if [ ! -d $OH_MY_ZSH_DIR ]; then
  git clone "https://github.com/josephglanville/oh-my-zsh" "${OH_MY_ZSH_DIR}"
else
  (cd "${OH_MY_ZSH_DIR}"; git pull)
fi

# Configure Visual Studio Code
EXTENSIONS="
donjayamanne.python
lukehoban.Go
mathiasfrohlich.Kotlin
mauve.terraform
zhuangtongfa.Material-theme
"

for e in $EXTENSIONS; do
  code --install-extension $e
done
