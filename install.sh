#!/bin/bash

manifest="
bashrc:$HOME/.bashrc
zshrc:$HOME/.zshrc
gitconfig:$HOME/.gitconfig
mpdrc:$HOME/.mpdrc
vimrc:$HOME/.vimrc
xinitrc:$HOME/.xinitrc
xmobarrc:$HOME/.xmobarrc
xmonad.hs:$HOME/.xmonad/xmonad.hs
xresources:$HOME/.Xresources
zprofile:$HOME/.zprofile
aliases:$HOME/.aliases
aliases.linux:$HOME/.aliases.linux
aliases.mac:$HOME/.aliases.mac
"
for file in $manifest; do
	src=${file%%:*}
	dest=${file##*:}
	path=${dest%/*}
	mkdir -p $path
	cp $src $dest
done
