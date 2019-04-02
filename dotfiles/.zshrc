# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# history setting
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# set option
setopt extended_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_expire_dups_first
setopt hist_expand
setopt inc_append_history
setopt no_flow_control


# cdr enable
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# search command history
function peco-select-history {
  BUFFER=`history -n -r 1 | peco --query "$LBUFFER"`
  CURSOR=$#BUFFER
  zle reset-prompt
}

# search a destination from cdr list
function peco-get-destination-from-cdr() {
  cdr -l | \
  sed -e 's/^[[:digit:]]*[[:blank:]]*//' | \
  peco --query "$LBUFFER"
}

# search a destination from cdr list and cd the destination
function peco-cdr() {
  local destination="$(peco-get-destination-from-cdr)"
  if [ -n "$destination" ]; then
    BUFFER="cd $destination"
    zle accept-line
  else
    zle reset-prompt
  fi
}

zle -N peco-cdr
zle -N peco-select-history
bindkey '^e' peco-cdr
bindkey '^r' peco-select-history