#
# ~/.bashrc
#

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return

# Load aliases
source .bash_aliases

# Load custom prompt
source .bash_prompt

# Load configurations specific to this machine
if [ -e .bash_local ]; then
    source .bash_local
fi

# Default file permissions 664 (775 for dirs)
umask 002

# Command line editing acts like vi
set -o vi

# Make tab completion work for sudo commands
complete -cf sudo

export EDITOR=vim
export HISTCONTROL=ignoreboth
#export PATH=/usr/local/bin:/usr/bin:/bin:/usr/games:/home/ninly/bin
#export PKG_CONFIG_PATH=/home/ninly/lib/pkgconfig
#export LD_LIBRARY_PATH=/home/ninly/lib:/usr/local/lib:
