#!/bin/bash

# This script assumes that fish-shell is installed via Homebrew and is set
# as the default shell.

# install omf
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# install fzf
brew install fzf

# install helix
brew install helix