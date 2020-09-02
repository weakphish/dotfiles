# get oh my zsh
yes | sudo pacman -S zsh curl ttf-fira-code fortune cowsay lolcat neofetch rofi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp .vim ~/.vim -rf
cp .vimrc ~/.vimrc
cp .zshrc ~/.zshrc
cp i3 ~/.config/ -rf
cp i3status ~/.config/ -rf
cp config.rasi ~/.config/rofi

vim +PlugInstall
