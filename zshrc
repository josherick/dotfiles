autoload -U colors && colors

zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*'
zstyle :compinstall filename '/home/joshsherick/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt incappendhistory
setopt histignoredups
setopt autocd
setopt ignoreeof
unsetopt beep
bindkey -e

# Edit in vim with C-e C-e
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^e^e" edit-command-line


setopt extended_glob

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="white"; fi
PROMPT="%F{024}%B%n%b%{$reset_color%}:%F{255}%B%c%b%{$reset_color%} %(!.#.$) "
RPROMPT="[%*]"

# Easily scroll up and down through matches when searching history
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

bindkey "^L" forward-word
bindkey "^H" backward-word

bindkey "^W" forward-word
bindkey "^B" backward-word


# Have LS always display colors
if ls --color -d ~ >/dev/null 2>&1; then
    alias ls="ls --color=auto" # GNU ls
elif ls -G -d ~ >/dev/null 2>&1; then
    export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
    alias ls="ls -G" # BSD ls
fi

export EDITOR='vim'

export LANG=en_US.UTF-8

setopt AUTO_PUSHD

if [ -d $HOME/.local ]; then
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/.local/lib"
    export PATH="$PATH:$HOME/.local/bin"
fi

if [ -d /usr/local/bin ]; then
    export PATH="$PATH:/usr/local/bin"
fi

export TERM="screen-256color"

alias l="ls -la"
alias q="exit"
alias git-graph='git log --graph --oneline --decorate --date=relative --all'
alias gitdir='git rev-parse --show-toplevel'
cdgit() { cd $(gitdir)/$1 }

if [[ -d /usr/local/share/zsh-completions ]]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

if [[ -d $HOME/.zsh ]]; then
    fpath=($HOME/.zsh $fpath)
fi


mkcd() { mkdir $1 && cd $1 }

# Run tmux if possible and necessary
if [ "$TMUX" = "" ]; then tmux attach || tmux new; fi

# Enable npm completion if it's installed
command -v npm >/dev/null 2>&1 && eval "`npm completion`"

export PATH="$PATH:/usr/local/go/bin"

# Create a vimin function to accept files to be piped into vim, whether we are
# using BSD xargs or GNU xargs
if eval "true | xargs -o true > /dev/null 2>&1"; then
    # BSD
    vimin() { xargs -o vim }
else
    # GNU
    vimin() { xargs sh -c 'vim "$@" < /dev/tty' vim; }
fi

ZSH_DIR="$HOME/.zsh"

if [ -d "$ZSH_DIR/device-specific" ]; then
    for f in $ZSH_DIR/device-specific/*; do source $f; done
fi

if [ -f "$ZSH_DIR/git_prompt.zsh" ]; then
    source "$ZSH_DIR/git_prompt.zsh"
fi

if [ -f "$ZSH_DIR/fzf.zsh" ] && (( $+commands[fzf] )); then
    source "$ZSH_DIR/fzf.zsh"
    export FZF_DEFAULT_COMMAND='rg --files --color never'
    sg() {
        # Based off of http://owen.cymru/sf-a-quick-way-to-search-for-some-thing-in-bash-and-edit-it-with-vim-2/
        if [ "$#" -lt 1 ]; then echo "Supply a search string."; return 1; fi
        SEARCH=$@
        RG_COMMAND='rg --column --line-number --no-heading --smart-case --follow --color always'
        AG_COMMAND='ag --column --line-number --no-heading --color --no-break'
        SEARCH_COMMAND="$AG_COMMAND $SEARCH"
        FILES=`eval $SEARCH_COMMAND | fzf --ansi --multi --reverse --height=40 | awk -F ':' '{print "\""$1":"$2":"$3"\""}' | tr '\n' ' '`
        if [[ -n "$FILES" ]]; then eval "vim $FILES"; fi
    }
fi
