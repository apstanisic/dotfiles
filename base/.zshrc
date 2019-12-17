source <(antibody init)
antibody bundle < ~/.config/zsh_plugins.txt

# Static loading, run this method on plugin change
# antibody bundle < ~/.config/zsh_plugins.txt > ~/.config/zsh_plugins.sh

source "${ZDOTDI:-$HOME}/.config/paths"
# Vim mode, small timeout
export KEYTIMEOUT=1


# Use vim mode
bindkey -v

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
# enable approximate matches for completion
zstyle ':completion:::::' completer _expand _complete _ignored _approximate 

### Spaceship config
#SPACESHIP_PROMPT_ORDER=(
#  user          # Username section
#  dir           # Current directory section
#  git           # Git section (git_branch + git_status)
#  exec_time     # Execution time
#  line_sep      # Line break
#  char          # Prompt character
#)

# Don't show empty line at begining
# SPACESHIP_PROMPT_ADD_NEWLINE=false
# Show whole path
#SPACESHIP_DIR_TRUNC=0
# Show whole path in git repo
#SPACESHIP_DIR_TRUNC_REPO=false
### End Spaceship config





#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"

if [[ $TILIX_ID ]]; then
        source /etc/profile.d/vte-2.91.sh
fi


