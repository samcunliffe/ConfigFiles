

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


""""""""""""""""""""""""""""""
" Misc Settings that I like "
""""""""""""""""""""""""""""""

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


""""""""""""""""""""""""""""""
" colours and colour schemes "
""""""""""""""""""""""""""""""

" I use folds, so let's not have them looking butt ugly
highlight Folded ctermfg=magenta ctermbg=darkgreen
highlight Folded guifg=magenta   guibg=darkgreen
"ctermbg=dar
"#522719


"""""""""""""""""""""
" useful remappings "
"""""""""""""""""""""

" nb. do not remap <F1> !!

" move to next split using ctrl+hjkl
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
" move to next split using ctrl+arrows
nmap <silent> <C-up> :wincmd k<CR>
nmap <silent> <C-down> :wincmd j<CR>
nmap <silent> <C-left> :wincmd h<CR>
nmap <silent> <C-right> :wincmd l<CR>

" Disable arrow keys
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>


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

" proper highlighting: doesn't work in maps/python.vim
" for some reason
let python_highlight_numbers = 1
let python_highlight_builtins = 1
let python_highlight_exceptions = 1


"""""""""""""""""""""""""""
" Load my own defined maps 
" for different languages
"""""""""""""""""""""""""""

" latex
autocmd BufNewFile,BufRead *.tex source $HOME/.vim/maps/tex.vim

" python
autocmd FileType python source $HOME/.vim/maps/python.vim
"autocmd FileType python source $HOME/.vim/python.vim

" c/c++ with root
autocmd FileType cpp source $HOME/.vim/maps/cpp.vim
autocmd FileType cc source $HOME/.vim/maps/cpp.vim
autocmd FileType c source $HOME/.vim/maps/cpp.vim
autocmd FileType C source $HOME/.vim/maps/cpp.vim
autocmd FileType hpp source $HOME/.vim/maps/cpp.vim
autocmd FileType h source $HOME/.vim/maps/cpp.vim

" tabs not spaces when using makefile
autocmd BufNewFile,BufRead Makefile set noexpandtab
filetype plugin indent on " sort out python indenting by looking in indent/python.vim

