

" make bkg different colour past 80 chars
" encourage good practice in C++ and python
highlight rightMargin term=bold ctermfg=magenta guifg=blue ctermbg=red
match rightMargin /.\%>80v/

imap ''" """<Esc>YpO
imap ''nm if<Space>__name__<Space>==<Space>"__main__":<CR>
imap ''# <Esc>O###########################################<Esc>YpO#<Space>
map ''# O###########################################<Esc>YpO#<Space>


" can press '?' in vim mode to comment out line
vmap ? I#<Esc>

"imap <leader>/ <Esc>I#
"map <leader>/ I#<Esc>j

syn keyword rootType  TH1F TH1D TH1 TGraph TH2F TH2D TH2
syn keyword rootType  TTree TBranch TFile TChain TCanvas TString
hi def link rootType  Type

