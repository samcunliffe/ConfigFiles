

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


"""""""""""""""""""""
" Settings for gvim "
"""""""""""""""""""""

if v:progname =~? "gvim"

  " turn on and set up syntastic
  call pathogen#infect()
  set helptags
  let g:syntastic_c_include_dirs = [ '../include', 'include', '/afs/cern.ch/sw/lcg/app/releases/ROOT/5.34.05/x86_64-slc5-gcc46-opt/root/include/' ]

  " only want navajo-night if not in terminal
  colorscheme navajo-night

endif


""""""""""""""""""""""""""""""
" Misc Settings that I like "
""""""""""""""""""""""""""""""

" turn off error bell, switch on visual bell
set visualbell

" turn line numbers on
set number

" tab
set softtabstop=2 " two spaces width per tab
set expandtab     " please make them *actual* spaces

" auto indent
set shiftwidth=2  " ai spacing
set autoindent    " ai on
set smartindent   " please indent correctly into finctions etc

" make the status bar at the bottom better
set nocompatible ruler laststatus=2 showcmd showmode number

" put a dollar sign at the end of what's 
" being changed/replaced
set cpoptions+=$

" remembers previous search pattern... i think
set hlsearch

" a nice one-line menu at the bottom border
" for files to vsp or whatever
set wildmenu


""""""""""""""""""""""""""""""
" colours and colour schemes "
""""""""""""""""""""""""""""""

" I use folds, so let's not have them looking butt ugly
highlight Folded ctermfg=magenta ctermbg=darkgreen
highlight Folded guifg=magenta   guibg=darkgreen
"ctermbg=dar
"#522719


""""""""""""""""""""
" useful shortcuts "
""""""""""""""""""""

" nb. do not remap <F1> !!

" move to next split using ctrl+arrowkey
"map <F2> <C-W>w
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>


""""""""""""""""""""""""
" Map leader shortcuts "
""""""""""""""""""""""""

" Custom map leder for own shortcuts
let mapleader = ","

" Create a paste mode
map <leader>p :set nonumber<CR>:set paste<CR>

" Create out-of-paste mode
map <leader>o :set number<CR>:set nopaste<CR>
ret mapleader = ","

"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>


"""""""""""""""
" Python stuff
"""""""""""""""

" proper highlighting: doesn't work in pymaps.vim
" for some reason
let python_highlight_numbers = 1
let python_highlight_builtins = 1
let python_highlight_exceptions = 1


"""""""""""""""""""""""""""
" Load my own defined maps 
" for different languages
"""""""""""""""""""""""""""

" latex
autocmd BufNewFile,BufRead *.tex source $HOME/.vim/texmaps.vim

" python
autocmd FileType python source $HOME/.vim/pymaps.vim
autocmd FileType python source $HOME/.vim/python.vim

" c/c++ with root
autocmd FileType cpp source $HOME/.vim/cmaps.vim
autocmd FileType cc source $HOME/.vim/cmaps.vim
autocmd FileType c source $HOME/.vim/cmaps.vim
autocmd FileType C source $HOME/.vim/cmaps.vim
autocmd FileType hpp source $HOME/.vim/cmaps.vim
autocmd FileType h source $HOME/.vim/cmaps.vim

" tabs not spaces when using makefile
autocmd BufNewFile,BufRead Makefile set noexpandtab

