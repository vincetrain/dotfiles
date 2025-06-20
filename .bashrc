#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='╭───[\e[34m\u\e[00m@\e[34m\h\e[00m][\e[90m\W\e[00m]\n\[╰─\e[1m\$\e[0m\] '

PATH="$PATH:$HOME/.local/bin"

if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

export EDITOR=nvim
