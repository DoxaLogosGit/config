#!/bin/bash

CWD=$(pwd)

#install prerequsites
sudo dnf update
sudo dnf install -yy python-dev
sudo dnf install -yy python-pip
sudo dnf install -yy wget
sudo dnf install -yy vifm
sudo dnf install -yy vim
sudo dnf install -yy ranger
sudo dnf install -yy curl
sudo dnf install -yy cmake
sudo dnf install -yy neovim
sudo dnf install -yy imagemagick
sudo dnf install -yy fd-find
sudo dnf install -yy glow
sudo dnf install -yy ripgrep
sudo dnf install -yy tmux
sudo dnf install -yy fzf
sudo dnf install -yy poppler
sudo dnf install -yy ffmpeg
sudo dnf install -yy clang
sudo dnf install -yy clang-devel
sudo dnf install -yy g++
sudo dnf install -yy jq
sudo dnf install -yy nu
sudo dnf install -yy zoxide
sudo dnf install -yy bat
sudo dnf install -yy fish
sudo dnf install -yy tmux

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
mkdir -p $HOME/.tmux/plugins
mkdir -p $HOME/.config/nushell

ln -s $CWD/nvim/ $HOME/.config/nvim
ln -s $CWD/yazi/ $HOME/.config/yazi
ln -s $CWD/pylintrc $HOME/.pylintrc
ln -s $CWD/nvim/vimfiles $HOME/.vim
ln -s $CWD/gitconfig $HOME/.gitconfig
ln -s $CWD/config.fish $HOME/.config/fish/config.fish
ln -s $CWD/config.nu $HOME/.config/nushell/config.nu
ln -s $CWD/starship.toml $HOME/.config/starship.toml

#setup tmux dependencies
mkdir -p $CWD/tmux-sensible
mkdir -p $CWD/tmux-resurrect
mkdir -p $CWD/tmux-continuum
mkdir -p $CWD/tmux-yank
mkdir -p $CWD/tmux-copycat
ln -s $CWD/tpm $HOME/.tmux/plugins/tpm
ln -s $CWD/tmux.conf $HOME/.tmux.conf


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
