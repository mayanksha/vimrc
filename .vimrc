"*************************************************************************
" 
" GIT REPO = mayanksha/vimrc (github)
"
"*************************************************************************
"*************** Custom Mappings ***************

"Map leader Key to ","
	let mapleader=","
"Remapped NUL to switch buffers
	inoremap <S-Tab> <C-V><Tab>
"Mappings for calling NERDComment using c
	nnoremap c :call NERDComment('n', 'SexyToggle')<CR>
	vnoremap c :call NERDComment('x', 'SexyToggle')<CR>
	nnoremap C :call NERDComment('n', 'NormalToggle')<CR>
	vnoremap C :call NERDComment('x', 'NormalToggle')<CR>
"nmap <Leader> <leader>c<space>
	noremap <NUL> :bn<CR>
nnoremap <F2> :bd<CR>
nnoremap <C-e> :call CloseBufWithoutClosingNetrw()<CR>
" Use ctrl-[hjkl] to select the active split!
	nmap <silent> <c-k> :wincmd k<CR>
"nmap <silent> <c-j> :wincmd j<CR>
	nmap <silent> <c-h> :wincmd h<CR>
	nmap <silent> <c-l> :wincmd l<CR>
"Toggle Netrw using Ctrl + J
	map <silent> <C-j> :call ToggleVExplorer()<CR>
"Code Folding in VIM
	inoremap <F3> <C-O>za
	nnoremap <F3> za
	onoremap <F3> <C-C>za
	vnoremap <F3> zf
	vnoremap <F6> zM
"Remap + and 0 for going to first non-whitespace character
	nnoremap ^ 0
	nnoremap 0 ^
"Map move to end of word to w
	map w e
