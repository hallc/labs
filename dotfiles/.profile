PATH=$PATH:~/Projects/labs/scripts
export PATH

export EDITOR=/usr/bin/vim
export PS1="[\u@\h \W]\$ "

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export GREP_COLOR="1;33"
alias grep='grep --color=auto'

if [ `uname` = "Darwin" ]; then
	alias ls='ls -G'
else
	alias ls='ls --color'
fi
alias ll='ls -lh'
alias la='ls -A'
alias chop12="sed 's/\(.\{12\}\).*/\1/'"

