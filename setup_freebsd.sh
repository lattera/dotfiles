#!/bin/sh

cd ~

rm -f .vimrc
rm -f .profile
rm -f .tmux.conf

ln -s ~/dotfiles/.vimrc .vimrc
ln -s ~/dotfiles/.freebsd_profile .profile
ln -s ~/dotfiles/.tmux.conf .tmux.conf
