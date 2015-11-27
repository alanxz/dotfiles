set nocompatible

filetype off

call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'scrooloose/syntastic'
Plug 'cohama/lexima.vim'

Plug 'altercation/vim-colors-solarized'

Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'

Plug 'kien/ctrlp.vim'

Plug 'google/vim-searchindex'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'

if filereadable(expand('~/.vimrc.at_work.vim'))
  source ~/.vimrc.at_work.vim
  call plug#end()
else
  Plug 'google/vim-maktaba'
  Plug 'google/vim-codefmt'
  Plug 'google/vim-glaive'
  Plug 'tpope/vim-fugitive'
  Plug 'fatih/vim-go'
  Plug 'mhinz/vim-signify'
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
  Plug 'majutsushi/tagbar'

  call plug#end()

  call glaive#Install()
  Glaive codefmt plugin[mappings]

endif

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

" Enable spell checking.
set spell

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

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

" vim-go ------------------------------------------------------- {{{2
au FileType go nmap <leader>br <Plug>(go-run)
au FileType go nmap <leader>bb <Plug>(go-build)
au FileType go nmap <leader>bt <Plug>(go-test)
au FileType go nmap <leader>bc <Plug>(go-coverage)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

" Customization ------------------------------------------------ {{{2
nnoremap <tab> <c-w>

set textwidth=80

set colorcolumn=+1
set cursorline

" Make switching between panes painless.
noremap <tab> <c-w>

filetype plugin indent on
syntax on
