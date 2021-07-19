# Get basic tools
yes | sudo apt install zsh curl neovim nvm

# Copy configs
mkdir ~/.config/nvim/
cp init.vim ~/.config/nvim/init.vim

cp ./.tmux.conf ~/

# Install neovim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Get oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Copy zsh config over
cp ./.zshrc ~/.zshrc

