# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Please do not remove the following line.  This file sets up your
# environment the way it is supposed to be.  You can add your own
# features if you know what you are doing.
#
[ -f /.bashrc_global ] && source /.bashrc_global
[ -z "$PS1" ] && return

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE=1000000000
HISTSIZE=1000000
#HISTSIZE=1000
#HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# victorhugo modifications 
# based on http://www.ukuug.org/events/linux2003/papers/bash_tips/
# whenever displaying the prompt, write the previous line to disk
PROMPT_COMMAND='history -a'
# when you type: $ cd /vr/lgo/apaAche, it corrects to /var/log/apache. Awesome! ;-)
shopt -s cdspell

# my bookmarked dirs separated by `:'
#CDPATH='.:..:../..:~/Dropbox:~'

# export my favorite editor --- and a gambis to turn emacs faster
#EDITOR="emacsclient -a "" -nw"
#export EDITOR

# macete para iniciar emacs --daemon de uma vez
#export ALTERNATE_EDITOR=""
#alias e='emacsclient -t'

# alias emacs='emacs -nw'
function emacs
{
    TERM=xterm
    command emacs -nw "$@"
}

# open some graphical commands in background
function gimp
{
    command gimp "$@" &
}

# open some graphical commands in background
function gedit
{
    command gedit "$@" &
}

# Para o vi/vim usar as cores do powerline corretamente
# export TERM=xterm-256color
function tmux
{
    #TERM=xterm-256color
    #TERM=screen-256color-bce
    TERM=screen-256color
    command tmux "$@"
}

# opening nautilus in background
function nautilus
{
    command nautilus "$@" &
}

# function sublime
# {
#     command ~/bin/Sublime\ Text\ 2/sublime "$@" &
# }

# solves issue with colors in vim when using tmux
export TERM=screen-256color
export VISUAL=vim
export EDITOR="$VISUAL"

# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . $HOME/workspace/anaconda2/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
