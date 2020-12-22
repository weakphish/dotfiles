# Get basic tools
yes | sudo apt install neovim

mkdir ~/.config/nvim/
cp init.vim ~/.config/nvim/init.vim

# Install neovim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


