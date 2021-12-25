# Start configuration added by Zim install {{{
#
# User configuration sourced by all invocations of the shell
#

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
# }}} End configuration added by Zim install


# PATHS
if [ -e $HOME/.config/paths ]; then . $HOME/.config/paths; fi # cargo

# ALIASES
if [ -e $HOME/.config/aliases ]; then . $HOME/.config/aliases; fi # cargo

# CARGO
if [ -e $HOME/.cargo/env ]; then . $HOME/.cargo/env; fi # cargo

# NIX
if [ -e /home/aleksandar/.nix-profile/etc/profile.d/nix.sh ]; then . /home/aleksandar/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
