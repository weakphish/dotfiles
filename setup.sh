# Get basic tools
yes | sudo apt install zsh curl fortune lolcat neofetch neovim i3 i3status rofi

# Copy configs
cp i3 ~/.config/i3 -r
cp i3status ~/.config/i3status -r

cp rofi ~/.config/rofi -r

mkdir ~/.config/nvim/
cp init.vim ~/.config/nvim/init.vim

cp ./.ideavimrc ~/.ideavimrc

# Install neovim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Emacs
sudo apt install emacs
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
yes | ~/.emacs.d/bin/doom install
cp ./doom.d/* ~/.doom.d/ -r
./emacs.d/bin/doom sync

# Copy zsh config over
cp .zshrc ~/.zshrc
# Get oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
