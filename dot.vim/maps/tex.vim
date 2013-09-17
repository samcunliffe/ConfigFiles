
" tab
set softtabstop=2 " two spaces width per tab
set expandtab     " please make them *actual* spaces

" auto indent
set shiftwidth=2  " ai spacing
set autoindent    " ai on
set smartindent   " please indent correctly into finctions etc


" compile pdflatex on main.tex
map <F10> :w<CR>:!pdflatex main.tex<CR>

" compile bibtex on current file
map <F11> :w<CR>:!bibtex %:p<CR>

" compile pdflatex on current file
map <F12> :w<CR>:!pdflatex %:p<CR>

map '% %<CR>%--------------------------------<Esc>kA

" if not in terminal mode, spell checker will be
" ms word-like squiggly underlines so turn it on
if v:progname =~? "gvim"
  setlocal spell!
endif

imap 'fr \begin{frame}[c]\frametitle{}<CR><CR>\end{frame}<Esc>2k$i
imap 'it \begin{itemize}<Esc>yyplcwend<Esc>O<C-T>\item
imap 'gr \centering<Esc>o<C-T>\includegraphics[width=0.5\textwidth]{1figs/}<Esc>i
imap 'ce \begin{center}<Esc>yyplcwend<Esc>O
imap 'eq \begin{equation}<Esc>yyplcwend<Esc>O
imap 'ta \begin{table}<Esc>yyplcwend<Esc>O'ce'bu
imap 'bu \begin{tabular}{}<Esc>yyplcwend<Esc>$xxo\caption{Caption}<Esc>o\label{tab:table}<Esc>kO<C-T>
imap 'fi \begin{figure}<Esc>yyplcwend<Esc>O<C-T>\caption{}<CR>\label{}<Esc>kO'gr

vmap ? I%<Esc>



