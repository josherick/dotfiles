execute pathogen#infect()

" Some basic things
set nocompatible " Disable vi compatibility
set nostartofline " Don't jump to the start of the line when switching buffers
syntax on " Syntax highlighting on.
set title " Set the title of the terminal
set nowrap " Don't wrap long lines
set backspace=indent,eol,start " Allow backspacing over tabs, and across lines
set number " Display line numbers
set showmatch " Show matching parenthesis/brackets
set history=1000 " Large history
set undolevels=1000 " Large undo history
set visualbell " Don't play sounds.
set noerrorbells " Don't play sounds.
set wildmenu " Visual autocomplete for command menu

set ignorecase " Must be on for smartcase to work
set smartcase " Find/Replace: when searching, CIS if all lower, otherwise CS
set incsearch " Show search matches as you type

set expandtab " Expand tabs into spaces
set tabstop=4 " 4 spaces inserted when tab is pressed
set softtabstop=4 " Set equal to tabstop to ensure use of spaces instead of tabs
set autoindent " Autoindent when hitting return.
set copyindent " Copy the structure of existing lines indent when autoindenting
set shiftwidth=4 " Controls indentation with shift >> << commands
set shiftround " Use multiple of shiftwidth when indenting with < and >
set smarttab " Insert tabs on the start of line based on shiftwidth, not tabstop
set hidden " buffers don't get unloaded, just hidden when they go away

set cursorline " Highlight the cursor line.
set scrolloff=5 " Always show 5 lines above/below cursor.
set colorcolumn=80 " Highlight column 80 as a soft guide.

set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level

set undofile " create an undo file to persist undo changes
set undodir=~/.vim/undos " save all the undos in one folder

set clipboard=unnamed " Use system clipboard, CHANGE TO unnamedplus FOR LINUX

let mapleader = ','

set guifont=Menlo:h12
"let g:solarized_termcolors=256
"set background=dark
colorscheme hybrid

set laststatus=2 " For vim-airline to always show status bar.
let g:airline#extensions#tabline#enabled = 1 " For vim-airline to enable tab/buffer line.
let g:airline#extensions#tabline#fnamemod = ':t' " For vim-airline just show filename.
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
"let g:airline_powerline_fonts = 1
let g:tmuxline_powerline_separators = 0


" Enter and Shift-Enter add new lines before and after, with count.
nnoremap <silent> <Enter> :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
nnoremap <silent> <S-Enter> :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>

nnoremap <leader>ts :%s/\s\+$//e<CR>

" <leader>na (non-ascii) highlights non ascii chars.
"nnoremap <silent> <leader>na :syntax match nonascii "[^\x00-\x7F]" <CR> | :highlight nonascii guibg=Red ctermbg=2 <CR>

" Removes default s/S functionality, which I personally don't use, but this is
" not for everyone. Insert character under cursor with s, after with S.
nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>

" Add keymaps to switch buffers back and forth and stuff
nmap <leader>. :bprevious<CR>
nmap <leader>/ :bnext<CR>
nmap <leader>t :enew<CR>
nmap <leader>bq :bp <BAR> bd #<CR>

" Clear word, brackets, curly braces, quotes and paste
nmap <leader>piw "_diwP
nmap <leader>pib "_dibP
nmap <leader>pit "_ditP
nmap <leader>pi{ "_di{P
nmap <leader>pi} "_di}P
nmap <leader>pi{ "_di[P
nmap <leader>pi] "_di]P
nmap <leader>pi" "_di"P
nmap <leader>pi' "_di'P

" Insert semicolon at end of line.
nmap <leader>; A;<C-[>

" Remap Y to be consistent with D, C, etc
nmap Y y$


" Set YCM configuration file.
let g:ycm_global_ycm_extra_conf = '~/Dropbox/code/.ycm_extra_conf.py'

" Turn off weird JS autocompletion from YouCompleteMe
let g:ycm_filetype_specific_completion_to_disable = { 'javascript' : 1 }

" Turn off autocommenting of next line.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Store session
"set sessionoptions+=resize,winpos,buffers,tabpages,options
"autocmd VimLeave * :mksession! ~/.vim/Session.vim
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | :source ~/.vim/Session.vim | endif

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Necesarry for nerdcommenter
filetype plugin on

" :W maps to w so if shift is still being held when typing w, it works
command W w

" :Wsudo sudo saves the file 
command Wsudo w !sudo tee % > /dev/null

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

