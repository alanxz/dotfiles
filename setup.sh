#!/bin/bash

set -x

cd $HOME
ln -s $HOME/dotfiles/.gitconfig .
ln -s $HOME/dotfiles/.tmux.conf .

mkdir -p .config/nvim
ln -s $HOME/dotfiles/.config/nvim/init.vim .config/nvim/.

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
