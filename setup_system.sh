#!/bin/bash

CWD=$(pwd)

#install prerequsites
sudo apt-get update
sudo apt-get install -yy python-dev
sudo apt-get install -yy python-pip
sudo apt-get install -yy python3-dev
sudo apt-get install -yy python3-pip
sudo apt-get install -yy build-essential
sudo apt-get install -yy wget
sudo apt-get install -yy vifm
sudo apt-get install -yy ranger
sudo apt-get install -yy curl
sudo apt-get install -yy cmake
sudo apt-get install -yy vim-gtk
cd $HOME
#install newer neovim (Ubuntu 18.04)
wget https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
sudo ln -s $HOME/squashfs-root/usr/bin/nvim /usr/bin/nvim


cd config
sudo apt-get install -yy fish
sudo apt-get install -yy python3-nose
sudo apt-get install -yy tmux
sudo apt-get install -yy clang
pip3 install --user neovim
pip3 install --user pynvim
pip install --user pynvim
pip install --user neovim

mkdir -p $HOME/.config/nvim/bundle
ln -s $CWD/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s $CWD/nvim/colors $HOME/.config/nvim/colors

ln -s $CWD/pylintrc $HOME/.pylintrc
ln -s $CWD/nvim/vimfiles $HOME/.vim
ln -s $CWD/gitconfig $HOME/.gitconfig
ln -s $CWD/tmux.conf $HOME/.tmux.conf
ln -s $CWD/fishrc $HOME/.fishrc
mkdir -p $HOME/.tmux/plugins
mkdir -p $CWD/tmux-sensible
mkdir -p $CWD/tmux-resurrect
mkdir -p $CWD/tmux-continuum
mkdir -p $CWD/tmux-yank
mkdir -p $CWD/tmux-copycat
ln -s $CWD/tpm $HOME/.tmux/plugins/tpm
ln -s $CWD/nvim $HOME/.config/nvim

#install ripgrep (better recursive search utility -- super fast!)
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
rm ripgrep*

#install neovim plugin manager
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh $HOME/.config/nvim/bundle
rm installer.sh

#pull rest of submodules
cd config
git submodule init
git submodule update


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
