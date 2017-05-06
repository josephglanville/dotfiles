#!/bin/bash

set -eo pipefail

copy() {
  local f=$1
  local src=${f%%:*}
  local dest=${f##*:}
  local path=${dest%/*}
  mkdir -p "${path}"
  echo "Copying $src to $dest"
  cp -r "${src}" "${dest}"
}

copyall() {
  for f in $@; do
    copy $f
  done
}

template() {
  local f=$1
  local src=${f%%:*}
  local dest=${f##*:}
  local path=${dest%/*}
  mkdir -p "${path}"
  echo "Rendering template $src to $dest"
  envsubst < "${src}" > "${dest}"
}

templateall() {
  for t in $@; do
    template $t
  done
}

# OS detection
if [ -f /proc ]; then
    OS="linux"
fi
if [ -f /System/Library/Kernels/kernel ]; then
    OS="mac"
fi

FILES="
bashrc:$HOME/.bashrc
bin:$HOME/bin
init.vim:$HOME/.config/nvim/init.vim
zshrc:$HOME/.zshrc
"

FILES_MAC="
zshrc.mac:$HOME/.zshrc.mac
"

FILES_LINUX="
xinitrc:$HOME/.xinitrc
xmobarrc:$HOME/.xmobarrc
xresources:$HOME/.Xresources
zshrc.linux:$HOME/.zshrc.linux
"

TEMPLATES="
gitconfig:$HOME/.gitconfig
"

TEMPLATES_LINUX="
xmonad.hs:$HOME/.xmonad/xmonad.hs
"

# Install OS specific dependencies and files/templates
case $OS in
  linux)
    ./linux_depends.sh
    copyall $FILES_LINUX
    templateall $TEMPLATES_LINUX
    ;;
  mac)
    ./mac_depends.sh
    copyall $FILES_MAC
    ;;
esac

# Install multi-platform files/templates
copyall $FILES
templateall $TEMPLATES

# Install vim-plug
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
