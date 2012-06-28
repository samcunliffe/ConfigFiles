
" make bkg different colour past 80 chars
" encourage good practice in C++ and python
highlight rightMargin term=bold ctermfg=magenta ctermbg=red 
match rightMargin /.\%>80v/

" use syntax folding by default
" i.e. fold all functions etc using {}
set foldmethod=syntax


""""""""""""""""""""
" Compile shortcuts
""""""""""""""""""""
map <F11> :w<CR>:!g++ -o %:t:r %:t `root-config --cflags --libs`<CR>
map <F12> :w<CR>:!g++ -o %:t:r %:t `root-config --cflags --libs` -lRooStats -lRooFit -lRooFitCore<CR>

"""""""""""""""""""
" Coding shortcuts
"""""""""""""""""""

" frequently typed structures
imap ''in #include ""<Esc>i
imap ''IN #include <><Esc>i
imap ''wh while(){<CR>}<Esc>kwli
imap ''fo for(int ;;){<CR>}<Esc>k3wi
imap ''if if(){<CR>}<Esc>kwli
imap ''ei else if(){<CR>}<Esc>k2wli
imap ''el else{<CR>}<Esc>O<C-T>
imap ''ma int main(int argc, char *argv[])<CR>{<CR>}<Esc>Oreturn 0;<Esc>O
imap ''sw switch(){<CR>case :<CR>default:<CR>}<Esc>kO<C-T>break;<Esc>2khi
imap ''co cout<<""<<endl;<Esc>7hi

"map <leader>/ I//<Esc>j
"imap <leader>/ <Esc>I//
"imap ''* /*<Esc>O*/<Esc>h35i*<Esc>k35i*<Esc>2o<Esc>O
"imap ''* /<Space><Esc>32i*<Esc>xyypx$hC/<Esc>O<C-T>.<Esc>o<Esc>kO<Esc>jxA
"map <S-Insert> <MiddleMouse>

" can press '?' in vim mode to comment out line
"vmap ? I//<Esc>

"imap ''/ <Space><Esc>75i/<Esc>$2xo<Esc>
         
 
" ROOT and RooFit syntax highlighting
" /usr/share/vim/vim70/syntax for examples
syn keyword rootType  Int_t Long64_t Double_t Float_t Bool_t Color_t
syn keyword rootType  TH1F TH1D TH1 TGraph TH2F TH2D TH2
syn keyword rootType  TH3F TH3D TH3 
syn keyword rootType  TLorentzVector TGenPhaseSpace TTreeFormula 
syn keyword rootType  TTree TBranch TFile TChain TCanvas TString
syn keyword rootType  TDirectory TObject TIter TKey
syn keyword rootType  TLine TBox TLegend TLatex
syn keyword rootType  TRandom3 TMath TVector3

syn keyword rootColor kRed kYellow kOrange kBlue kPink kMagenta
syn keyword rootColor kViolet kBlue kAzure kCyan kTeal kGreen kSpring

syn keyword rooType   RooAbsPdf RooAbsReal
syn keyword rooType   RooSimPdf RooRealVar RooFormulaVar
syn keyword rooType   RooGaussian RooExponential RooDataSet
syn keyword rooType   RooKeysPdf RooPlot RooSimultaneous
syn keyword rooType   RooCategory RooArgList RooWorkspace
syn keyword rooType   RooAddPdf RooLandau RooCBShape
syn keyword rooType   RooChebychev

syn keyword strType   string stringstream 
syn keyword vecType   vector

syn keyword rooConst  kTRUE kFALSE

hi def link rootType  Type
hi def link rooColor  Constant
hi def link rooType   Type
hi def link strType   Type
hi def link vecType   Type
hi def link rooConst  Constant


