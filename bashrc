###################
# My .bashrc file #
###################

# Get BASEDIR
#BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
#BIN_DIR="$BASEDIR/Dotfiles"

# Variables
host="$(hostname)"
os='Linux'      # I'd just like to interject for a moment...
kernel="$(uname -sr)"
uptime="$(uptime | awk -F, '{sub(".*up ",x,$1);print $1}' | sed -e 's/^[ \t]*//')"
shell="$(basename ${SHELL})"
ip="$(ip route get 1 | awk '{print $(NF-2);exit}')"

# Default editor
export EDITOR=/usr/bin/vim
# Default filemgr
export FILE="nnn"
# Default terminal
export TERMINAL="terminator"
export BROWSER="google-chrome-stable"

# Grep
alias grep='grep -n'
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'

# Prompt
#export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;32m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[34m\] '

# Check if we are running interactive
if [ "$TERM" != "linux" ]; then
#    source ~/Dotfiles/pureline_configs ~/.my_powerline.conf
    source ~/Dotfiles/pureline ~/.pureline.conf
fi

# Simplify folder traversing
# Usage: cdn n; where n stands for number of folders you want to traverse.
function cdn(){ for i in `seq $1`; do cd ..; done;}

# Functions
welcome() {
    ##############################
    ##      WELCOME MESSAGE     ##
    ##############################

    # Alt 1.
    # Use the ufetch system info
    # source "$BIN_DIR/ufetch-linux.sh"

    # Alt 2.
    #neofetch --ascii_distro suse os_small --disable resolution theme icons shell de packages term gpu --color_blocks off

echo -ne "
 ______     __  __     ______     ______    \r
/\  ___\   /\ \/\ \   /\  ___\   /\  ___\   \r
\ \___  \  \ \ \_\ \  \ \___  \  \ \  __\   \r
 \/\_____\  \ \_____\  \/\_____\  \ \_____\ \r
  \/_____/   \/_____/   \/_____/   \/_____/ \n";

    echo -e  "";
    echo -ne "Host:"${host};
    echo -ne " | Kernel:"${kernel};
    echo -ne " | Up:"${uptime};
    echo -ne " | IP:"${ip};
    echo "";
}
welcome;


