" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'mileszs/ack.vim'
Plug 'tyru/current-func-info.vim'
Plug 'junegunn/goyo.vim'
Plug 'sjl/gundo.vim'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'leafgarland/typescript-vim'
Plug 'kopischke/vim-fetch'
Plug 'othree/yajs.vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
"Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'danro/rename.vim'

" Initialize plugin system
call plug#end()

" :PlugInstall [name ...]<CR> install plugins
" :PlugUpdate [name ...]<CR> install or update plugins
" :PlugClean<CR> remove unused directories
" :PlugUpgrade<CR> upgrade VimPlug itself
" :PlugStatus<CR> upgrade VimPlug itself

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
set noswapfile " Turns off swapfiles

set ignorecase " Must be on for smartcase to work
set smartcase " Find/Replace: when searching, CIS if all lower, otherwise CS
set incsearch " Show search matches as you type

"set expandtab " Expand tabs into spaces
set tabstop=4 " 4 spaces inserted when tab is pressed
set softtabstop=4 " Set equal to tabstop to ensure use of spaces instead of tabs
set autoindent " Autoindent when hitting return.
set copyindent " Copy the structure of existing lines indent when autoindenting
set shiftwidth=4 " Controls indentation with shift >> << commands
set shiftround " Use multiple of shiftwidth when indenting with < and >
set smarttab " Insert tabs on the start of line based on shiftwidth, not tabstop
set hidden " buffers don't get unloaded, just hidden when they go away
set noexpandtab " Don't expand tabs into spaces

set cursorline " Highlight the cursor line.
set scrolloff=5 " Always show 5 lines above/below cursor.
set colorcolumn=80 " Highlight column 80 as a soft guide.
set textwidth=0 " Don't automatically wrap

set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level

set undofile " create an undo file to persist undo changes
set undodir=~/.vim/undos " save all the undos in one folder

set clipboard=unnamed " Use system clipboard, CHANGE TO unnamedplus FOR LINUX

set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

" Attempt to make vim faster.
set redrawtime=3000
set lazyredraw
" 'Hybrid' https://jeffkreeftmeijer.com/vim-number/
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

let mapleader = ','

set guifont=Menlo:h12
"let g:solarized_termcolors=256
"set background=dark
colorscheme hybrid

map <leader>at :ALEToggle<CR>
let g:ale_linters = {
\   'php': [],
\}

set laststatus=2 " For vim-airline to always show status bar.
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:tmuxline_powerline_separators = 0
let g:airline#extensions#tabline#enabled = 1 " For vim-airline to enable tab/buffer line.
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" UltiSnips configuration
"let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" Enter and Shift-Enter add new lines before and after, with count.
nnoremap <silent> <Enter> :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
nnoremap <silent> <S-Enter> :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>

nnoremap <leader>ts :%s/\s\+$//e<CR>

" Display current function in status line
nnoremap <leader>fn :echo cfi#format("%s", "")<CR>

" <leader>na (non-ascii) highlights non ascii chars.
"nnoremap <silent> <leader>na :syntax match nonascii "[^\x00-\x7F]" <CR> | :highlight nonascii guibg=Red ctermbg=2 <CR>

" Removes default s/S functionality, which I personally don't use, but this is
" not for everyone. Insert character under cursor with s, after with S.
nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>

" Insert a character at the end of the line.
nmap <leader>e :exec "s/$/".nr2char(getchar())<CR>


" Add keymaps to switch buffers back and forth and stuff
nmap <leader>. :bprevious<CR>
nmap <leader>/ :bnext<CR>
nmap <leader>t :enew<CR>
nmap <leader>bq :bp <BAR> bd #<CR>

