#!/bin/bash

CWD=$(pwd)

ln -s $CWD/vimrc $HOME/.vimrc
ln -s $CWD/vimfiles $HOME/.vim
ln -s $CWD/gitconfig $HOME/.gitconfig
pushd vimfiles/bundle/YouCompleteMe
git submodule update --init  --recursive
./install.sh --clang-completer 
popd
#ln -s $CWD/pam_environment $HOME/.pam_environment
#ln -s $CWD/screenrc $HOME/.screenrc

#touch ~/.bashrc

#if ! grep -Fq "$CWD/bashrc" ~/.bashrc
#then
#    echo "" >> ~/.bashrc
#    echo "# Added by jhood's config setup" >> ~/.bashrc
#    echo "source $CWD/bashrc" >> ~/.bashrc
#fi

