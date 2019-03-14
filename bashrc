###################
# My .bashrc file #
###################

# Get BASEDIR
#BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
#BIN_DIR="$BASEDIR/Dotfiles"

# Variables
host="$(hostname)"
os='Linux'      # I'd just like to interject for a moment...
kernel="$(uname -r)"
uptime="$(uptime | awk -F, '{sub(".*up ",x,$1);print $1}' | sed -e 's/^[ \t]*//')"
shell="$(basename ${SHELL})"
ip="$(ip route get 1 | awk '{print $(NF-2);exit}')"

# Default editor
export EDITOR=/usr/bin/vim
# Default filemgr
export FILE="nnn"
# Default terminal
export TERMINAL="/usr/bin/terminator"
export BROWSER=/usr/bin/google-chrome-stable

# Grep
#alias grep='grep -n --color=auto'
#export GREP_OPTIONS='--color=auto'
#export GREP_COLOR='1;35;40'
unset GREP_OPTIONS

# Maximum dir levels to show
export PROMPT_DIRTRIM=1

# Setup Powerline
#export SITE_PACKAGES=`python -c 'import site; print(site.getsitepackages()[0])'`
#export PYTHONPATH=$SITE_PACKAGES
#
#if [ -f $SITE_PACKAGES/powerline/bindings/bash/powerline.sh ]; then
#	powerline-daemon -q
#	POWERLINE_BASH_CONTINUATION=1
#	POWERLINE_BASH_SELECT=1
#	. $SITE_PACKAGES/powerline/bindings/bash/powerline.sh
#fi

# My customer prompt
#export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;32m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[34m\] '
#export PS1='\[\033[01;32m\]\w\[\033[01;32m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[34m\] '

# Pureline prompt
# Check if we are running interactive
#if [ "$TERM" != "linux" ]; then
#    source ~/Dotfiles/pureline_configs ~/.my_powerline.conf
#    source ~/Dotfiles/pureline ~/.pureline.conf
#fi

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

# Logo color
lcol='\e[38;5;76m'
icol='\e[38;5;248m'

echo -ne $lcol"
 ______     __  __     ______     ______    \r
/\  ___\   /\ \/\ \   /\  ___\   /\  ___\   \r
\ \___  \  \ \ \_\ \  \ \___  \  \ \  __\   \r
 \/\_____\  \ \_____\  \/\_____\  \ \_____\ \r
  \/_____/   \/_____/   \/_____/   \/_____/ \n";

    echo -ne  $icol"\n";
    echo -ne ${host};
    echo -ne " | "${ip};
    echo -ne " | "${kernel};
    echo -ne " | "${uptime};
    echo -ne "\e[0m\n\n";
}
welcome;
cd ~/peterlunderbye@gmail.com/Arbete/SUSE
# Prompt
#export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;32m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[34m\] '

if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi

#. {repository_root}/powerline/bindings/bash/powerline.sh
