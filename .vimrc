set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'Valloric/ListToggle'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-endwise'

Plugin 'altercation/vim-colors-solarized'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

Plugin 'kien/ctrlp.vim'

if filereadable(expand('~/.vimrc.at_work.vim'))
  source ~/.vimrc.at_work.vim
else
  Plugin 'tpope/vim-fugitive'
  Plugin 'mhinz/vim-signify'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'majutsushi/tagbar'

  noremap <c-i> :pyf ~/bin/clang-format.py<cr>
  inoremap <c-i> <esc>:pyf ~/bin/clang-format.py<cr>i
endif

call vundle#end()

let mapleader=','
noremap ,. ,

colorscheme solarized
set background=dark

set tabstop=8 softtabstop=2 shiftwidth=2 expandtab smarttab
set cinoptions=N-s,g1,h1,l1,t0,i4,+4,(0,w1,W4
set list

set wrap
set linebreak
set autoindent

set number
set hlsearch
set showcmd

set wildmode=longest,list,full

set directory=~/tmp,/var/tmp,/tmp,$TEMP
set undodir=~/tmp,/var/tmp,/tmp,$TEMP

set tags=./tags;/

" Airline config ------------------------------------------------ {{{2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tabline#enabled = 1

" Syntastic ------------------------------------------------------{{{2

let g:syntasic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0

" UltiSnips ----------------------------------------------------- {{{2
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" TagBar -------------------------------------------------------- {{{2
let g:tagbar_left=1
let g:tagbar_sort=0

nnoremap <F4> :TagbarToggle<cr><c-w>=

" ListToggle ---------------------------------------------------- {{{2
let g:lt_location_list_toggle_map = '<leader>i'
let g:lt_quickfix_list_toggle_map = '<leader>u'
let g:lt_height = 10

" Session ------------------------------------------------------- {{{2
let g:session_autoload        = 'yes'
let g:session_autosave        = 'yes'
let g:session_default_to_last = 'yes'
let g:session_directory       = '~/tmp/vim/sessions'

" CtrlP -------------------------------------------------------- {{{2
set wildignore+=*.o,*.obj,.git,*.pyc,*.so,blaze*,READONLY,llvm,Library*,CMakeFiles
nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>n :CtrlPBuffer<cr>
nnoremap <leader>' :CtrlPClearAllCaches<cr>

" Customization ------------------------------------------------ {{{2
nnoremap <tab> <c-w>

set textwidth=80

set colorcolumn=+1
set cursorline

" Make switching between panes painless.
noremap <tab> <c-w>

filetype plugin indent on
syntax on