"Vim Surround mappings
	vnoremap <silent> <Plug>VSurround  :<C-U>call <SID>opfunc(visualmode(),visualmode() ==# 'V' ? 1 : 0)<CR>
	xnoremap <silent> <M-"> :call <SNR>26_opfunc(visualmode(),visualmode() ==# 'V' ? 1 : 0)<CR>"
	xnoremap <silent> [ :call <SNR>26_opfunc(visualmode(),visualmode() ==# 'V' ? 1 : 0)<CR>]
	xnoremap <silent> ' :call <SNR>26_opfunc(visualmode(),visualmode() ==# 'V' ? 1 : 0)<CR>'
	xnoremap <silent> ( :call <SNR>26_opfunc(visualmode(),visualmode() ==# 'V' ? 1 : 0)<CR>)
	xnoremap <silent> { :call <SNR>26_opfunc(visualmode(),visualmode() ==# 'V' ? 1 : 0)<CR>}
"Delete Surrounding Pairs
	nnoremap <C-x> %x``x
	xnoremap <C-x> %x``x

	vnoremap . :normal .<CR>
	vnoremap <C-c> "+y
	vnoremap <C-v> "+p
	nnoremap <C-v> "+p

"*************** Vundle Configuration  ***************
"
	set nocompatible	"Changes other options as side effect filetype off                  " required
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	"Plugin 'tyrannicaltoucan/vim-quantum.git'
	Plugin 'jiangmiao/auto-pairs'
	"Plugin 'Quramy/tsuquyomi'
	Plugin 'ervandew/supertab'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'Konfekt/vim-alias'
	Plugin 'tpope/vim-fugitive'
	Plugin 'tpope/vim-surround'
	Plugin 'digitaltoad/vim-pug'
	Plugin 'alvan/vim-closetag'
	Plugin 'terryma/vim-multiple-cursors'
	Plugin 'Valloric/YouCompleteMe'
	Plugin 'scrooloose/NERDCommenter'
	Plugin 'Quramy/vim-js-pretty-template'
	"Plugin 'severin-lemaignan/vim-minimap'
	Plugin 'lervag/vimtex' 
	Plugin 'vim-scripts/Conque-GDB'
	Plugin 'vim-utils/vim-man'
	Plugin 'w0rp/ale'
	"Plugin 'moll/vim-node'
	Plugin 'leafgarland/typescript-vim'
	Plugin 'ternjs/tern_for_vim'
	"Plugin 'davidhalter/jedi-vim'
	"Plugin 'Shougo/deoplete.nvim'
	"Plugin 'zchee/deoplete-jedi'
	"Plugin 'roxma/nvim-yarp'
	"Plugin 'roxma/vim-hug-neovim-rpc'
	"Plugin 'ctrlpvim/ctrlp.vim'
	" All of your Plugins must be added before the following line
	call vundle#end()            " required
	filetype plugin indent on    " required

	" To ignore plugin indent changes, instead use:
	"filetype plugin on

"*************** Set commands ***************
"
	packadd! matchit
	syntax enable
	"set background=dark
	"set termguicolors
	"let g:quantum_dark = 1
	"colorscheme monokai
	"colorscheme basic-dark
	"colorscheme quantum 
	"colorscheme jellybeans
	"set relativenumber
	let g:neodark#background = '#232227'
	colorscheme neodark
	set t_Co=256
	set tabstop=4	"Tab is four spaces
	set autoindent	"Autoindenting always on
	set copyindent	"Copy Previous indent on autoindenting
	set number
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
	set encoding=utf-8
	set cursorcolumn
	set cursorline
	set hidden	
	set splitbelow
	setlocal foldmethod=manual
	"set listchars=tab:\¦\ 

"*************** Custom Mappings ***************
"

filetype plugin indent on	"Turns the filetype plugin on
"autocmd vimenter * NERDTree
"autocmd vimenter * wincmd p	"Changes the focus from NERDTree to Opened File
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif	"Closes the last remainig NERDTree split window
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags	"Autocompletes HTML tags
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType html setlocal shiftwidth=2 tabstop=2 

autocmd FileType cpp set keywordprg=cppman
autocmd FileType c,cpp nmap <F4> :YcmCompleter FixIt<CR>
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript JsPreTmpl markdown
autocmd FileType typescript JsPreTmpl markdown
"autocmd FileType typescript syn clear foldBraces 

autocmd FileType tex setlocal 
autocmd FileType python nmap <F5> :w <CR> :!python3 %<CR>
autocmd FileType sh nmap <F5> :w <CR> :!./%<CR>
autocmd FileType c nmap <F5> :!clear;gcc -g % -lpthread && ./a.out<CR>
autocmd FileType cpp nmap <F5> :!clear<CR> :!g++ -g -std=c++11 % && ./a.out<CR>
autocmd FileType tex nmap <F5> :!latexmk -pdf -pdflatex=xelatex ./cv.pdf<CR>
au BufRead,BufNewFile *.ts  setlocal filetype=typescript


"*************** Let Commands ***************
let g:pymode_python = 'python3'

"JEDI VIM CONFIGURATION 
"Disables the function definitions
"let g:jedi#show_function_definition = 0

"FOR YCM, to query the omni completion engine at each keypress. Might cause
"stuttering
"let g:ycm_cache_omnifunc = 1
"For YCM TO choose the default binary for python
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_min_num_identifier_candidate_chars = 5
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.','re![_a-zA-Z0-9]'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::', 're![_a-zA-Z0-9]'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
"YCM Disabled on python
"let g:ycm_filetype_specific_completion_to_disable = { 'python' : 1 }
"let g:ycm_filetype_blacklist = { 'python' : 1 }

let g:typescript_compiler_binary = 'tsc'
"let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"Below option shows the method's signature while completion
	"let g:tsuquyomi_completion_detail = 1
	"autocmd FileType typescript setlocal completeopt+=menu,preview

"Enable vim-airline
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_section_y = ''

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

	let g:airline#extensions#tabline#left_sep = ''
	let g:airline#extensions#tabline#left_alt_sep = ''
	let g:airline#extensions#tabline#right_sep = ''
	let g:airline#extensions#tabline#right_alt_sep = ''

	let g:airline_theme='wombat'

"let g:neocomplete#enable_at_startup = 1
"set runtimepath^=~/.vim/bundle/node-complete/after
	let g:SuperTabDefaultCompletionType = "context"

"Vim-Multiple Cursors Configuration
	let g:multi_cursor_next_key='<C-n>'
	let g:multi_cursor_prev_key='<C-p>'
	let g:multi_cursor_skip_key='<C-x>'
	let g:multi_cursor_quit_key='<Esc>'

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_cpp = 1
let g:NERDCompactSexyComs = 1
let g:NERDToggleSexyComments = 1

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
	"autocmd VimEnter * Vexplore 
	"autocmd VimEnter * wincmd p
	autocmd VimEnter * command W wq | q!
	"autocmd VimEnter * command W! wq! | q!
	"autocmd VimEnter * command Q! q! | q!
	autocmd VimEnter * command Q q | q!
augroup END

"autocmd bufenter * if(winnr("$") == 1 && exists(":Vexplore") && bufwinnr("NetrwTreeListing 1"))  | q | endif																			
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif	"Closes the last remainig NERDTree split window
"

"*************** Custom Functions  ***************

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
		"Below is a bug in Netrw changing the hidden value to nohidden, being
		"tracked here : https://github.com/vim/vim/issues/2408 
		set hidden
		let t:expl_buf_num = bufnr("%")
	endif
endfunction
