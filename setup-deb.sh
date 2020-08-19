# get oh my zsh
yes | sudo apt install zsh
yes | sudo apt install curl
yes | sudo apt install fortune 
yes | sudo apt install lolcat
yes | sudo apt install neofetch
yes | sudo apt install cowsay
yes | sudo apt install emacs

cp .vimrc ~/.vimrc
cp .zshrc ~/.zshrc
cp .emacs ~/.emacs

vim +PlugInstall &
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
