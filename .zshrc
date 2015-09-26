autoload -U colors && colors
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*'
zstyle :compinstall filename '/home/joshsherick/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=5000
setopt appendhistory
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install

setopt extended_glob

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="white"; fi
PROMPT="%{$fg[$NCOLOR]%}%B%n%b@%m%{$reset_color%}:%{$fg[blue]%}%B%c%b%{$reset_color%} %(!.#.$) "
RPROMPT="[%*]"

# Easily scroll up and down through matches when searching history
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward


# Have LS always display colors
if ls --color -d ~ >/dev/null 2>&1; then
    alias ls="ls --color=auto" # GNU ls
elif ls -G -d ~ >/dev/null 2>&1; then
    export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
    alias ls="ls -G" # BSD ls
fi

export EDITOR='vim'

export LANG=en_US.UTF-8

export TERM="xterm-256color"

alias l="ls -la"
alias q="exit"

function mkcd
{
  command mkdir $1 && cd $1
}

# Run tmux if possible and necessary
if [ "$TMUX" = "" ]; then tmux attach || tmux new; fi

eval "`npm completion`"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
