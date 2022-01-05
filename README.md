# dotfiles
My dots. I've provided a setup script for Debian-based systems that handles most of the setup.

My main editor is NeoVim, so you'll find a pretty complete setup there for it.

A neat feature of my setup script is that the installation of Neovim's plugin manager is handled in the configuration by packer, as is the LSP which is native. All you need to do is clone the config and place the `init.lua` and `lua` folder in `~/.config/nvim/` and install any language servers you want separately. After that, it _should_ just work, but who knows. 
