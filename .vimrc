set nocompatible	"Changes other options as side effect 
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
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
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/NERDCommenter'
" All of your Plugins must be added before the following line
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
set t_Co=256
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
set backspace=indent,eol,start
set undolevels=1000
set history=1000	"History amount


"Map leader Key to ","
let g:mapleader=","
inoremap <S-Tab> <C-V><Tab>
"Remapped NUL to switch buffers
noremap <NUL> :bn<CR>
map <leader>ff <leader>c<space>

filetype plugin indent on	"Turns the filetype plugin on
"autocmd vimenter * NERDTree
"autocmd vimenter * wincmd p	"Changes the focus from NERDTree to Opened File
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif	"Closes the last remainig NERDTree split window
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags	"Autocompletes HTML tags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

au BufRead,BufNewFile *.ts  setlocal filetype=typescript


let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"Below option shows the method's signature while completion
let g:tsuquyomi_completion_detail = 1
"Enable vim-airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2 
let g:airline_theme='molokai'

"let g:neocomplete#enable_at_startup = 1
"set runtimepath^=~/.vim/bundle/node-complete/after
let g:SuperTabDefaultCompletionType = "context"
set dictionary+=~/.vim/bundle/bootstrap-snippets/dictionary
set complete+=k

"Vim-Multiple Cursors Configuration
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
