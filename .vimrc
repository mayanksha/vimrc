set nocompatible	"Changes other options as side effect 
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs.git'
Plugin 'tyrannicaltoucan/vim-quantum.git'
Plugin 'mattn/emmet-vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
set hidden	"Hides buffers instead of closing them. Means you can ahve unwritten changes to a file and open a new file using :e, without being forced to write or undo your changes first. Also, undo buffers and marks are preserved while the buffer is open.
syntax enable
set background=dark
set termguicolors

"At the point of execution of colorscheme quantum, the quantum.vim file resets
let g:quantum_black=1
let g:quantum_italics=1 
colorscheme quantum 
"colorscheme jellybeans

set tabstop=4	"Tab is four spaces
set autoindent	"Autoindenting always on
set copyindent	"Copy Previous indent on autoindenting
set number
set relativenumber
set shiftwidth=4	"Number of spaces to use for autoindenting
set showmatch	"Show matching parenthesis
set smarttab	"insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch	"highligh search terms
set incsearch	"show search matches as you type

set undolevels=1000	
set history=1000	"History amount

filetype plugin indent on	"Turns the filetype plugin on
"autocmd vimenter * NERDTree
"autocmd vimenter * wincmd p	"Changes the focus from NERDTree to Opened File
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif	"Closes the last remainig NERDTree split window
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags	"Autocompletes HTML tags
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"Emmet related things"
let g:user_emmet_mode='a'  "enable all functions, which is equal to
let g:user_emmet_leader_key='<C-f>'
let g:user_emmet_install_global = 0
