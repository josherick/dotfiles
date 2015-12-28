#!/bin/bash
LINK_TMUX='ln -s $PWD/.tmux.conf $HOME/.tmux.conf;'
LINK_VIMRC='ln -s $PWD/.vimrc $HOME/.vimrc;'
COPY_VIMRUNTIME='cp -r $PWD/.vim $HOME/.vim;'
LINK_ZSHRC='ln -s $PWD/.zshrc $HOME/.zshrc;'
SET_GITIGNORE='git config --global core.excludesfile $PWD/.gitignore_global;'

OPERATIONS=$LINK_TMUX$LINK_VIMRC$COPY_VIMRUNTIME$LINK_ZSHRC$SET_GITIGNORE

IFS=';'

for OP in $OPERATIONS; do
    echo $OP
    eval $OP
    echo ""
done


