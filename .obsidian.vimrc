map j gj
nmap k gk
nmap 0 g0
nmap $ g$

" unmapping space to act as leader key
unmap <Space> 

" enable line swapping
nmap <Space>j ddp
nmap <Space>k ddkP

" jump to beginning/end of paragraph
nmap <Space>0 {w
nmap <Space>$ }ge

" Yank to system clipboard
set clipboard=unnamed

" set jk to leave insert mode 
imap jk <Esc>

" enable vim-surround behaviour
exmap surround_double_quotes surround " "
exmap surround_double_guillemets surround » «
exmap surround_single_quotes surround ' '
exmap surround_single_guillemets surround › ‹
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }
exmap surround_asterisk surround * *
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
