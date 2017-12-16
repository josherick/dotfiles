#!/bin/bash
LINK_TMUX='ln -s $PWD/tmux.conf $HOME/.tmux.conf;'
LINK_TMUXDIR='[ ! -d $HOME/.tmux ] && ln -s $PWD/tmux $HOME/.tmux;'
LINK_VIMRC='ln -s $PWD/vimrc $HOME/.vimrc;'
LINK_VIMRUNTIME='[ ! -d $HOME/.vim ] && ln -s $PWD/vim $HOME/.vim;'
LINK_ZSHRC='ln -s $PWD/zshrc $HOME/.zshrc;'
LINK_ZSHDIR='[ ! -d $HOME/.zsh ] && ln -s $PWD/zsh $HOME/.zsh;'
SET_GITIGNORE='git config --global core.excludesfile $PWD/gitignore_global;'
MAKE_VIM_DIRS='mkdir $HOME/.vim/undos $HOME/.vim/plugged $HOME/.vim/sessions;'
INSTALL_VIM_PLUGINS='vim +PlugInstall +qall!;'

OPERATIONS=$LINK_TMUX$LINK_TMUXDIR$LINK_VIMRC$LINK_VIMRUNTIME$LINK_ZSHRC
OPERATIONS=$OPERATIONS$LINK_ZSHDIR$SET_GITIGNORE$MAKE_VIM_DIRS
OPERATIONS=$OPERATIONS$INSTALL_VIM_PLUGINS

IFS=';'

for OP in $OPERATIONS; do
    echo $OP
    eval $OP
    echo ""
done


