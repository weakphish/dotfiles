# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install neovim
brew install neovim

# install neovim config
mkdir -p ~/.config/neovim/
cp neovim/* ~/.config/neovim/

# install fish and adjacent items
brew install fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install lambda

# Install Bass
omf install bass

# Copy fish functions
mkdir -p ~/.config/fish/functions
cp ./fish/config.fish ~/.config/fish/
cp ./fish/* ~/.config/fish/functions/

# Install The Good Font
brew install font-jetbrains-mono-nerd-font
