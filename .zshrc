export ZSH=/Users/mufasa/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time)
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"
POWERLEVEL9K_COLOR_SCHEME='light'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source ~/.fonts/*.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias dc="docker-compose"
alias unset_dinghy="unset DOCKER_HOST && unset DOCKER_CERT_PATH && unset DOCKER_TLS_VERIFY && unset DOCKER_MACHINE_NAME"
alias brew="env PATH=${PATH/\/Users\/mufasa\/\.pyenv:/} brew"

function select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle -R -c
}
zle -N select-history
bindkey '^r' select-history

alias -g lb='`git branch | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
