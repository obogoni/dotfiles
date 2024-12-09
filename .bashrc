# ~/.bashrc

# If not running interactively, don't do anything [[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Dotnet runtime
export PATH="/usr/local/bin/dotnet:$PATH"
export DOTNET_ROOT="/usr/local/bin/dotnet"

export PATH="~/.local/bin/:$PATH"
