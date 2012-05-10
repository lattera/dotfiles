# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=99999999999
SAVEHIST=99999999999
setopt autocd
setopt promptsubst
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/shawn/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PS1='[%n@%m %~]%# '
