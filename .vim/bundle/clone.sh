REPOS='mileszs/ack.vim'
REPOS+='ctrlpvim/ctrlp.vim '
REPOS+='tyru/current-func-info.vim '
REPOS+='junegunn/goyo.vim '
REPOS+='sjl/gundo.vim '
REPOS+='scrooloose/nerdcommenter '
REPOS+='scrooloose/syntastic '
REPOS+='vim-airline/vim-airline '
REPOS+='vim-airline/vim-airline-themes '
REPOS+='tpope/vim-fugitive '
REPOS+='tpope/vim-repeat '
REPOS+='tpope/vim-sleuth '
REPOS+='tpope/vim-surround '

for REPO in $REPOS; do
    git clone https://github.com/$REPO
done
