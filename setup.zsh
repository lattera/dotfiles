#!/usr/bin/env zsh

GIT=$(which git)
os=$(uname)
os=${os:l}

cd ~

rm -f .profile
rm -f .tmux.conf
rm -f .zshrc
rm -f .i3/config
rm -f .i3status.conf
rm -f .muttrc

if [ ! -d .mutt ]; then
    mkdir -p .mutt/cache/headers/../bodies
    touch .mutt/certificates
    touch .mutt/credentials
    touch .mutt/folders
    touch .mutt/aliases
fi

if [ ! -d .oh-my-zsh ]; then
    git clone https://github.com/lattera/oh-my-zsh.git .oh-my-zsh
fi

plugins=""
while getopts 'p:' o; do
	case "${o}" in
	p)
		if [ ! -d .oh-my-zsh/plugins/${OPTARG} ]; then
			echo "Warning: oh-my-zsh plugin ${OPTARG} not found"
		fi

		plugins="${plugins} ${OPTARG}"
		;;
	*)
		echo "USAGE: ${0} [-p plugin]"
		echo "    -p plugin        Add zsh plugin. May be specified multiple times"
		exit 1
		;;
	esac
done

sed "s,__PLUGINS__,${plugins}," ~/dotfiles/zshrc.templ > ~/dotfiles/zshrc

if [ ! -d .i3 ]; then
    mkdir -p .i3
fi

ln -s ~/dotfiles/i3status.${os}.conf .i3status.conf
ln -s ~/dotfiles/i3config.${os} .i3/config
ln -s ~/dotfiles/.freebsd_profile .profile
ln -s ~/dotfiles/.tmux.conf .tmux.conf
ln -s ~/dotfiles/zshrc .zshrc
ln -s ~/dotfiles/muttrc .muttrc
ln -s ~/dotfiles/.vimrc .vimrc
ln -s ~/dotfiles/neomutt-gpg.rc .mutt/gpg.rc

if [ ! -d tmux/logs ]; then
    mkdir -p tmux/logs
fi
