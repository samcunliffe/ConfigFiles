
" reconfigure tabs for python
set softtabstop=4 " four spaces width per tab


" make bkg different colour past 80 chars
" encourage good practice in C++ and python
highlight rightMargin term=bold ctermfg=magenta guifg=blue ctermbg=red
match rightMargin /.\%>80v/

" shortcut to add a docstring
" if you don't put docstrings in your functions then you deserve a slow and painfull death
imap <leader>"! """"""<Esc>2hi
map <leader>"! i""""""<Esc>2hi

" shortcut to add a main
imap ''nm if<Space>__name__<Space>==<Space>"__main__":<CR>

" can make a comment title box
imap ''# <Esc>O###########################################<Esc>YpO#<Space>
map ''# O###########################################<Esc>YpO#<Space>


" can press '?' in vim mode to comment out line
vmap ? I#<Esc>

" press leader then '/' to comment out line in normal mode
"imap <leader>/ <Esc>I#
map <leader>/ I#<Esc>j
" and leader then '.' to uncomment line (or delete first char)
map <leader>. I<Del><Esc>j

" define some types
syn keyword rootType  TH1F TH1D TH1 TGraph TH2F TH2D TH2
syn keyword rootType  TTree TBranch TFile TChain TCanvas TString
hi def link rootType  Type

