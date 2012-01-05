" Prevent vim from emulating vi
set nocompatible
" Easier to reach than \
let mapleader = ","

" Make backspace work like 'normal' text editors
set backspace=start,indent,eol

" -- history
set history=500
set undolevels=500

" -- interface appearance
syntax enable	" enable syntax highlighting and allow custom highlighting
set title		" set title to filename and modification status
set number		" show line numbers
set ruler		" always show current position
set showcmd		" show the command being typed
set showmode	" show the current mode (inserver, visual, etc.)
set laststatus=2 " always show status line

" -- searching
set ignorecase	" ignore case when searching
set smartcase	" case sensitive only when capital letter in expression
set hlsearch	" highligh search terms
set incsearch	" show matches as they are found

" -- feedback
set showmatch	" show matching braces when typed or under cursor
set matchtime=2 " length of time for 'showmatch'

" -- redrawing / warnings
set lazyredraw	" don't redraw screen when executing macros
set noerrorbells " no bell for error messages
set visualbell	" use whenever 't_vt' is set to as a bell
set t_vb=		" set to nothing (disable)

if has("gui_running")
	augroup disable_gui_visualbell
		autocmd!
		autocmd GUIEnter * set t_vb=
	augroup end
endif

" -- command-line completion
set wildmenu

" -- visual theme and appearance
"  color scheme desert	" preferred colorscheme
set background=dark

if has("gui_running")
	" gVim specific

	" gVim interface modifications
	"set guioptions-=m " remove menu bar
	"set guioptions-=T " remove toolbar
endif

" force 256 colors (required fro xterm and screen-bce $TERMs)
if &term == "xterm" || &term == "screen-bce"
	set t_Co=256
endif

" --navigation
set scrolloff=5	" Scrolling starts 5 lines before window border

" easier window naviation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" -- filetype detection
filetype off
"filetype plugin indent on	" let vim detect filetype and load appropriate scripts

" -- character encoding
set encoding=utf-8	" encodings used within vim
set fileencodings=usc-bom,utf-8,default,latin1	" encodings to try when editing a file

" -- buffer management
set hidden	" allow buffer to be changed without writing to disk
"set autoread	" update file when externally modified

" -- indenting
set fileformats=unix,dos,mac	" try recognizing line endings in this order
set tabstop=4					" width of a tab character in spaces
set softtabstop=4				" defines number of spaces for when adding/removing tabs
set shiftwidth=4				" number of spaces to use for autoindent
set expandtab					" use spaces instead of tab characters: to use real tab, use <C-v><Tab>
set cindent						" automatic indenting see ':h C-indenting' for comparison


" Setup vundle
"set runtimepath+=~/.vim/bundle/vundle/
"call vundle#rc()

" let Vundle manage Vundle
"Bundle 'gmarik/vundle'

" ClangComplete
"Bundle 'Rip-Rip/clang_complete'
"let g:clang_auto_select=1
"let g:clang_complete_auto=1
"let g:clang_hl_errors=1
"let g:clang_snippets=1
"let g:clang_use_library=1
"let g:clang_library_path='/usr/local/lib'
"let g:clang_debug=1

" a - alternate between h/cpp files
"Bundle 'a'

" haskellmode
"Bundle 'lukerandall/haskellmode-vim'
"au BufEnter *.hs compiler ghc


au BufNewFile,BufRead *.txx set filetype=cpp
" Kill the annoying wrap feature of vim wtih *.txt
au BufNewFile,BufRead CMakeLists.txt set filetype=cmake textwidth=0

filetype plugin indent on
