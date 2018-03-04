#
[[ $- != *i* ]] && return

export PATH=$HOME/bin:$PATH
export EDITOR='nano'
export DEFAULT_USER='onoma'
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


export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx


source /usr/local/Cellar/antigen/2.2.3/share/antigen/antigen.zsh

antigen init ~/.antigenrc