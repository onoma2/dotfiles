#
[[ $- != *i* ]] && return

export PATH=$HOME/bin:$PATH
export EDITOR='nano'

TERM=xterm-256color

alias condainit='export PATH="/Users/onoma/anaconda3/bin:$PATH"'
alias lc='colorls -lA --sd'
alias weather="curl http://wttr.in/"
alias moon="curl http://wttr.in/Moon"
alias mkdir="mkdir -pv"
alias du="du -ach | sort -h"
alias ps="ps -af"
alias wget="wget -c"

ENABLE_CORRECTION="false"
HIST_STAMPS="mm/dd/yyyy"

export PLATFORM=$(uname)

if [[ $PLATFORM == 'Linux' ]]; then

	PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
	export GEM_HOME=$HOME/.gem

	alias ls='ls --color=auto'
	alias la='ls -A'
	alias ll='ls -lA'
	alias l='ls'
	alias l.="ls -A | egrep '^\.'"
	alias merge='xrdb -merge ~/.Xresources'
	alias pmsyu='sudo pacman -Syu --color=auto'
	alias pacman='sudo pacman --color auto'
	alias update='sudo pacman -Syu'
	alias upmirrors='sudo reflector --score 100 --fastest 25 --sort rate --save /etc/pacman.d/mirrorlist --verbose'

	source /usr/share/zsh/share/antigen.zsh

# If the platform is OS X
elif [[ $PLATFORM == 'Darwin' ]]; then
	export CLICOLOR=1
	export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
    source /usr/local/Cellar/antigen/2.2.3/share/antigen/antigen.zsh

fi

antigen init ~/.antigenrc

neofetch --ascii
