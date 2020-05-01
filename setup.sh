# get oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp .vim ~/.vim -rf
cp .vimrc ~/,vimrc
cp .zshrc ~/.zshrc

vim +PlugInstall
