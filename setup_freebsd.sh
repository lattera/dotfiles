#!/bin/sh

cd ~

GIT=$(which git)

rm -f .profile
rm -f .tmux.conf
rm -f .zshrc

if [ ! -d .vim ] && [ ! ${#GIT} -eq 0 ] || [ ! -f .vimrc ] ; then
    rm -f .vimrc
    rm -rf .vim
    git clone git://github.com/lattera/vimconfig.git .vim
    (
        cd .vim
        git submodule init
        git submodule update
        ln -s ~/.vim/vimrc ~/.vimrc
    )
fi

ln -s ~/dotfiles/.freebsd_profile .profile
ln -s ~/dotfiles/.tmux.conf .tmux.conf
ln -s ~/dotfiles/.zshrc .zshrc

if [ ! -d tmux/logs ]; then
    mkdir -p tmux/logs
fi
