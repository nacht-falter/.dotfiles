# my keybindings
## vim

\<leader> = space  

### mode specific

jk → leave insert or visual mode (== ESC)  
\<C-o> → run in insert mode to execute one command and reenter insert mode  
= → auto aligns selected lines in visual mode  
ci{character or object} → change inner (also works with tags: cit)

### objects

{operation}is → perform operation inside sentence, e.g. dis deletes a sentence but not the whitespaces around it.  
{operation}as → perform operation around sentence, e.g. dis deletes a sentence including the whitespaces around it.  
{operation}ip → perform operation inside paragraph  
{operation}ap → perform operation around paragraph  
{operation}iw → perform operation inside word  
{operation}aw → perform operation around word  
{operation}at → perform operation inside tag  
{operation}at → perform operation around tag


### movement

f\<character> → jump to next <character> in line  
F\<character> → jump to previous <character> in line  
\<leader>0 → jump to beginning of paragraph  
\<leader>$ → jump to end of paragraph  

### windows

\<leader>sv → split window vertically (<C-w>v)  
\<leader>sh → split window horizontally (<C-w>s) 
\<leader>se → make windows equal width (<C-w>=) 
\<leader>sc → close current window (<C-w>c) 
\<leader>ss → swap windows (<C-w-x)  
\<leader>s< → decrease current window width (<C-w><)  
\<leader>s> → increase current window width (<C-w>>)  
\<leader>s+ → increase current window height (<C-w>+)  
\<leader>s- → decrease current window height (<C-w>-)  

### tabs

\<leader>to → open new tab  (:tabnew)
\<leader>tc → close current tab  (:tabclose)
\<leader>tn → go to next tab  (:tabn)
\<leader>tp → go to previous tab (tabp) 

### lines

\<leader>j → swaps current line with line below  
\<leader>k → swaps current line with line above  
\<leader>n → adds a new line below without going to insert mode  
\<leader>N → adds a new line above without going to insert mode  

### vim-surround

ys{motion}\<char> or <tag> → surrounds the selected motion with the character. For brackets: Using the opening bracket adds a whitespace around the {motion}, using the closing bracket doesn't.  
ds\<char> → deletes the surrounding characters  
cs\<char1><char2> → replaces surrounding character1 with character2  
cst\<char> → replace surrounding tag with character  
dst → delete surrounding tag  

### vim-tmux

\<C-j> → go to window below  
\<C-k> → go to window above  
\<C-h> → go to window on the left  
\<C-l> → go to window on the right  

### comments

gcc → comment current line  
gc{motion} → comment motion → repeat command to undo  

### nvim-tree

\<leader>e → toggle file explorer  

### telescope fuzzy finder

\<leader>ff → open search mask for files within pwd  
\<leader>fs → open search mask for strings within pwd  
\<leader>fc → search for string under cursor within pwd  
\<leader>fb → list buffers  
\<leader>fh → list help tags  

### harpoon file navigator

\<leader>h → open harpoon window  
\<leader>a → add current file to harpoon  
\<leader>[n] → switch to [n]th file in harpoon  

### autocomplete

\<C-j> → go down to next suggestion  
\<C-k> → go up to previous suggestion  

### color-picker

\<leader>w → open color-picker in normal mode
\<C-w> → open color-picker in insert mode
\<leader>cr → convert between rgb and hex
\<leader>ch → convert between hsl and hex

### buffers

:bd → delete current buffer  

## tmux bindings

\<C-Space> → prefix for tmux commands  
\<C-r> → search command history backwards  
\<C-s> → search command history forwards  
\<prefix>< → toggle tmux command menu 
\<prefix>space → rearrange panes in current window
\<prefix>- → split pane horizontally  
\<prefix>| → split pane vertically  
\<prefix>h,j,k,l → resize panes  
\<C-hjkl> → move between panes  
\<prefix>m → toggle maximize pane  
\<prefix>x → close pane 
\<prefix>c → create new tmux window  
\<prefix>[n] → switch to window number [n]  
\<prefix>n → switch to next window  
\<prefix>w → show all windows  
\<prefix>s → show all sessions  
\<prefix>, → rename tmux window  
\<C-v> → enter vim copy' mode  
    kl → move cursor up or down in copy mode  
    v{motion} → select {motion} in copy mode  
    y → copy selected text in copy mode  
    \<C-c> → exit copy mode  

## obsidian vim bindings

s" → surround with double quotation marks  
s' → surround with single quotation marks  
sb → surround with brackets  
ss → surround with square brackets  
sc → surround with curly brackets  
sq → surround with double guillemets  
sg → surround with single guillemets  
\<Cmd-^> → enter new footnote  
\<C-H> → toggle left sidebar  
\<C-L> → toggle right sidebar  

## raycast bindings
### general

Cmd, → open raycast preferences  
Cmd. → open note  

### window management

\<prefix> = Ctrl+Cmd  
\<prefix>key_left → move window to previous desktop  
\<prefix>key_right → move window to next desktop  
\<prefix>key_up → move window to next display  
\<prefix>key_down → move window to previous display  
    
## Skhd bindings
### navigate windows
\<prefix> = Ctrl  
\<prefix>j,h,k,l → move focus between windows  
\<prefix>n,p → move focus to next/previous space  
\<prefix>u,d → move focus between external displays (up and down)  
    
### move windows
\<prefix> = Ctrl + Cmd  
\<prefix>r → rotate layout clockwise  
\<prefix>y → flip along y-axis  
\<prefix>x → flip along x-axis  
\<prefix>t → toggle window float  
\<prefix>m → maximize a window  
\<prefix>e → balance out tree of windows (resize to occupy same area)  
\<prefix>h,j,k,l → swap windows  
\<prefix>H,J,K,L →  move window and split  
\<prefix>p,n → move window to prev and next space  
\<prefix>{n} → move window to space n  
