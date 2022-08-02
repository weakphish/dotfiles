#!/bin/bash

# Bare Vim
ln -s ~/.dotfiles/.vimrc ~/.vimrc

# zshrc - dependent on oh-my-zsh
ln -s ~/.dotfiles/.zshrc ~/.zshrc

# .config directory
ln -s ~/.dotfiles/.config/ ~/.config

# Doom Emacs
ln -s ~/.dotfiles/.doom.d ~/.doom.d
