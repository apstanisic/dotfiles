#!/bin/sh

. ./big-echo.sh

# check if ssh file exists
# use existing if exist
# create new if does not
if [ -e $HOME/.ssh/id_ed25519 ]
then
  BigEcho "Using existing SSH key"
else
  BigEcho "Creating new SSH key"
  ssh-keygen -t ed25519 -C "aleksandar@tuta.io" -f ~/.ssh/id_ed25519
fi

# add to ssh agent
eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/id_ed25519


