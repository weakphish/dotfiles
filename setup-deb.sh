# get oh my zsh
yes | sudo apt install zsh
yes | sudo apt install curl
yes | sudo apt install fortune 
yes | sudo apt install lolcat
yes | sudo apt install neofetch
yes | sudo apt install cowsay

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp .vim ~/.vim -rf
cp .vimrc ~/.vimrc
cp .zshrc ~/.zshrc

vim +PlugInstall
