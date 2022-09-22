#!/bin/bash

# First param from script (script.bash FiraCode) 
font_name=$1
# Nerd Fonts repo location
nf_repo=/tmp/nerd-fonts
# All fonts location
dest_folder=$HOME/.local/share/fonts
# Where are all relevant fonts located
src_folder=$nf_repo/src/unpatched-fonts/$font_name

# Ensure that we font files on machine (it requires that we already have sparse repo)
git -C $nf_repo sparse-checkout add src/unpatched-fonts/$font_name

# All files that end with .ttf or otf (ignore case)
files=$(find $src_folder -iname "*.ttf" -or -iname "*.otf" )

# Remove old fonts
rm -rf $dest_folder/$font_name
# create dir
mkdir -p $dest_folder/$font_name

# For every font path
for current_path in $files; do
    # get only font name
    font_type=$(basename $current_path)
    # Add copy that font to fonts/font_name/font_type
    cp $current_path "$dest_folder/$font_name/$font_type"
done
