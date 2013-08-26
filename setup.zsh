#!/usr/bin/env zsh

GIT=$(which git)

cd ~

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

if [ ! -d .oh-my-zsh ]; then
    git clone git://github.com/lattera/oh-my-zsh.git .oh-my-zsh
fi

sed "s,__PLUGINS__,${1}," ~/dotfiles/zshrc.templ > ~/dotfiles/zshrc

ln -s ~/dotfiles/.freebsd_profile .profile
ln -s ~/dotfiles/.tmux.conf .tmux.conf
ln -s ~/dotfiles/zshrc .zshrc

if [ ! -d tmux/logs ]; then
    mkdir -p tmux/logs
fi