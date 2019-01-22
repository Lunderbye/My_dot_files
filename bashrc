###################
# My .bashrc file #
###################

# Default editor
export EDITOR=/usr/bin/vim

# Grep
alias grep='grep -n'
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'


# Prompt
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;32m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[34m\] '
