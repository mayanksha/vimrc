set nocompatible	"Changes other options as side effect 
filetype off                  " required

"VUNDLE
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tyrannicaltoucan/vim-quantum.git'
Plugin 'jiangmiao/auto-pairs.git'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'ervandew/supertab'
Plugin 'shougo/neocomplete.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"NERD Tree is slowing down vim and increasing loading times massively
"Plugin 'scrooloose/nerdtree'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-fugitive'
Plugin 'digitaltoad/vim-pug'
Plugin 'alvan/vim-closetag'
"Plugin 'jvanja/vim-bootstrap4-snippets'
Plugin 'terryma/vim-multiple-cursors'
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set hidden	"Hides buffers instead of closing them. Means you can ahve unwritten changes to a file and open a new file using :e, without being forced to write or undo your changes first. Also, undo buffers and marks are preserved while the buffer is open.
syntax enable
"set background=dark
set termguicolors
"let g:quantum_dark = 1
"colorscheme monokai
"colorscheme basic-dark
"colorscheme quantum 
"colorscheme jellybeans
let g:neodark#background = '#232227'
colorscheme neodark
set t_co=256
set tabstop=4	"tab is four spaces
set autoindent	"autoindenting always on
set copyindent	"copy previous indent on autoindenting
set number
set relativenumber
set shiftwidth=4	"number of spaces to use for autoindenting
set showmatch	"show matching parenthesis
set smarttab	"insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch	"highligh search terms
set incsearch	"show search matches as you type
set backspace=indent,eol,start
<<<<<<< head
set undolevels=1000	
set history=1000	"history amount


"******************key bindings******************"
"remap shift+tab to literal tab in insert mode
inoremap <s-tab> <c-v><tab>
"remapped nul to switch buffers
noremap <nul> :bn<cr>

filetype plugin indent on	"Turns the filetype plugin on
"autocmd vimenter * NERDTree
"autocmd vimenter * wincmd p	"Changes the focus from NERDTree to Opened File
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif	"Closes the last remainig NERDTree split window


"******************FileType Extension******************"
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags	"Autocompletes HTML tags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

au BufRead,BufNewFile *.ts  setlocal filetype=typescript


"Map leader Key to ","
let g:mapleader=","

"******************TYPESCRIPT******************"
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"Below option shows the method's signature while completion
let g:tsuquyomi_completion_detail = 1

"******************Vim Airline******************"
let g:airline#extensions#tabline#enabled = 1
set laststatus=2 
let g:airline_theme='molokai'

"let g:neocomplete#enable_at_startup = 1
"set runtimepath^=~/.vim/bundle/node-complete/after
let g:SuperTabDefaultCompletionType = "context"
