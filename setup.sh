# Get basic tools
yes | sudo apt install zsh curl tmux

# Copy configs
mkdir ~/.config
mkdir ~/.config/nvim/
cp init.vim ~/.config/nvim/init.vim
cp ./.zshrc ~/.zshrc
cp ./.tmux.conf ~/

# Install neovim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Get oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
