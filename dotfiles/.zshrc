# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

###############################################################################
# Variables                                                                   #
###############################################################################
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000


###############################################################################
# Set options                                                                 #
###############################################################################
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


###############################################################################
# Functions                                                                   #
###############################################################################
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

### peco&ssh
function peco-ssh () {
  local selected_host=$(awk '
  tolower($1)=="host" {
    for (i=2; i<=NF; i++) {
      if ($i !~ "[*?]") {
        print $i
      }
    }
  }
  ' ~/.ssh/conf.d/**/config_* | sort | peco --query "$LBUFFER")
  if [ -n "$selected_host" ]; then
    BUFFER="ssh -A ${selected_host}"
    zle accept-line
  fi
  zle clear-screen
}

zle -N peco-ssh
zle -N peco-cdr
zle -N peco-select-history

bindkey '^e' peco-cdr
bindkey '^r' peco-select-history
bindkey '^s' peco-ssh

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
# The next line updates PATH for the Google Cloud SDK
if [ -f '/Users/mufasa/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mufasa/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.$
if [ -f '/Users/mufasa/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mufasa/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(direnv hook zsh)"

# goenv
export GOPATH=$HOME/go
export GOENV_ROOT=$HOME/.goenv
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# flutter
export PATH="$HOME/flutter/bin:$PATH"
export PATH="$HOME/.pub-cache/bin:$PATH"


###############################################################################
# Alias                                                                       #
###############################################################################
alias g='cd $(ghq root)/$(ghq list | peco)'
