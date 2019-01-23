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

# Simplify folder traversing
# Usage: cdn n; where n stands for number of folders you want to traverse.
function cdn(){ for i in `seq $1`; do cd ..; done;}

# Functions
welcome() {
    ##############################
    ##      WELCOME MESSAGE     ##
    ##############################

echo -ne "
 ______     __  __     ______     ______    \r
/\  ___\   /\ \/\ \   /\  ___\   /\  ___\   \r
\ \___  \  \ \ \_\ \  \ \___  \  \ \  __\   \r
 \/\_____\  \ \_____\  \/\_____\  \ \_____\ \r
  \/_____/   \/_____/   \/_____/   \/_____/ \n"

    #echo -e ""; cal -wm ;
    #echo -ne "Today is "; date #date +"Today is %A %D, and it is now %R"
    echo -e ""
    echo -ne "Up time:";uptime | awk /'up/'
    # echo -en "Local IP Address :"; /sbin/ifconfig wlan0 | awk /'inet addr/ {print $2}' | sed -e s/addr:/' '/
    echo "";
}
welcome;
