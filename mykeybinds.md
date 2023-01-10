# Vim:

## mode specific

jk -- leave insert or visual mode (== ESC)

<C-o> -- run in insert mode to execute one command and reenter insert mode

= -- auto aligns selected lines in visual mode

## windows

<C-w>v -- split window vertically

<C-w>s -- split window

<C-w>c -- close current window

<C-w>= -- set horizontal windows to equal size

## tab

:[count]tabnew -- open new tab (in positon [count])

:tabclose -- close current tab

:tabn -- go to next tab

:tabp -- go to previous tab

## objects

{operation}is -- perform operation inside sentence, e.g. dis deletes a sentence but not the whitespaces around it.

{operation}as -- perform operation around sentence, e.g. dis deletes a sentence including the whitespaces around it.

{operation}ip -- perform operation inside paragraph

{operation}ap -- perform operation around paragraph

{operation}iw -- perform operation inside word

{operation}aw -- perform operation around word

leader = space

## movement

f<character> -- jump to next <character> in line

F<character> -- jump to previous <character> in line

<leader>0 -- jump to beginning of paragraph

<leader>$ -- jump to end of paragraph

## windows

<leader>sv -- split window vetically

<leader>se -- make windows equal width

<leader>sh -- split window horizontally

<leader>sc -- close current window

## tabs

<leader>to -- open new tab

<leader>tc -- close current tab

<leader>tn -- go to next tab

<leader>tp -- go to previous tab

## lines

<leader>j -- swaps current line with line below

<leader>k -- swaps current line with line above

<leader>n -- adds a new line below without going to insert mode

<leader>N -- adds a new line above without going to insert mode

## vim-surround

ys{motion}<char> or <tag> -- surrounds the selected motion with the character. For brackets: Using the opening bracket adds a whitespace around the {motion}, using the closing bracket doesn't.

ds<char> -- deletes the surrounding characters

cs<char1><char2> -- replaces surrounding character1 with character2

cst<char> -- replace surrounding tag with character

dst -- delete surrounding tag

## vim-tmux

<C-j> -- go to window below

<C-k> -- go to window above

<C-h> -- go to window on the left

<C-l> -- go to window on the right

## comments

gcc -- comment current line

gc{motion} -- comment motion -- repeat command to undo

## nvim-tree

<leader>e -- toggle file explorer

## telescope fuzzy finder

<leader>ff -- open search mask for files within pwd

<leader>fs -- open search mask for strings within pwd

<leader>fc -- search for string under cursor within pwd

<leader>fb -- list buffers

<leader>fh -- list help tags

## harpoon file navigator

<leader>h -- open harpoon window

<leader>a -- add current file to harpoon

<leader>[n] -- switch to [n]th file in harpoon

## autocomplete

<C-j> -- go down to next suggestion

<C-k> -- go up to previous suggestion

## buffers

:bd -- delete current buffer

## lspsaga

gf -- show definition, references

gD -- got to declaration

gd -- see definition and make edits in window

gi -- to implementation

<leader>ca -- see available code operations

<leader>rn -- smart rename

<leader>D -- show  diagnostics for line

<leader>d -- show diagnostics for cursor

[d -- jump to previous diagnostic in buffer

]d -- jump to next diagnostic in buffer

Ks -- show documentation for what is under cursor

# tmux bindings

<C-Space> -- prefix for tmux commands

<C-r> -- search command history backwards

<C-s> -- serach command history forwards

<prefix>- -- split pane horizontally

<prefix>| -- split pane vertically

<prefix>hjkl -- resize panes

<C-hjkl> -- move between panes

<prefix>m -- toggle maximize pane

<prefix>c -- create new tmux window

<prefix>[n] -- switch to window number [n]

<prefix>n -- switch to next window

<prefix>w -- show all windows

<prefix>s -- show all sessions

<prefix>, -- rename tmux window

<prefix>[ -- enter 'copy' mode

    kl -- move cursor up or down in copy mode

    v{motion} -- select {motion} in copy mode

    y -- copy selected text in copy mode

    <C-c> -- exit copy mode

# obsidian vim bindings

s" -- surround with double quotation marks

s' -- surround with single quotation marks

sb -- surround with brackets

ss -- surround with square brackets

sc -- surround with curly brackets

sq -- surround with double guillemets

sg -- surround with single guillemets

<Cmd-^> -- enter new footnote

<C-H> -- toggle left sidebar

<C-L> -- toggle right sidebar
