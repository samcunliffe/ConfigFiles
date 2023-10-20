""""""""""""""""""""""""""""""""
" Additional settings for gvim "
""""""""""""""""""""""""""""""""

" default window
set lines=80 columns=120

" aesthetics
colorscheme evening " nice color scheme
set guioptions-=T   " turns off button toolbar
set guioptions-=r   " turns off rh scrollbar

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h15
  endif
endif
