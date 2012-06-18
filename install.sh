#!/bin/bash

manifest="
bashrc:$HOME/.bashrc
gitconfig:$HOME/.gitconfig
mpdrc:$HOME/.mpdrc
vimrc:$HOME/.vimrc
xinitrc:$HOME/.xinitrc
xmobarrc:$HOME/.xmobarrc
xmonad.hs:$HOME/.xmonad/xmonad.hs
xresources:$HOME/.Xresources
"
for file in $manifest; do
	src=${file%%:*}
	dest=${file##*:}
	path=${dest%/*}
	mkdir -p $path
	cp $src $dest
done
