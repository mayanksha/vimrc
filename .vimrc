let mapleader=","
"Map leader Key to ","
inoremap <S-Tab> <C-V><Tab>
"Remapped NUL to switch buffers
"
"Mappings for calling NERDComment using c
nnoremap c :call NERDComment('n', 'Toggle')<CR>
vnoremap c :call NERDComment('x', 'Toggle')<CR>
"nnoremap <C-w> :bd | bd
"nmap <Leader> <leader>c<space>
noremap <NUL> :bn<CR>
nnoremap <F2> :bd<CR>
nnoremap <C-e> :call CloseBufWithoutClosingNetrw()<CR>


" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
"nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

function CloseBufWithoutClosingNetrw()
	:bd
	:bd
	:Vexplore
	:wincmd l
endfunction

function! ToggleVExplorer()
	if exists("t:expl_buf_num")
		let expl_win_num = bufwinnr(t:expl_buf_num)
		if expl_win_num != -1
			let cur_win_nr = winnr()
			exec expl_win_num . 'wincmd w'
			close
			exec cur_win_nr . 'wincmd w'
			unlet t:expl_buf_num
		else
			unlet t:expl_buf_num
		endif
	else
		exec '1wincmd w'
		Vexplore
		let t:expl_buf_num = bufnr("%")
	endif
endfunction
map <silent> <C-j> :call ToggleVExplorer()<CR>


set nocompatible	"Changes other options as side effect 
""filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'tyrannicaltoucan/vim-quantum.git'
Plugin 'jiangmiao/auto-pairs.git'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'ervandew/supertab'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Konfekt/vim-alias'
"NERD Tree is slowing down vim and increasing loading times massively
"Plugin 'scrooloose/nerdtree'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-fugitive'
Plugin 'digitaltoad/vim-pug'
Plugin 'alvan/vim-closetag'
"Plugin 'jvanja/vim-bootstrap4-snippets'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/NERDCommenter'
Plugin 'Quramy/vim-js-pretty-template'
"Plugin 'ctrlpvim/ctrlp.vim'
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
set tabstop=2	"Tab is four spaces
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
					"mode to normal mode
set laststatus=2	"Always Display the status line 
set timeoutlen=10	"Set the timeout for change from insert to normal mode
					"change in vim airline

set directory^=$HOME/.vim/tmp// "To change the default save directory of swap files to .vim/tmp for better file management"


filetype plugin indent on	"Turns the filetype plugin on
"autocmd vimenter * NERDTree
"autocmd vimenter * wincmd p	"Changes the focus from NERDTree to Opened File
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif	"Closes the last remainig NERDTree split window
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags	"Autocompletes HTML tags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS setlocal ts=2 sw=2 expandtab 
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

autocmd FileType javascript JsPreTmpl markdown
autocmd FileType typescript JsPreTmpl markdown
autocmd FileType typescript syn clear foldBraces 


au BufRead,BufNewFile *.ts  setlocal filetype=typescript

"FOR YCM, to query the omni completion engine at each keypress. Might cause
"stuttering
let g:ycm_cache_omnifunc = 1

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"Below option shows the method's signature while completion
let g:tsuquyomi_completion_detail = 1

"Enable vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline_powerline_fonts = 1
let g:airline_section_y = ''

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_right_sep = '«'
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮁'
let g:airline#extensions#tabline#right_sep = '⮂'
let g:airline#extensions#tabline#right_alt_sep = '⮃'

let g:airline_theme='wombat'

"let g:neocomplete#enable_at_startup = 1
"set runtimepath^=~/.vim/bundle/node-complete/after
let g:SuperTabDefaultCompletionType = "context"
set dictionary+=~/.vim/bundle/bootstrap-snippets/dictionary


"Vim-Multiple Cursors Configuration
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


"netrw Settings to make it like NERDTree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 30
"Hides swp files
let g:netrw_list_hide= '.*\.swp$'
"let g:netrw_list_hide= '.*\.swo$'
"Automatically open Vexplore at startup and shift focus
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * Vexplore 
  autocmd VimEnter * wincmd p
  autocmd VimEnter * command W wq | q!
  "autocmd VimEnter * command W! wq! | q!
  "autocmd VimEnter * command Q! q! | q!
	autocmd VimEnter * command Q q | q!
augroup END

"autocmd bufenter * if(winnr("$") == 1 && exists(":Vexplore") && bufwinnr("NetrwTreeListing 1"))  | q | endif																			
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif	"Closes the last remainig NERDTree split window
"
