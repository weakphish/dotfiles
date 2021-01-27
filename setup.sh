# Get basic tools
yes | sudo apt install zsh curl fortune lolcat neofetch neovim

# Copy configs
mkdir ~/.config/nvim/
cp init.vim ~/.config/nvim/init.vim

# Install neovim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Emacs
yes | sudo apt install emacs
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

cp ./.doom.d/* ~/.doom.d/*

# Copy zsh config over
cp .zshrc ~/.zshrc
# Get oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
