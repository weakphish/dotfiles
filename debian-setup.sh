# Get basic tools
yes | sudo apt update 
yes | sudo apt install fish curl tmux

# Copy vimrc
cp vimrc ~/.vimrc

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash &

# Install GVM
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer) &

# Get oh my fish 
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
