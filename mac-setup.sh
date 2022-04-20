# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install editor
brew install visual-studio-code

# install fish and fisher
brew install fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# install Bass
fisher install bass

# copy fish config and functions
mkdir -p ~/.config/fish/functions
cp ./fish/config.fish ~/.config/fish/
cp ./fish/functions/* ~/.config/fish/functions/

# install tide prompt
fisher install hasanozgan/theme-lambda
