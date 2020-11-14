# Get basic tools
yes | sudo apt install zsh curl fortune lolcat neofetch neovim i3 i3status rofi

# Copy configs
cp i3 ~/.config/i3 -r
cp i3status ~/.config/i3status -r

mkdir ~/.config/sublime-text-3/Packages
cp ./User ~/.config/sublime-text-3/Packages/ -r

cp rofi ~/.config/rofi -r

cp .icons ~/.icons -r
cp .themes ~/.themes -r

mkdir ~/.config/nvim/
cp init.vim ~/.config/nvim/init.vim

# Install neovim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copy zsh config over
cp .zshrc ~/.zshrc
# Get oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
