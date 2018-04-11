#
[[ $- != *i* ]] && return

export PATH=$HOME/bin:$PATH
export EDITOR='nano'

TERM=xterm-256color

KITTY_CONFIG_DIRECTORY="$HOME/.config"

# create history file
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory


#options from ArchLabs
setopt AUTO_CD # No cd needed to change directories
setopt BANG_HIST # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_DUPS # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_SPACE # Don't record an entry starting with a space.
setopt HIST_REDUCE_BLANKS # Remove superfluous blanks before recording entry.
setopt HIST_SAVE_NO_DUPS # Don't write duplicate entries in the history file.
setopt INC_APPEND_HISTORY # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY # Share history between all sessions.


#general aliases
alias lc='colorls -lA --sd'
alias weather="curl http://wttr.in/"
alias moon="curl http://wttr.in/Moon"
alias mkdir="mkdir -pv"
alias du="du -ach | sort -h"
alias ps="ps -af"
alias wget="wget -c"
alias zsr="exec zsh"
alias zss="source ~/.zshrc"
alias neoa="neofetch --ascii"

ENABLE_CORRECTION="false"
HIST_STAMPS="mm/dd/yyyy"




export CLICOLOR=1
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx



# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	eval $( dircolors -b $HOME/dotfiles/dircolors )
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi



export PLATFORM=$(uname)

if [[ $PLATFORM == 'Linux' ]]; then

	PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
	export GEM_HOME=$HOME/.gem

#	alias ls='ls --color=auto'
	alias la='ls -A'
	alias ll='ls -lA'
	alias l='ls'
	alias l.="ls -A | egrep '^\.'"
	alias merge='xrdb -merge ~/.Xresources'
	alias pmsyu='sudo pacman -Syu --color=auto'
	alias pacman='sudo pacman --color auto'
	alias update='sudo pacman -Syu'
	alias upmirrors='sudo reflector --score 100 --fastest 25 --sort rate --save /etc/pacman.d/mirrorlist --verbose'
	alias afk="systemctl suspend"


	alias condainit='export PATH=/home/onoma/miniconda3/bin:$PATH'

	source /usr/share/zsh/share/antigen.zsh
	
	setxkbmap -model pc105 -layout us,ru -variant , -option grp:alt_shift_toggle,compose:ralt

	timedatectl set-local-rtc 0

# If the platform is OS X
elif [[ $PLATFORM == 'Darwin' ]]; then

	alias condainit='export PATH="/Users/onoma/anaconda3/bin:$PATH"'
	alias afk="open -a /System/Library/CoreServices/ScreenSaverEngine.app"
	source /usr/local/Cellar/antigen/2.2.3/share/antigen/antigen.zsh
	export LC_ALL='en_US.UTF-8'

fi

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8'; 

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X'

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
# shellcheck disable=SC1090
[ -f ~/.localrc ] && . ~/.localrc

#[ -e "${HOME}/dotfiles/zsh/functions" ] && source "${HOME}/dotfiles/zsh/functions"

antigen init ~/.antigenrc

#neofetch --ascii
