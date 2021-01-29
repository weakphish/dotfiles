# dotfiles
My dots. I've provided a setup script for Debian-based systems that handles most of the setup.

My main editor is NeoVim, so you'll find a pretty complete setup there for it.

A neat feature of my setup script is that the installation of Neovim's Plugin manager is automated so that you can pretty much just run the script, type PlugInstall in neovim and be up and running almost instantly. The only exception is that COC requires nodejs/npm which I left out of the install script due to size, and it not always being needed.
