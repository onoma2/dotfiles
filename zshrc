#
[[ $- != *i* ]] && return

export PATH=$HOME/bin:$PATH
export EDITOR=nvim
export VISUAL=nvim
export PAGER=more

TERM=xterm-256color

KITTY_CONFIG_DIRECTORY="$HOME/dotfiles"

bindkey -v

# If not running interactively, do not do anything
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

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
alias .d="source deactivate"
alias v="nvim"
alias r="ranger"
alias p3u="pip3 install --user"
ENABLE_CORRECTION="false"
HIST_STAMPS="dd/mm/yyyy"




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

# ------- { LINUX
# -----------------------------------------------
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


#	alias condainit='export PATH=/home/onoma/miniconda3/bin:$PATH'
	alias condainit='source $HOME/Conda/miniconda3/bin/activate'
#	source ~/.zshlocal
	source /usr/share/zsh/share/antigen.zsh

	setxkbmap -model pc105 -layout us,ru -variant , -option grp:alt_shift_toggle,compose:ralt,ctrl:nocaps

	timedatectl set-local-rtc 0
# }-----


# ------- {macOS
# -----------------------------------------------
# If the platform is OS X
elif [[ $PLATFORM == 'Darwin' ]]; then
	export PATH="/usr/local/opt/python/libexec/bin:$PATH"
#	alias condainit='echo ". $HOME/anaconda3/etc/profile.d/conda.sh" >> ~/.bash_profile'
	alias condainit='source $HOME/miniconda3/bin/activate'
	alias afk="open -a /System/Library/CoreServices/ScreenSaverEngine.app"
	alias rm=trash
	alias bi='brew install'
	alias bci='brew cask install'
	alias bubuc='bubu && brew cask upgrade'
	source ~/git/antigen/antigen.zsh
	export LC_ALL='en_US.UTF-8'
	export PATH=$HOME/Library/Python/3.7/Bin:$PATH
fi
# }-------

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X'

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
# shellcheck disable=SC1090
[ -f ~/.zshlocal] && . ~/.zshlocal
#

#[ -e "${HOME}/dotfiles/zsh/functions" ] && source "${HOME}/dotfiles/zsh/functions"

antigen init ~/.antigenrc

#neofetch --ascii


# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# fzf via local installation
if [ -e ~/.fzf ]; then
  _append_to_path ~/.fzf/bin
  source ~/.fzf/shell/key-bindings.zsh
  source ~/.fzf/shell/completion.zsh
fi

# fzf + ag configuration
# if _has fzf && _has ag; then
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '
# fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)
export PATH="/usr/local/sbin:$PATH"
