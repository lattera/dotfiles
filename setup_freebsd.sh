#!/bin/sh

cd ~

rm -f .vimrc
rm -f .profile

ln -s ~/dotfiles/.vimrc .vimrc
ln -s ~/dotfiles/.freebsd_profile .profile
