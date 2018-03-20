# 日本語を使用
export LANG=ja_JP.UTF-8

# パスを追加したい場合
export PATH="$HOME/bin:$PATH"

# 色を使用
autoload -Uz colors
colors

# 補完
autoload -Uz compinit
compinit

# 他のターミナルとヒストリーを共有
setopt share_history

# ヒストリに重複を表示しない
setopt histignorealldups

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# ヒストリ設定
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# 自動でpushdを実行
setopt auto_pushd

# pushdから重複を削除
setopt pushd_ignore_dups

# コマンドミスを修正
setopt correct

# グローバルエイリアス
alias -g L='| less'
alias -g H='| head'
alias -g G='| grep'
alias -g GI='| grep -ri'
alias la='ls -la'
alias dc='docker compose'

# コマンドラインの編集モードをViにする
bindkey -v

# バックスペースキーで文字を削除する
bindkey -v '^?' backward-delete-char

# Shift-Tabで候補を逆順に補完する
bindkey '^[[Z' reverse-menu-complete

# cdの後にlsを実行
chpwd() { ls -la --color=auto }

# どこからでも参照できるディレクトリパス
cdpath=(~)

# Ctrl+sのロック, Ctrl+qのロック解除を無効にする
setopt no_flow_control

# 補完後、メニュー選択モードになり左右キーで移動が出来る
zstyle ':completion:*:default' menu select=2

# 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Ctrl+rでヒストリーのインクリメンタルサーチ、Ctrl+sで逆順
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

# コマンドを途中まで入力後、historyから絞り込み
# 例 ls まで打ってCtrl+pでlsコマンドをさかのぼる、Ctrl+bで逆順
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^b" history-beginning-search-forward-end

# cdrコマンドを有効 ログアウトしても有効なディレクトリ履歴
# cdr タブでリストを表示
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
# cdrコマンドで履歴にないディレクトリにも移動可能に
zstyle ":chpwd:*" recent-dirs-default true

# VCSの情報を取得するzsh関数
autoload -Uz vcs_info
autoload -Uz colors # black red green yellow blue magenta cyan white
colors

# PROMPT変数内で変数参照
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{green}!" #commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+" #add されていないファイルがある
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f" #通常
zstyle ':vcs_info:*' actionformats '[%b|%a]' #rebase 途中,merge コンフリクト等 formats 外の表示

# %b ブランチ情報
# %a アクション名(mergeなど)
# %c changes
# %u uncommit

# プロンプト表示直前に vcs_info 呼び出し
precmd () { vcs_info }

# プロンプト（左）
PROMPT='%{$fg[red]%}[%n@%m]%{$reset_color%}'
PROMPT=$PROMPT'${vcs_info_msg_0_} %{${fg[red]}%}%}$%{${reset_color}%} '

# プロンプト（右）
RPROMPT='%{${fg[red]}%}[%~]%{${reset_color}%}'

if [ -s "/usr/local/bin/dinghy" ] ; then
  alias dm="dinghy"
  alias dm-start="dinghy start && eval \"\$(dinghy shellinit)\""
  alias dm-restart="dinghy restart && eval \"\$(dinghy shellinit)\""
  alias dm-env="eval \"\$(dinghy shellinit)\""
else
  alias dm="docker-machine"
  alias dm-start="docker-machine start default && eval \"\$(docker-machine env default)\""
  alias dm-restart="docker-machine restart default && eval \"\$(docker-machine env default)\""
  alias dm-env="eval \"\$(docker-machine env default)\""
fi
