# Get basic tools
yes | sudo pacman -Syu 
yes | sudo pacman -Sy fish curl tmux ripgrep

# Copy Neovim configuration
mkdir ~/.config
mkdir ~/.config/nvim/
cp init.lua ~/.config/nvim/init.lua
cp lua/ ~/.config/nvim/ -r

# Copy Zsh config
cp ./.zshrc ~/.zshrc

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash &

# Install GVM
omf install https://github.com/JGAntunes/fish-gvm
omf install https://github.com/edc/bass

# Get oh my fish 
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
