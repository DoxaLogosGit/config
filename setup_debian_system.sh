#!/bin/bash

CWD=$(pwd)

#install prerequsites
sudo apt-get update
sudo apt-get install -yy python-dev
sudo apt-get install -yy python-pip
sudo apt-get install -yy python3-dev
sudo apt-get install -yy python3-pip
sudo apt-get install -yy python3-venv
sudo apt-get install -yy build-essential
sudo apt-get install -yy wget
sudo apt-get install -yy vifm
sudo apt-get install -yy ranger
sudo apt-get install -yy curl
sudo apt-get install -yy cmake
sudo apt-get install -yy vim-gtk
sudo apt-get install -yy neovim
sudo apt-get install -yy glow
sudo apt-get install -yy nu
sudo apt-get install -yy bat
sudo apt=get install -yy ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide imagemagick
sudo apt-get install -yy fish
sudo apt-get install -yy python3-nose
sudo apt-get install -yy tmux
sudo apt-get install -yy clang

cd config
pip3 install --user neovim
pip3 install --user pynvim
pip install --user pynvim
pip install --user neovim
sudo pip3 install -yy tldr

#install starship
sudo curl -sS https://starship.rs/install.sh | sh

#install yazi
wget https://github.com/sxyazi/yazi/releases/download/v25.4.8/yazi-x86_64-unknown-linux-gnu.zip
unzip yazi-x86_64-unknown-linux-gnu.zip
sudo mv yazi-x86_64-unknown-linux-gnu/yazi /usr/bin/
rm -rf yazi-x86_64-unknown-linux-gnu*

#install eza 
wget https://github.com/eza-community/eza/releases/download/v0.21.1/eza_x86_64-unknown-linux-gnu.zip
unzip eza_x86_64-unknown-linux-gnu.zip
sudo mv eza /usr/bin/
rm -rf eza*

mkdir -p $HOME/.vim-tmp
mkdir -p $HOME/.tmp
mkdir -p $HOME/.config/fish

ln -s $CWD/nvim/ $HOME/.config/nvim
ln -s $CWD/yazi  $HOME/.config/yazi
ln -s $CWD/pylintrc $HOME/.pylintrc
ln -s $CWD/nvim/vimfiles $HOME/.vim
ln -s $CWD/gitconfig $HOME/.gitconfig
ln -s $CWD/tmux.conf $HOME/.tmux.conf
ln -s $CWD/config.fish $HOME/.config/fish/config.fish
ln -s $CWD/starship.toml $HOME/.config/starship.toml

mkdir -p $HOME/.tmux/plugins
mkdir -p $CWD/tmux-sensible
mkdir -p $CWD/tmux-resurrect
mkdir -p $CWD/tmux-continuum
mkdir -p $CWD/tmux-yank
mkdir -p $CWD/tmux-copycat
ln -s $CWD/tpm $HOME/.tmux/plugins/tpm



#pull rest of submodules
cd config
git submodule init
git submodule update

echo 'remember to download nerd-fonts! https://www.nerdfonts.com/font-downloads'


#add this to bottom of your bashrc if on Ubuntu App for Windows 10, else just change your shell with chsh
#if [ -t 1 ]; then
#      exec fish
#fi

#do this below after you run setup system (issues with it until fish is default shell
#cd ~/
#install oh-my-fish
#git clone https://github.com/oh-my-fish/oh-my-fish
#cd oh-my-fish
#bin/install --offline
