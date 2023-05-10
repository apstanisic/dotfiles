#!/bin/sh

# Taken from
# https://www.reddit.com/r/gnome/comments/wiayth/comment/ijavjc8
nl='org.gnome.settings-daemon.plugins.color night-light-enabled'
gsettings set $nl $([ "$(gsettings get $nl)" = true ] && echo false || echo true)
