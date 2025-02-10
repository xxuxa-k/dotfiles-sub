if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

path=(
  $(brew --prefix)/opt/curl/bin
  $(brew --prefix)/opt/openjdk/bin
  $HOME/slack-cli/bin
  $HOME/go/bin
  $HOME/.asdf/shims
  $path
)
fpath=(
  ${ASDF_DIR}/completions
  $(brew --prefix)/share/zsh-completions
  $fpath
)

export EDITOR=nvim
export GIT_EDITOR=nvim

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export TERM=xterm-256color

eval "$(thefuck --alias)"
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

autoload -Uz compinit bashcompinit 
compinit bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

alias ll="eza -ahl --git"
alias nv="nvim"
alias beep="afplay /System/Library/Sounds/Ping.aiff"

function peco-src() {
emulate -L zsh
setopt localoptions pipefail

local repo
repo=$(ghq list | peco --query "$LBUFFER") || return 1

if [[ -n "$repo" ]]; then
  local full_path
  full_path=$(ghq list --full-path --exact "$repo") || return 1

  if [[ ! -d "$full_path" ]]; then
    echo "Error: Directory does not exist: $full_path" >&2
    return 1
  fi

  BUFFER="cd ${(q)full_path}"
  zle accept-line
fi
zle clear-screen
}

function peco-select-history() {
emulate -L zsh
setopt localoptions pipefail

local selected
selected=$(fc -ln 1 | awk '!seen[$0]++' | peco --query "$LBUFFER") || return 1

if [[ -n "$selected" ]]; then
  BUFFER="${selected}"
  CURSOR=$#BUFFER
  zle reset-prompt
fi
}

zle -N peco-src
zle -N peco-select-history

bindkey '^]' peco-src
bindkey '^r' peco-select-history
