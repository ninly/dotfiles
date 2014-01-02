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

# In Arch Linux, source this to turn on bash completion
# (or install bash-completion package)
# source /usr/share/git/completion/git-completion.bash

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

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
