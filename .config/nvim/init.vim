" https://github.com/junegunn/vim-plug
call plug#begin(stdpath('data') . '/plugged')

" https://github.com/ycm-core/YouCompleteMe
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer' }

Plug 'lifepillar/vim-solarized8'

call plug#end()

" Enable truecolor support
set termguicolors

set background=dark
colorscheme solarized8

set number
