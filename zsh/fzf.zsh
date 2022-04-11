# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

if [[ ! "$PATH" == *$HOME/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
if [[ -d /usr/local/opt/fzf/shell ]]; then
  [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
  source "/usr/local/opt/fzf/shell/key-bindings.zsh"
elif [[ -d $HOME/opt/fzf/shell ]]; then
  [[ $- == *i* ]] && source "$HOME/opt/fzf/shell/completion.zsh" 2> /dev/null
  source "$HOME/opt/fzf/shell/key-bindings.zsh"
fi

