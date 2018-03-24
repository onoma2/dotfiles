"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/vim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/vim')
  call dein#begin('~/.cache/vim')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/vim/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim') ", { 'rev': 'a1b5108fd' }
  
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1

  call dein#add('chriskempson/base16-vim')
  call dein#add('fmoralesc/vim-tutor-mode')
  call dein#add('rafi/vim-badge')
  call dein#add('itchyny/vim-parenmatch')
  call dein#add('junegunn/vim-peekaboo')
  call dein#add('tchyny/vim-cursorword')
  call dein#add('haya14busa/vim-asterisk')
  call dein#add('rafi/vim-sidemenu')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('Raimondi/delimitMate')
  call dein#add('davidhalter/jedi-vim')
  call dein#add('zchee/deoplete-jedi')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:

" === Theme and colors === {{{
set t_Co=256                                    " Emulate 256 colors
set background=dark                             " Changing background color
colorscheme base16-tomorrow-night
"let g:molokai_original = 1
"let g:rehash256 = 1                             " Enable molokai colors in terminal
" }}}

" === General Configuration === {{{
filetype plugin indent on
syntax on                                       " Turn on syntax highlighting
set autoread                                    " Reload files changed outside vim
set hidden                                      " Easier buffer switching
set title                                       " Set automatic title terminal window
set lazyredraw                                  " Do not redraw while running macros (much faster)
let mapleader=','                               " Set the leader key to comma
highlight Normal guibg=black guifg=white        " Hightlight a text in a diferent color
set hlsearch                                    " Highlight searches
set textwidth=0                                 " Linewidth to endless
"set paste                                      " Paste text from other window without unexpected effects (disable in order to delimitMate plugin to work)
set linebreak                                   " Wrap lines at convenient points
set nuw=5                                       " Increase column number width
set ruler                                       " Show line and column information
set laststatus=2                                " Display status line
set incsearch                                   " Do highlight as you type you search phrase
set ignorecase                                  " Case insensitive searches
set smartcase                                   " Case sensitive searches for capital letters
set backspace=indent,eol,start                  " Repair wired terminal/vim settings
set autoindent                                  " Set auto indentation
set smartindent                                 " Set smart indentation
set smarttab                                    " Set smart tab on indentation
set copyindent                                  " Copy the previous indentation
set shiftround                                  " Multiple shiftwidth when indenting with '<' and '>'
set nostartofline                               " Stop certain movements from always going to the first character of a line
set encoding=utf-8                              " Necessary to show Unicode glyphs
set ttyfast                                     " Send more characters for redraws
"set ttymouse=xterm                                " Set terminal name that supports mouse codes(sgr, xterm, xterm2, netterm, dec, jsbterm, pterm).
set mouse=a                                     " Enable mouse use in all modes
set number                                      " Show line numbers by default
set cursorline                                  " Highlight current line
set listchars=tab:┊\                            " Indent line
set showmode                                    " Always show command or insert mode
set showmatch                                   " Show matching brackets
set formatoptions=tcrqn                         " How automatic formatting is to be done
set whichwrap=b,s,<,>,[,]                       " Allow specific keys that moves the cursor
set tabstop=2 shiftwidth=2 expandtab            " Set tabs to 4 spaces
set invlist                                     " Show hidden chars
set clipboard=unnamed                           " Copy to the system clipboard





" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif
"dein Scripts-----------------------------