source <(antibody init)
antibody bundle < ~/.config/zsh_plugins.txt

# Static loading, run this method on plugin change
# antibody bundle < ~/.config/zsh_plugins.txt > ~/.config/zsh_plugins.sh

source "${ZDOTDI:-$HOME}/.config/machine-setup/paths"
# Vim mode, small timeout
export KEYTIMEOUT=1


# Use vim mode
bindkey -v

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

### Spaceship config
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  char          # Prompt character
)
# Don't show empty line at begining
# SPACESHIP_PROMPT_ADD_NEWLINE=false
# Show whole path
SPACESHIP_DIR_TRUNC=0
# Show whole path in git repo
SPACESHIP_DIR_TRUNC_REPO=false
### End Spaceship config

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
