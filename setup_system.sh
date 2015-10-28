#!/bin/bash

CWD=$(pwd)

ln -s $CWD/vimrc $HOME/.vimrc
ln -s $CWD/vimfiles $HOME/.vim
ln -s $CWD/gitconfig $HOME/.gitconfig
ln -s $CWD/tmux.conf $HOME/.tmux.conf
ln -s $CWD/zshrc $HOME/.zshrc
mkdir -p $HOME/.tmux/plugins
ln -s $CWD/tpm $HOME/.tmux/plugins/tpm
ln -s $CWD/tmux-sensible $HOME/.tmux/plugins/tmux-sensible

pushd vimfiles/bundle/YouCompleteMe
git submodule update --init  --recursive
./install.sh --clang-completer 
popd
