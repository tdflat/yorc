" skip vi compatibility
set nocompatible

set number
syntax on
filetype off

set encoding=utf-8
scriptencoding utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Plenty of color schemes
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'

" Navigating colorschemes
Plugin 'ScrollColors'

Plugin 'itchyny/lightline.vim'

" Autosave
Plugin 'vim-scripts/vim-auto-save'

" Match HTML Tags
Plugin 'gregsexton/MatchTag'

" Better HTML editing
Plugin 'tpope/vim-surround'

" fuzzy file finder
Plugin 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"\ue0a2":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? "\ue0a0 "._ : ''
  endif
  return ''
endfunction

" Color
set t_Co=256
colorscheme candy

set laststatus=2
set noshowmode

" Highlight current line
set cul
hi CursorLine term=none cterm=none ctermbg=0

" navigate buffers
nmap <Tab> :bnext<CR>

" Backspace properly
set backspace=indent,eol,start

" Backup settings
set nobackup
set noswapfile

" Indentation Settings
set expandtab
set shiftwidth=4
set tabstop=4

" Folding Settings
"set foldmethod=indent
"set foldlevelstart=