" Clear word, brackets, curly braces, quotes and paste
for c in ['w', 'b', 't', '{', '}', '(', ')', '[', ']', '"', '''', '`']
  execute "nmap <leader>pi" . c . " \"_di" . c . "P"
  execute "nmap <leader>pvi" . c . " vi" . c . "pgvy"
endfor

" Add di" etc for underscores
"nmap di_ F_dt"
"nmap ci_ F_ct"
"nmap yi_ F_yt"
"nmap <leader>pi_ F_"_dt"P

" Add d, c, y, and p behavior for inner lines
nmap dil ^D
nmap cil ^C
nmap yil ^y$
nmap <leader>pil ^"_Dp

" Remap Y to be consistent with D, C, etc
nmap Y y$

" Yank filename
nmap <leader>yfp :let @+ = expand("%")<CR>
nmap <leader>yfn :let @+ = expand("%:t")<CR>

" Shortcut to turn off syntax highlighting for matches
nmap <leader>n :noh<CR>

" Shortcut to format file as json with json.tool
nmap <leader>fj :%!python -m json.tool<CR>

" fzf
" Search filenames only
command! Filenames call fzf#run(fzf#wrap())
command! -bang -nargs=* GFilenames call fzf#vim#gitfiles(<q-args>, { 'options': ["-d", "/", "-n", "-1", "-m", "--prompt", "GFilenames\> ", "--preview", "head -$LINES {}"] }, <bang>0)
command! -bang -nargs=* TagsJump call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'}, <bang>0)
nmap <C-p> :GFilenames<CR>
nmap <C-l> :Files<CR>
nmap <leader>gs :GFiles?<CR>
nmap <C-]> :TagsJump<CR>


" easymotion, ugh
map f <Plug>(easymotion-fl)
map F <Plug>(easymotion-Fl)
map t <Plug>(easymotion-tl)
map T <Plug>(easymotion-Tl)

map yf y<Plug>(easymotion-fl)
map yF y<Plug>(easymotion-Fl)
map yt y<Plug>(easymotion-tl)
map yT y<Plug>(easymotion-Tl)

map df d<Plug>(easymotion-fl)
map dF d<Plug>(easymotion-Fl)
map dt d<Plug>(easymotion-tl)
map dT d<Plug>(easymotion-Tl)

map cf d<Plug>(easymotion-fl)
map cF c<Plug>(easymotion-Fl)
map ct c<Plug>(easymotion-tl)
map cT c<Plug>(easymotion-Tl)

let g:EasyMotion_smartcase = 1

nnoremap <Leader><Leader>f f
nnoremap <Leader><Leader>F F
nnoremap <Leader><Leader>t t
nnoremap <Leader><Leader>T T

nnoremap <Leader><Leader>yf yf
nnoremap <Leader><Leader>yF yF
nnoremap <Leader><Leader>yt yt
nnoremap <Leader><Leader>yT yT

nnoremap <Leader><Leader>df df
nnoremap <Leader><Leader>dF dF
nnoremap <Leader><Leader>dt dt
nnoremap <Leader><Leader>dT dT

" Functions to enable and disable word wrap
function! WordWrap()
	:set wrap
	:set linebreak
	nmap j gj
	nmap k gk
endfunction

function! NoWordWrap()
	:set nowrap
	:set nolinebreak
	nmap j j
	nmap k k
endfunction

nmap <leader>ww :call WordWrap()<CR>
nmap <leader>nww :call NoWordWrap()<CR>

command! GitlabUrl silent execute '!source ~/.zshrc && gitlab-url ' . expand('%') . ':' . line('.') . ' | pbcopy' | execute ':redraw!'


function! GitlabLog()
	if mode() == 'n' || mode() == 'v'
		silent execute '!echo ''git log -L' . line("'<") . ',' . line("'>") . ':' . expand('%') . ''' | pbcopy' | execute ':redraw!'
	else
		silent execute '!echo ''git log -L' . line(".") . ',' . line(".") . ':' . expand('%') . ''' | pbcopy' | execute ':redraw!'
	endif
endfunction

command! GitlabLog :call GitlabLog()

" Reload .vimrc
nmap <leader>rr :source $MYVIMRC<CR>

" Print full file path
nmap <leader>pwd :echo expand('%:p')<CR>

" Set YCM configuration file.
let g:ycm_global_ycm_extra_conf = '~/Dropbox/code/.ycm_extra_conf.py'
let g:syntastic_cpp_compiler_options = '-std=c++11 -Wall -Werror -Wextra -Wno-unused-variable -pedantic'

" Turn off weird JS autocompletion from YouCompleteMe
let g:ycm_filetype_specific_completion_to_disable = { 'javascript' : 1 }

" Turn off vim-session autosave prompt
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" Prefer ag for various things if available.
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ackprg = 'ag --vimgrep'

endif
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

" Turn on autocomplete
set omnifunc=syntaxcomplete#Complete
set completeopt+=longest,menuone
autocmd CompleteDone * pclose
inoremap <C-n> <c-x><c-o>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" vim-go window only show first error
let g:go_list_height = 2

" :W maps to w so if shift is still being held when typing w, it works
command! W w

" :Wsudo sudo saves the file 
command! Wsudo w !sudo tee % > /dev/null

" Switch CWD to the directory of the open buffer
map <leader>cd :Gcd<cr>:pwd<cr>

" Switch CWD to gitdir
map <leader>gcd :Gcd<cr>

