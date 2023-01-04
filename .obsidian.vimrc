" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk
nmap 0 g0
nmap $ g$

" Yank to system clipboard
set clipboard=unnamed

imap jk <Esc>

exmap surround_double_quotes surround " "
exmap surround_double_guillemets surround » «
exmap surround_single_quotes surround ' '
exmap surround_single_guillemets surround › ‹
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }
exmap surround_asterisk surround * *

" NOTE: must use 'map' and not 'nmap'
nunmap s
vunmap s
map s" :surround_double_quotes
map s' :surround_single_quotes
map sb :surround_brackets
map s( :surround_brackets
map s) :surround_brackets
map s[ :surround_square_brackets
map ss :surround_square_brackets
map s{ :surround_curly_brackets
map sc :surround_curly_brackets
map sq :surround_double_guillemets
map sg :surround_single_guillemets
map sa :surround_asterisk
