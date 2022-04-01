# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Copy vim config
cp vimrc ~/.vimrc

# Copy VS Code config (FIXME assumes the correct path which should be fixed)
cp ./vs-code/* /Users/weakphish/Library/Application\ Support/Code/User/

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash &

# Install GVM
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer) &

# install fish and adjacent items
brew install fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install lambda

# Install Bass
omf install bass

# Copy fish functions
mkdir -p ~/.config/fish/functions
cp ./fish/* ~/.config/fish/functions

# Install The Good Font
brew install font-jetbrains-mono-nerd-font
