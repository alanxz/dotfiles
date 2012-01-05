# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export PATH=$PATH:$HOME/.dotfiles/bin
export MANPATH=$MANPATH:$HOME/.dotfiles/man

if [ -f ~/.hosts ]; then
    export HOSTFILE=~/.hosts
fi
