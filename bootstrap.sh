#!/bin/bash

# Bootstrap homebrew and fish shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install fish
fish
fish_add_path /opt/homebrew/bin
which fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish


# This script assumes that fish-shell is installed via Homebrew and is set
# as the default shell.

# install omf
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# install fzf
brew install fzf

# install helix
brew install helix