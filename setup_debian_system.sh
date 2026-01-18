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
sudo apt-get install -yy curl
sudo apt-get install -yy cmake
sudo apt-get install -yy vim-gtk
sudo apt-get install -yy neovim
sudo apt-get install -yy glow
sudo apt-get install -yy nu
sudo apt-get install -yy lua
sudo apt-get install -yy bat
sudo apt-get install -yy ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide imagemagick
sudo apt-get install -yy fish
sudo apt-get install -yy python3-nose
sudo apt-get install -yy tmux
sudo apt-get install -yy clang
sudo apt-get install -yy rust cargo
sudo pip3 install -yy tldr

#install starship
sudo curl -sS https://starship.rs/install.sh | sh

echo "install rust-analyzer and other lsp support utils"
mkdir -p ~/.local/bin
curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer
pip install jedi_language_server
pip install flake8
pip install vale

#install node.js using nvm
echo "installing node.js via nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts
nvm use --lts

#install bun
echo "installing bun"
curl -fsSL https://bun.sh/install | bash

#install claude cli
echo "installing claude cli"
npm install -g @anthropic-ai/claude-code

#install gemini cli
echo "installing gemini cli"
npm install -g @google/generative-ai

#install codex
echo "installing codex"
npm install -g @openai/codex

#install get shit done
echo "installing get-shit-done"
npm install -g get-shit-done

#install opencode
echo "installing opencode"
npm install -g opencode-ai@latest

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
mkdir -p $HOME/.config/nushell

ln -s $CWD/nvim/ $HOME/.config/nvim
ln -s $CWD/yazi  $HOME/.config/yazi
ln -s $CWD/pylintrc $HOME/.pylintrc
ln -s $CWD/nvim/vimfiles $HOME/.vim
ln -s $CWD/gitconfig $HOME/.gitconfig
ln -s $CWD/tmux.conf $HOME/.tmux.conf
ln -s $CWD/config.fish $HOME/.config/fish/config.fish
ln -s $CWD/config.nu $HOME/.config/nushell/config.nu
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

#do this below after you run setup system (issues with it until fish is default shell
#cd ~/
#install oh-my-fish
#git clone https://github.com/oh-my-fish/oh-my-fish
#cd oh-my-fish
#bin/install --offline
