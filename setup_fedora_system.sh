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
sudo dnf install -yy lua
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
sudo dnf install -yy rust cargo
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
mkdir -p $HOME/.local/share/nvim/plugged

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

echo 'Downloading fonts from https://www.nerdfonts.com/font-downloads'
echo 'If installing on WSL, these need to be install on the Windows side and font updated in WSL profile'
mkdir fonts
cd fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Ubuntu.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/UbuntuMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/NerdFontsSymbolsOnly.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/AdwaitaMono.zip
mkdir nerd-fonts-vf
mv *.zip nerf-fonts-vf
cd nerd-fonts-vf
unzip -o Ubuntu.zip
unzip -o UbuntuMono.zip
unzip -o JetBrainsMono.zip
unzip -o FiraMono.zip
unzip -o FiraCode.zip
unzip -o AdwaitaMono.zip
unzip -o NerdFontsSymbolsOnly.zip
cd ..
mkdir -p ~/.local/share/fonts
mkdir -p ~/.local/share/fontconfig/conf.avail
mv nerd-fonts-vf/*.conf ~/.local/share/fontconfig/conf.avail
mv nerd-fonts-vf ~/.local/share/fonts
fc-cache -vf
cd 
#add this to bottom of your bashrc if on Ubuntu App for Windows 10, else just change your shell with chsh
#if [ -t 1 ]; then
#      exec fish
#fi

echo "Don't forget to setup fish and oh-my-fish"
echo "chsh"
echo "/usr/bin/fish"
echo "reset"
#do this below after you run setup system (issues with it until fish is default shell
#install oh-my-fish
echo "cd ~/"
echo "git clone https://github.com/oh-my-fish/oh-my-fish"
echo "cd oh-my-fish"
echo "bin/install --offline"
