# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

export PATH=$PATH:$HOME/.dotfiles/bin
export MANPATH=$MANPATH:$HOME/.dotfiles/man

if [ -f ~/.hosts ]; then
    export HOSTFILE=~/.hosts
fi

: ${UNAME=$(uname)}

if [ "Darwin" != $UNAME ]; then
    keychain --quiet ~/.ssh/id_rsa
    . ~/.keychain/$HOSTNAME-sh
fi
