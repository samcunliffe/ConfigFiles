
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

""""""""""""""""""""""""""""""
" Misc Settings that I like "
""""""""""""""""""""""""""""""

syntax on " obviously !?

" turn off error bell, switch on visual bell
set visualbell

" turn line numbers on
set number

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

" looks in ~/.vim/indent for filetype-specific indentation rules
" i.e. out python indenting by looking in indent/python.vim
filetype plugin indent on


""""""""""""""""""""""""""""""
" colours and colour schemes "
""""""""""""""""""""""""""""""

" current favourite is 'evening' ron was nice on ubuntu but looks terrible in
" the MacOS terminal
colorscheme evening

" I use folds, so let's not have them looking butt ugly
highlight Folded ctermfg=magenta ctermbg=darkgreen
highlight Folded guifg=magenta   guibg=darkgreen


"""""""""""""""""""""
" useful remappings "
"""""""""""""""""""""

" nb. do not remap <F1> !!

" move to next split using ctrl+hjkl
nmap <silent> <C-k> <C-w><C-k>
nmap <silent> <C-j> <C-w><C-j>
nmap <silent> <C-h> <C-w><C-h>
nmap <silent> <C-l> <C-w><C-l>

" Disable arrow keys -- bully myself into using hjkl
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Ex mode... which is NO USE WHATSOEVER
map Q <nop>

""""""""""""""""""""""""
" Map leader shortcuts "
""""""""""""""""""""""""

" Custom map leder for own shortcuts
let mapleader = ","

" Create a paste mode
map <leader>p :set nonumber<CR>:set paste<CR>

" Create out-of-paste mode
map <leader>o :set number<CR>:set nopaste<CR>
let mapleader = ","

"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>


"""""""""""""""
" Python stuff
"""""""""""""""

" proper highlighting: doesn't work in maps/python.vim
" for some reason
let python_highlight_numbers = 1
let python_highlight_builtins = 1
let python_highlight_exceptions = 1


"""""""""""""""""""""""""""""""""""""
" Load my own defined maps and prefs
" for different languages
""""""""""""""""""""""""""""""""""""""

" turn on spell check by default for some filetypes
autocmd BufRead,BufNewFile *.md setlocal spell " markdown
autocmd BufRead,BufNewFile *.md setlocal complete+=kspell
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit setlocal complete+=kspell

" latex
autocmd BufNewFile,BufRead *.tex source $HOME/.vim/maps/tex.vim

" python
autocmd FileType python source $HOME/.vim/maps/python.vim

" c/c++ with root
autocmd FileType cpp source $HOME/.vim/maps/cpp.vim
autocmd FileType cc source $HOME/.vim/maps/cpp.vim
autocmd FileType c source $HOME/.vim/maps/cpp.vim
autocmd FileType C source $HOME/.vim/maps/cpp.vim
autocmd FileType hpp source $HOME/.vim/maps/cpp.vim
autocmd FileType h source $HOME/.vim/maps/cpp.vim
autocmd FileType hs source $HOME/.vim/maps/haskell.vim

" odd fortran filetype (fortran include)
autocmd FileType fi set syntax=fortan

" tabs not spaces when using makefile
autocmd BufNewFile,BufRead Makefile set noexpandtab

