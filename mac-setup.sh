# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install emacs (doom)
brew tap d12frosted/emacs-plus
brew install emacs-plus@28

git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

# copy doom config over
cp ./emacs/* ~/.doom.d/

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

# install lambd prompt
fisher install hasanozgan/theme-lambda

# install patched font
brew install font-jetbrains-mono-nerd-font
