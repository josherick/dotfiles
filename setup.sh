#!/bin/bash
set -x

ln -s $PWD/tmux.conf $HOME/.tmux.conf
[ ! -d $HOME/.tmux ] && ln -s $PWD/tmux $HOME/.tmux

ln -s $PWD/vimrc $HOME/.vimrc
[ ! -d $HOME/.vim ] && ln -s $PWD/vim $HOME/.vim
mkdir $HOME/.vim/undos $HOME/.vim/plugged $HOME/.vim/sessions
vim +PlugInstall +qall!

ln -s $PWD/zshrc $HOME/.zshrc
[ ! -d $HOME/.zsh ] && ln -s $PWD/zsh $HOME/.zsh

ln -s $PWD/alacritty.yml $HOME/.alacritty.yml

git config --global core.excludesfile $PWD/gitignore_global
