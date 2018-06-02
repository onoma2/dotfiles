" Global Mappings "{{{
" Use spacebar as leader and ; as secondary-leader
" Required before loading plugins!
let g:mapleader="\<Space>"
let g:maplocalleader=';'

"""""""""""""""""""""""""""""""""" dein """""""""""""""""""""""""""""""""""
" setup dein  ---------------------------------------------------------------{{{
  if (!isdirectory(expand("$home/.vim/dein/repos/github.com/shougo/dein.vim")))
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
call dein#add('tpope/vim-sleuth')
call dein#add('tpope/vim-eunuch')
call dein#add('tpope/vim-flagship')
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
call dein#add('tpope/vim-commentary')
call dein#add('vim-scripts/indentpython.vim')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('Shougo/denite.nvim')
call dein#add('wellle/targets.vim')
call dein#add('michaeljsmith/vim-indent-object')
call dein#add('sjl/gundo.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('junegunn/fzf')
call dein#add('majutsushi/tagbar')
call dein#add('xolox/vim-misc')
"call dein#add('xolox/vim-easytags')
call dein#add('mkitt/tabline.vim')
call dein#add('w0rp/ale')
call dein#add('mattn/emmet-vim', {'on_ft': 'html'})
call dein#add('facebook/vim-flow', {'autoload': {'filetypes': 'javascript'}})
call dein#add('Shougo/neoinclude.vim')
call dein#add('othree/yajs.vim', {'on_ft': 'javascript'})
call dein#add('othree/jsdoc-syntax.vim', {'on_ft':['javascript', 'typescript']})
call dein#add('othree/es.next.syntax.vim', {'on_ft': 'javascript'})
call dein#add('terryma/vim-multiple-cursors')
call dein#add('gko/vim-coloresque')
call dein#add('machakann/vim-highlightedyank')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('ludovicchabant/vim-gutentags')
call dein#add('vimoutliner/vimoutliner')
call dein#add('dahu/LearnVim')
call dein#add('lepture/vim-jinja')
call dein#add('junegunn/goyo.vim')
call dein#add('yuttie/comfortable-motion.vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('christoomey/vim-tmux-navigator')

if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
""""""""""""""""""""""""""""""""""""""" AG """"""""""""""""""""""""""""""""""""
call dein#add('mileszs/ack.vim')

" --- type ° to search the word in all files in the current dir
"nnoremap ° :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <Leader>/ :Ack 
if executable('ag')
  let g:ackprg = 'ag --vimgrep --nogroup --nocolor --column' 
endif
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" lazy load on command executed
call dein#add('scrooloose/nerdtree',
      \{'on_cmd': 'NERDTreeToggle'})
" lazy load on insert mode
"* call dein#add('Shougo/deoplete.nvim', */
"      \{'on_i': 1})


" and a lot more plugins.....
if dein#check_install()
  call dein#install()
  let pluginsExist=1
endif

call dein#end()
"""""""""""""""""""""""""""""""""""" OPTIONS """""""""""""""""""""""""""""""""""
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
" create directory if needed
if !isdirectory($HOME.'/.vim/files') && exists('*mkdir')
  call mkdir($HOME.'/.vim/files')
endif
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap/
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set viminfo     ='100,n$HOME/.vim/files/info/viminfo

" Enable folding
set foldmethod=indent
set foldlevel=99
""""""""""""""""""""""""""""""""""" MAPPINGS """"""""""""""""""""""
noremap <silent> <F3> :NERDTreeToggle<CR>
noremap <silent> <Leader><F3> :TagbarToggle<CR>
nnoremap  ;  :
nnoremap  :  ;
nnoremap <Leader>* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap <Leader># ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN
nnoremap <Leader><Leader> <c-w><c-p>
nnoremap <Leader>p "+p
vnoremap <Leader>y "+y
nnoremap Q @q
nnoremap <Leader>w :w<cr>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>d "_d
nnoremap <Leader>c "_c
nnoremap <Left> :cp<CR>
nnoremap <Right> :cn<CR>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
""" Searching
set ignorecase
set smartcase

"Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"vnoremap <c-/> :TComment<cr>
noremap <silent> <esc> :noh<cr>
noremap H ^
noremap L g_
noremap J 5j
noremap K 5k
vmap < <gv
vmap > >gv

" Quickly select the text that was just pasted. This allows you to, e.g.,
" indent it after pasting.
noremap gV `[v`]

" Make Ctrl-e jump to the end of the current line in the insert mode. This is
" handy when you are in the middle of a line and would like to go to its end
" without switching to the normal mode.
inoremap <C-e> <C-o>$

inoremap <c-d> <esc>ddi
"inoremap <expr> <Tab> matchstr(getline('.'), '.\%' . col('.') . 'c') =~ '\k' ? "\<C-P>" : "\<Tab>"
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
"function! WinMove(key)
"  let t:curwin = winnr()
"  exec "wincmd ".a:key
"  if (t:curwin == winnr()) "we havent moved
"    if (match(a:key,'[jk]')) "were we going up/down
"      wincmd v
"    else
"      wincmd s
"    endif
"    exec "wincmd ".a:key
"  endif
"endfunction


"map <leader>h              :call WinMove('h')<cr>
"map <leader>k              :call WinMove('k')<cr>
"map <leader>l              :call WinMove('l')<cr>
"map <leader>j              :call WinMove('j')<cr>
""""""""""""""""""""""""""""""""""" SPLIT MOVEMENT """""""""""""""""""""""""
"split navigations
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
""""""""""""""""""""""""""""""""""" PLUG-IN OPTIONS """"""""""""""""""""""""

let g:python_highlight_all = 1
set laststatus=2
set showtabline=2
set guioptions=tpope/vim-sleuth

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_default'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

let g:airline_skip_empty_sections = 1

let g:SimpylFold_docstring_preview=1

" Easy align interactive
vnoremap <silent> <Enter> :EasyAlign<cr>
""""""""""""""""""""""""""""""""""" PYTHON """""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF
""""""""""""""""""""""""""""""""""" LANGUAGES """"""""""""""""""""""""""""""
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
"""""""""""""""""""""""""""""""""""" DEOPLETE """""""""""""""""""""""""""""""
" deoplete.vim contains vim settings relevant to the deoplete autocompletion
" plugin
" for more details about my neovim setup see:
" http://afnan.io/2018-04-12/my-neovim-development-setup/

" deoplete options
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" disable autocomplete by default
let b:deoplete_disable_auto_complete=1
let g:deoplete_disable_auto_complete=1
call deoplete#custom#buffer_option('auto_complete', v:false)

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['Comment', 'String'])

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" set sources
let g:deoplete#sources = {}
let g:deoplete#sources.cpp = ['LanguageClient']
let g:deoplete#sources.python = ['LanguageClient']
let g:deoplete#sources.python3 = ['LanguageClient']
let g:deoplete#sources.rust = ['LanguageClient']
let g:deoplete#sources.c = ['LanguageClient']
let g:deoplete#sources.vim = ['vim']

" Denite --------------------------------------------------------------------{{{

  let s:menus = {}
  call denite#custom#option('_', {
        \ 'prompt': '❯',
        \ 'winheight': 10,
        \ 'updatetime': 1,
        \ 'auto_resize': 0,
        \ 'highlight_matched_char': 'Underlined',
        \ 'highlight_mode_normal': 'CursorLine',
        \ 'reversed': 1,
        \})
  call denite#custom#option('TSDocumentSymbol', {
        \ 'prompt': ' @' ,
        \ 'reversed': 0,
        \})
  call denite#custom#option('TSWorkspaceSymbol', {
        \ 'reversed': 0,
        \ 'prompt': ' #' ,
        \})
  call denite#custom#source('file_rec', 'vars', {
        \ 'command': [
        \ 'ag', '--follow','--nogroup','--hidden', '--column', '-g', '', '--ignore', '.git', '--ignore', '*.png', '--ignore', 'node_modules'
        \] })
  call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
  call denite#custom#source('file_rec', 'matchers', ['matcher_cpsm'])

 	call denite#custom#var('grep', 'command', ['ag'])
	call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', [])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])

  nnoremap <silent> <c-p> :Denite file_rec<CR>
  "* nnoremap <silent> <leader>h :Denite  help<CR> */
  "* nnoremap <silent> <leader>c :Denite colorscheme<CR> */
  "* nnoremap <silent> <leader>b :Denite buffer<CR> */
  "* nnoremap <silent> <leader>a :Denite grep:::!<CR> */
  "* nnoremap <silent> <leader>u :call dein#update()<CR> */
  call denite#custom#map('insert','<C-n>','<denite:move_to_next_line>','noremap')
	call denite#custom#map('insert','<C-p>','<denite:move_to_previous_line>','noremap')
  call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
    \ [ '.git/', '.ropeproject/', '__pycache__/',
    \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
  call denite#custom#var('menu', 'menus', s:menus)
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"}}}

function g:Multiple_cursors_before()
    call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction
function g:Multiple_cursors_after()
    call deoplete#custom#buffer_option('auto_complete', v:true)
endfunction

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

"=====================================================
"" AirLine settings
"=====================================================
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#ale#enabled=1
let g:airline_powerline_fonts=1

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=42
autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd BufWinLeave *.py :TagbarClose

let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
