# get oh my zsh
sudo pacman -S zsh
sudo pacman -S curl
sudo pacman -S ttf-fira-code
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp .vim ~/.vim -rf
cp .vimrc ~/.vimrc
cp .zshrc ~/.zshrc

vim +PlugInstall
