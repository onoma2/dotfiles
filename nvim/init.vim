" Global Mappings "{{{
" Use spacebar as leader and ; as secondary-leader
" Required before loading plugins!
let g:mapleader="\<Space>"
let g:maplocalleader=';'

""""""""""""""""""""""""""""""""""" OPTIONS """""""""""""""""""""""""""""""""""
"
" A (not so) minimal vimrc.
"

" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.
set relativenumber number
set numberwidth=1

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

"set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap/
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set viminfo     ='100,n$HOME/.vim/files/info/viminfo


""""""""""""""""""""""""""""""""""" DEIN """""""""""""""""""""""""""""""""""
" Setup dein  ---------------------------------------------------------------{{{
  if (!isdirectory(expand("$HOME/.vim/dein/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.vim/dein/repos/github.com/"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.vim/dein/repos/github.com/Shougo/dein.vim"))
  endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim " path to dein.vim
call dein#begin(expand('~/.vim/dein')) " plugins' root path
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {
    \ 'build': {
    \     'windows': 'tools\\update-dll-mingw',
    \     'cygwin': 'make -f make_cygwin.mak',
    \     'mac': 'make -f make_mac.mak',
    \     'linux': 'make',
    \     'unix': 'gmake',
    \    },
    \ })

 "!!!!!!!!!" NON LAZY "!!!!!!!!!"   
call dein#add('wsdjeg/dein-ui.vim') " dein plugin manager ui
call dein#add('rafi/vim-badge') "
call dein#add('junegunn/vim-peekaboo') "
call dein#add('itchyny/vim-gitbranch') "
call dein#add('lifepillar/vim-cheat40') "
call dein#add('tpope/vim-sleuth') "
call dein#add('itchyny/vim-cursorword') "
call dein#add('vim-python/python-syntax') " python_highlight_all option
call dein#add('Vimjas/vim-python-pep8-indent') "
call dein#add('tmhedberg/SimpylFold') "
call dein#add('haya14busa/dein-command.vim') " multiple dein commands
call dein#add('Yggdroot/indentLine')
call dein#add('junegunn/vim-easy-align')
call dein#add('itmammoth/doorboy.vim')
call dein#add('tpope/vim-surround') 
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-sleuth')
call dein#add('tpope/vim-eunuch')
call dein#add('tpope/vim-flagship')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-abolish')
call dein#add('svermeulen/vim-easyclip')
call dein#add('tpope/vim-unimpaired')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('ryanoasis/vim-devicons')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-rhubarb')
call dein#add('chemzqm/vim-easygit')
call dein#add('jreybert/vimagit', {'on_cmd': ['Magit', 'MagitOnly']})
call dein#add('rhysd/committia.vim')
call dein#add('tomtom/tcomment_vim')

" lazy load on command executed
call dein#add('scrooloose/nerdtree',
      \{'on_cmd': 'NERDTreeToggle'})
" lazy load on insert mode
call dein#add('Shougo/deoplete.nvim',
      \{'on_i': 1})
" lazy load on function call
call dein#add('othree/eregex.vim',
      \{'on_func': 'eregex#toggle'})


" and a lot more plugins.....
if dein#check_install()
  call dein#install()
  let pluginsExist=1
endif

call dein#end()
""""""""""""""""""""""""""""""""""" MAPPINGS """"""""""""""""""""""
noremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap  ;  :
nnoremap  :  ;
nnoremap <Leader>x /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap <Leader>X ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN
nnoremap <Leader><Leader> <c-w><c-p>
nnoremap <Leader>p "+p
nnoremap Q @q
nnoremap <Leader>w :w<cr>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>d "_d
nnoremap <Leader>c "_c
"nnoremap r d
nnoremap <Left> :cp<CR>
nnoremap <Right> :cn<CR>
"nnoremap <C-S-e> ':e $MYVIMRC<CR>'
"nnoremap <C-S-A-e> ':source $MYVIMRC<CR>''

""" Searching
set ignorecase
set smartcase

 Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

vnoremap <c-/> :TComment<cr>
noremap <silent> <esc> :noh<cr>
noremap H ^
noremap L g_
noremap J 5j
noremap K 5k
vmap < <gv
vmap > >gv


inoremap <c-d> <esc>ddi
inoremap <expr> <Tab> matchstr(getline('.'), '.\%' . col('.') . 'c') =~ '\k' ? "\<C-P>" : "\<Tab>"
inoremap jj <Esc>

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall


"""""""""""""""""""""""""""""""""" HIGHLIGHT """"""""""""""""""""""""

" OR ELSE just the 81st column of wide lines...
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


""""""""""""""""""""""""""""""""""" WINDOW MOVEMENT """"""""""""""""""""""""
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr()) "we havent moved
    if (match(a:key,'[jk]')) "were we going up/down
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction


map <leader>h              :call WinMove('h')<cr>
map <leader>k              :call WinMove('k')<cr>
map <leader>l              :call WinMove('l')<cr>
map <leader>j              :call WinMove('j')<cr>

""""""""""""""""""""""""""""""""""" PLUG-IN OPTIONS """"""""""""""""""""""""

let g:python_highlight_all = 1
set laststatus=2
set showtabline=2
set guioptions-=tpope/vim-sleuth

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_default'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1


