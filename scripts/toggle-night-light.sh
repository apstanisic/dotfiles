#!/bin/sh

# There is no shortcut for toggling night light in gnome settings
# So this script toggles it for me. And in gnome settings I 
# simply have custom shortcut that executes this file
# Taken from
# https://www.reddit.com/r/gnome/comments/wiayth/comment/ijavjc8

nl='org.gnome.settings-daemon.plugins.color night-light-enabled'
gsettings set $nl $([ "$(gsettings get $nl)" = true ] && echo false || echo true)
