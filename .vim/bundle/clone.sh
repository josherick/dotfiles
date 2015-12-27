REPOS='sjl/gundo.vim '
REPOS+='scrooloose/nerdcommenter '
REPOS+='scrooloose/syntastic '
REPOS+='bling/vim-airline '
REPOS+='tpope/vim-surround '
REPOS+='junegunn/goyo.vim '

for REPO in $REPOS; do
    git clone https://github.com/$REPO
done
