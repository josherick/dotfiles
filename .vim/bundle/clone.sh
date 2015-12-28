REPOS='sjl/gundo.vim '
REPOS+='scrooloose/nerdcommenter '
REPOS+='scrooloose/syntastic '
REPOS+='bling/vim-airline '
REPOS+='tpope/vim-surround '
REPOS+='junegunn/goyo.vim '
REPOS+='tpope/vim-repeat '

for REPO in $REPOS; do
    git clone https://github.com/$REPO
done
