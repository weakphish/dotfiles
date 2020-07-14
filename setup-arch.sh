# get oh my zsh
yes | sudo pacman -S zsh
yes | sudo pacman -S curl
yes | sudo pacman -S ttf-fira-code
yes | sudo pacman -S fortune
yes | sudo pacman -S cowsay
yes | sudo pacman -S lolcat
yes | sudo pacman -S neofetch

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp .vim ~/.vim -rf
cp .vimrc ~/.vimrc
cp .zshrc ~/.zshrc

vim +PlugInstall
