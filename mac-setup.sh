# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install neovim
brew install neovim

# install neovim config
mkdir -p ~/.config/neovim/
cp neovim/* ~/.config/neovim/

# install fish and fisher
brew install fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# install Bass
fisher install bass

# copy fish functions
mkdir -p ~/.config/fish/functions
cp ./fish/config.fish ~/.config/fish/
cp ./fish/* ~/.config/fish/functions/

# install The Good Font
brew install font-jetbrains-mono-nerd-font
