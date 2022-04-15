# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install neovim
brew install neovim

# install neovim config
mkdir -p ~/.config/neovim/
cp neovim/* ~/.config/neovim/

# install fish and adjacent items
brew install fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# Install Bass
fisher install bass

# Copy fish functions
mkdir -p ~/.config/fish/functions
cp ./fish/config.fish ~/.config/fish/
cp ./fish/* ~/.config/fish/functions/

# Install The Good Font
brew install font-jetbrains-mono-nerd-font
