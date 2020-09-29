# Get basic tools
yes | sudo apt install zsh curl fortune lolcat cowsay neofetch neovim

# Copy configs
cp i3 ~/.config/i3
cp i3status ~/.config/i3status
cp .icons ~/
cp .themes ~/
mkdir ~/.config/nvim/
cp init.vim ~/.config/nvim/init.vim

# Install neovim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copy zsh config over
cp .zshrc ~/.zshrc
# Get oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
