REPOS='sjl/gundo.vim '
REPOS+='scrooloose/nerdcommenter '
REPOS+='scrooloose/syntastic '
REPOS+='vim-airline/vim-airline '
REPOS+='vim-airline/vim-airline-themes '
REPOS+='tpope/vim-surround '
REPOS+='junegunn/goyo.vim '
REPOS+='tpope/vim-repeat '
REPOS+='tpope/vim-fugitive '
REPOS+='ctrlpvim/ctrlp.vim '
REPOS+='tyru/current-func-info.vim '

for REPO in $REPOS; do
    git clone https://github.com/$REPO
done
