# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install neovim
brew install neovim

# copy neovim config over
mkdir -p ~/.config/nvim/
cp -R ./nvim/* ~/.config/nvim/

# install fish and fisher
brew install fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# install bass
fisher install bass

# copy fish config and functions
mkdir -p ~/.config/fish/functions
cp ./fish/config.fish ~/.config/fish/
cp ./fish/functions/* ~/.config/fish/functions/

# install prompt
# fisher install hasanozgan/theme-lambda
fisher install IlanCosman/tide@v5

# install patched font
brew install font-jetbrains-mono-nerd-font
