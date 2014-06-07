
set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'bling/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-endwise'

Plugin 'altercation/vim-colors-solarized'

if filereadable(expand('~/.at_work.vim'))
  source ~/.at_work.vim
else
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'mhinz/vim-signify'
  Plugin 'google/maktaba'
  Plugin 'google/glaive'
endif

Plugin 'fatih/vim-go'
Plugin 'klen/python-mode'

call vundle#end()
call glaive#Install()

colorscheme solarized
set background=dark

set tabstop=8 softtabstop=2 shiftwidth=2 expandtab smarttab
set list

set wrap
set linebreak
set autoindent

set number
set showcmd

set directory=~/.vimswap

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

" Syntastic ------------------------------------------------------{{{2

let g:syntasic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0

" UltiSnips ----------------------------------------------------- {{{2
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

filetype plugin indent on
syntax on