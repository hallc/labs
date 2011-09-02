ANDROID_SDK_PATH=/Applications/android-sdk-mac_x86/tools:/Applications/android-sdk-mac_x86/platform-tools
PYTHON3_PATH=/Library/Frameworks/Python.framework/Versions/3.2/bin
export PATH=$PYTHON3_PATH:$PATH:~/Projects/labs/scripts:$ANDROID_SDK_PATH
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

alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -A'

