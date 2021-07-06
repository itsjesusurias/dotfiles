#!/usr/bin/env bash

# Copy paste this file in bit by bit.
# Don't run it.

echo "Do not run this script in one go. Hit Ctrl-C NOW"
# read -n 1

###############################################################################
# Backup old machine's dotfiles                                               #
###############################################################################

mkdir -p ~/migration/home
cd ~/migration

# then compare brew-list to what's in `brew.sh`
#   comm <(sort brew-list.txt) <(sort brew.sh-cleaned-up)

# let's hold on to these

mkdir -p ~/migration/home
cd ~/migration

# Check the platform
if [ "$(uname)" == "Darwin" ]; then
  . $HOME/dotfiles/install/mac/setup.sh 
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  . $HOME/dotfiles/install/linux/setup.sh
fi