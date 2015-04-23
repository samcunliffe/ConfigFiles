
"""""""""""""""""""""
" Settings for gvim "
"""""""""""""""""""""

" default window
set lines=80 columns=120

" aesthetics
colorscheme navajo-night    " nice color scheme
set guioptions-=T           " turns off button toolbar
set guioptions-=r           " turns off rh scrollbar
if hostname() == "zero-gravitas"
	set guifont=Ubuntu\ Mono\ 19
endif " large onscreen font for teh highres screen

" Loading pathogen from bundle folder
runtime bundle/vim-pathogen/autoload/pathogen.vim

" syntastic
let g:syntastic_c_include_dirs = [ '../include', 'include', '/afs/cern.ch/sw/lcg/app/releases/ROOT/5.34.05/x86_64-slc5-gcc46-opt/root/include/' ]
