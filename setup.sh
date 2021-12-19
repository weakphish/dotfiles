# Get basic tools
yes | sudo apt install zsh curl tmux ripgrep

# Copy configs
mkdir ~/.config
mkdir ~/.config/nvim/
cp init.vim ~/.config/nvim/init.vim
cp ./.zshrc ~/.zshrc
cp ./.tmux.conf ~/

# Install neovim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash &

# Install GVM
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer) &

# Get oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
