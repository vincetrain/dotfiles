#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Configure only if not on running on TTY session
if [[ "$TERM" != "linux" ]]; then
    # ╭─ ★ 🭬 [username]@[host] 🭬 ~  🭬
    # ╰─ $
    PS1='\[\e[0m\]\[\e[38;2;50;50;50m\]╭─\[\e[39m\]\[\e[48;2;50;50;50m\] ★ \[\e[0m\]\[\e[48;2;150;150;150m\]\[\e[38;2;50;50;50m\]🭬 \[\e[38;2;0;0;0m\]\[\e[48;2;150;150;150m\]\[\e[1m\]\u@\h \[\e[0m\]\[\e[38;2;150;150;150m\]\[\e[48;2;255;255;255m\]🭬\[\e[38;2;0;0;0m\]\[\e[1m\] \w  \[\e[38;2;255;255;255m\]\[\e[48;2;0;0;0m\]🭬\n\[\e[38;2;50;50;50;m\]╰─ \[\e[0m\]\$ '
    PS2='   > '
    export SUDO_PROMPT="$(tput setab 1; tput setaf 0; tput bold;)[sudo] password for $USER $(tput sgr0; tput setaf 1;)🭬$(tput sgr0;) "
else
    PS1='┌─[\u@\h][\w]\n└─ \$ '
fi

### Functions ###
function dev() {
    if [[ -z $1 ]]; then
        echo ERROR: must specify a directory
        exit 1
    fi
    echo Starting development container for $1
    podman run --rm -it --name "development" --network=host -v "$1:/repo" devcontainer
}

### Aliases ###
alias grep='rg --color=auto'

alias vim=nvim
alias svim="sudo -E nvim"
alias ..="cd .."

alias icat="kitten icat"
alias ls="lsd"

alias visudo="sudo -E visudo"

alias suspend="systemctl suspend"

alias docker="podman"

### Variables ###
export EDITOR=nvim
