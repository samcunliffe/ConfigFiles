

""""""""""""""""""""""""""
" configure tabs for c++ "
""""""""""""""""""""""""""

" tab
set softtabstop=2 " two spaces width per tab
set expandtab     " please make them *actual* spaces

" auto indent
set shiftwidth=2  " ai spacing
set autoindent    " ai on
set smartindent   " please indent correctly into finctions etc


"" make bkg different colour past 80 chars
"" encourage good practice in C++ and python
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
imap ''wh while() {<CR>}<Esc>kwli
imap ''fo for (int ;;) {<CR>}<Esc>k3wi
imap ''if if () {<CR>}<Esc>kwli
imap ''ei else if () {<CR>}<Esc>k2wli
imap ''el else {<CR>}<Esc>O<C-T>
imap ''ma int main(int argc, char *argv[])<CR>{<CR>}<Esc>Oreturn 0;<Esc>O
imap ''sw switch(){<CR>case :<CR>default:<CR>}<Esc>kO<C-T>break;<Esc>2khi
imap ''co std::cout << "" << std::endl;<Esc>14hi
imap ''ce std::cerr << "" << std::endl;<Esc>14hi
imap ''CO cout << "" << endl;<Esc>9hi
imap ''CE cerr << "" << endl;<Esc>9hi
imap ''de #ifndef <CR>#define <CR><CR><CR><CR>#endif //CLASS_HPP<Esc>5kA

"imap <leader>/ <Esc>I//
"imap ''* /*<Esc>O*/<Esc>h35i*<Esc>k35i*<Esc>2o<Esc>O
"imap ''* /<Space><Esc>32i*<Esc>xyypx$hC/<Esc>O<C-T>.<Esc>o<Esc>kO<Esc>jxA
"map <S-Insert> <MiddleMouse>

" can press '?' in visual mode to comment out lines
vmap ? I//<Esc>
" in normal mode can press ,/ to comment out line
map <leader>/ I//<Esc>j
" and ,. to uncomment (or delete the first char of a line)
map <leader>. I<Del><Del><Esc>j

"imap ''/ <Space><Esc>75i/<Esc>$2xo<Esc>
         
" C++ syntax highlighting
syn keyword strType   string stringstream 
syn keyword vecType   vector
 
" ROOT and RooFit syntax highlighting
" /usr/share/vim/vim70/syntax for examples
syn keyword rootType  Int_t Long64_t Double_t Float_t Bool_t Color_t
syn keyword rootType  TH1F TH1D TH1 TGraph TGraphErrors TH2F TH2D TH2
syn keyword rootType  TH3F TH3D TH3 TMultiGraph
syn keyword rootType  TGenPhaseSpace TTreeFormula TRandom3 TMath 
syn keyword rootType  TTree TBranch TFile TChain TCanvas TString
syn keyword rootType  TDirectory TObject TIter TKey
syn keyword rootType  TLine TBox TLegend TLatex
syn keyword rootType  TTime TDatime
syn keyword rootType  TVector2 TVector3 TRotation 
syn keyword rootType  TLorentzVector TLorentzRotation
syn keyword rootType  TDatime 

syn keyword rootColor kRed kYellow kOrange kBlue kPink kMagenta
syn keyword rootColor kViolet kBlue kAzure kCyan kTeal kGreen kSpring
syn keyword rootConst kTRUE kFALSE

syn keyword rooType   RooAbsPdf RooAbsReal RooAbsArg
syn keyword rooType   RooFitResult RooMinuit
syn keyword rooType   RooArgList RooArgSet
syn keyword rooType   RooCategory RooWorkspace
syn keyword rooType   RooPlot RooDataSet
syn keyword rooType   RooRealVar RooFormulaVar

" all the pdfs under the sun
syn keyword rooType   RooSimultaneous RooRealSumPdf RooEffProd
syn keyword rooType   RooAddPdf RooSimPdf RooProdPdf RooEffProd RooNumConvPdf
syn keyword rooType   RooGaussian RooMultiVarGaussian RooExponential 
syn keyword rooType   RooKeysPdf RooHistPdf
syn keyword rooType   RooLandau RooCBShape RooArgusBG
syn keyword rooType   RooChebychev RooPolynomial RooDstD0BG RooBernstein

hi def link rootType  Type
hi def link rootColor Constant
hi def link rooType   Type
hi def link strType   Type
hi def link vecType   Type
hi def link rootConst Constant


