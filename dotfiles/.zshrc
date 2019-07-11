source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

source "${ZDOTDI:-$HOME}/.config/machine-setup/paths"
# Vim mode, small timeout
export KEYTIMEOUT=1

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
