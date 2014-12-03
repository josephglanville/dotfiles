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
bin:$HOME/bin
"
for file in $manifest; do
	src=${file%%:*}
	dest=${file##*:}
	path=${dest%/*}
	mkdir -p $path
	cp -r $src $dest
done

VUNDLE_DIR=$HOME/.vim/bundle/vundle
PWD=`pwd`

mkdir -p $HOME/.vim/bundle
if [ ! -d $VUNDLE_DIR ]; then
    git clone https://github.com/gmarik/vundle $VUNDLE_DIR
else
    (cd $VUNDLE_DIR; git pull)
fi

vim +BundleInstall +qall

OH_MY_ZSH_DIR=$HOME/.oh-my-zsh
if [ ! -d $OH_MY_ZSH_DIR ]; then
    git clone https://github.com/josephglanville/oh-my-zsh $OH_MY_ZSH_DIR
else
    (cd $OH_MY_ZSH_DIR; git pull)
fi
