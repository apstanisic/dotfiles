#!/usr/bin/zsh

#
# Added to scripts since I need to run it with topgrade
# It's a problem to inline it, since I need to source znap
# So it's simpler to simply execute this zsh script
#

source ~/.znap/zsh-snap/znap.zsh  # Start Znap
znap pull
# Causes problems for some reason
# znap compile
