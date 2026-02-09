#!/bin/bash

CWD=$(pwd)

#install prerequsites
sudo dnf update
#build tools
sudo dnf install -yy cmake
sudo dnf install -yy make
sudo dnf install -yy g++
#more languages
sudo dnf install -yy clang
sudo dnf install -yy rust cargo
sudo dnf install -yy clang-devel
sudo dnf install -yy python-devel
sudo dnf install -yy python-pip
sudo dnf install -yy lua
#editors
sudo dnf install -yy vim
sudo dnf install -yy neovim
#terminal lifeline
sudo dnf install -yy tmux
#general utilities
sudo dnf install -yy ImageMagick
sudo dnf install -yy glow
sudo dnf install -yy poppler
sudo dnf install -yy ffmpeg
sudo dnf install -yy jq yq
sudo dnf install -yy moreutils
sudo dnf install -yy asciinema
sudo dnf copr enable -y atim/lazydocker
sudo dnf install -yy lazydocker
#system stuff
sudo dnf install -yy fastfetch
sudo dnf install -yy dstat
sudo dnf install -yy progress
sudo dnf install -yy procs
#file system stuff
sudo dnf install -yy zoxide bat fd-find ripgrep fzf 7z iotop
#disk stuff
sudo dnf install -yy ncdu duf 
#network stuff
sudo dnf install -yy wget curl lshw mtr tshark ipcalc
#python stuff for system
sudo pip install tldr
sudo pip install bpytop
sudo pip install glances
sudo pip install uv
sudo pip install unp

#shells
sudo dnf install -yy fish
sudo dnf install -yy nu

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

#install mise
curl https://mise.run | sh

echo "install rust-analyzer and other utilities for lsp's"
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

#install playwright
echo "installing playwright"
npm install -g playwright
npx playwright install --with-deps

#install playwright mcp for claude
echo "installing playwright mcp server for claude"
npm install -g @playwright/mcp

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
mv *.zip nerf-fonts-vf/
cd nerd-fonts-vf
unzip Ubuntu.zip
unzip UbuntuMono.zip
unzip JetBrainsMono.zip
unzip FiraMono.zip
unzip FiraCode.zip
unzip AdwaitaMono.zip
unzip NerdFontsSymbolsOnly.zip
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
