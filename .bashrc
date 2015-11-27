# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples. My version of .bash_profile will source this file for login
# shells.

# If not running interactively, don't do anything
case $- in
  *i*)
    ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
# squash multi-line commands into a single line in the history
shopt -s cmdhist

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=2000000
HISTTIMEFORMAT="%F %T"

case $- in
  *i*)
    # Flush history to disk before each command is run instead of waiting for
    # bash to exit.
    trap 'history -a; history -n;' DEBUG
  ;;
  *)
  ;;
esac
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  *-*color) color_prompt=yes;;
esac

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
  c_clr="\[$(tput sgr0)\]"
  c_k="\[$(tput setaf 0)\]"
  c_r="\[$(tput setaf 1)\]"
  c_g="\[$(tput setaf 2)\]"
  c_y="\[$(tput setaf 3)\]"
  c_b="\[$(tput setaf 4)\]"
  c_p="\[$(tput setaf 5)\]"
  c_c="\[$(tput setaf 6)\]"
  c_w="\[$(tput setaf 7)\]"
else
  color_prompt=
  c_clr=
  c_k=
  c_r=
  c_g=
  c_y=
  c_b=
  c_p=
  c_c=
  c_w=
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

shortpath() {
  cwd=${1-$(PWD)}
  max_len=${2-40}

  # Replace $HOME with ~
  cwd=$(echo "${cwd}" | sed -e "s|^${HOME}|~|")

  prev="${cwd}"
  while [[ ${#cwd} -gt ${max_len} ]] ; do
    cwd=$(echo "${cwd}" | sed -e 's#/\([^/]\)[^/]\+/#/\1/#')

    if [[ ${prev} == ${cwd} ]] ; then
      # No more replacements possible.
      break
    fi
    prev="${cwd}"
  done

  echo "${cwd}"
}

user_prompt() {
  case "$USER" in
    root) uc=${c_r}
      ;;
    aega) uc=${c_g}
      ;;
    *)    uc=${c_p}
      ;;
  esac

  echo "${uc}\u${c_clr}"
}

prompt_command() {
  dr="${debian_chroot:+($debian_chroot)}"
  user_p=$(user_prompt)
  host_p="${c_b}\h${c_clr}"
  path_p="$(shortpath)"
  #vc_p="$(__git_ps1 '(%s)')"

  case "$TERM" in
    xterm*|rxvt*|screen*)
      title_p="\[\e]0;$dr\u@\h:\w\a\]"
      ;;
    *)
      title_p=
      ;;
  esac

  printf "$title_p$dr$c_y\! $user_p@$host_p:$path_p "
}

case "$TERM" in
  xterm*|rxvt*|screen*)
    title_p="\[\e]0;$dr\u@\h:\w\a\]"
    ;;
  *)
    title_p=
    ;;
esac
dr="${debian_chroot:+($debian_chroot)}"
user_p=$(user_prompt)
host_p="${c_b}\h${c_clr}"
path_p='$(shortpath $PWD)'

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWCOLORHINTS=true

PROMPT_COMMAND="__git_ps1 '$title_p$dr$c_y\! $user_p@$host_p:$c_clr$path_p ' '$c_clr\$ ' '(%s)'"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PATH=$PATH:$HOME/.local/bin

export MANPATH=$MANPATH:$HOME/.local/man

export EDITOR=vim

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
