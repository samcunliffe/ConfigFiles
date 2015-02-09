
"""""""""""""""""""""
" Settings for gvim "
"""""""""""""""""""""

" default window
set lines=90 columns=90

" aesthetics
colorscheme navajo-night    " nice color scheme
set guioptions-=T           " turns off button toolbar
set guioptions-=r           " turns off rh scrollbar

" Loading pathogen from bundle folder
runtime bundle/vim-pathogen/autoload/pathogen.vim
"call pathogen#infect()

" syntastic
let g:syntastic_c_include_dirs = [ '../include', 'include', '/afs/cern.ch/sw/lcg/app/releases/ROOT/5.34.05/x86_64-slc5-gcc46-opt/root/include/' ]
