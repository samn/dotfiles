"help from http://www.vi-improved.org/vimrc.php
set nocompatible " explicitly get out of vi-compatible mode
set noexrc " don't use local version of .(g)vimrc, .exrc
colors darkblue
set backup " make backup files
set backupdir=~/.vim/backup
set directory=~/.vim/tmp " directory to place swap files in
syntax on

"general{
"when joining lines, leave cursor where it is
set autoindent
let c_comment_strings=1
set cpoptions=q 
set cinwords=if,else,while,do,for,switch,case
set cindent
set backspace=indent,eol,start " make backspace a more flexible
set iskeyword+=_,$,@,%,# " none of these are word dividers 
" ignore these list file extensions
set wildignore=*.o,*.obj,*.bak,*.pyc,
    \*.jpg,*.gif,*.png,*.class,*.d
set wildmode=list:longest " turn on wild mode huge list
" Keep cycled-away buffers open (preserving undo, 
" allowing buffer switch without write)
set hidden
" Speed up response to ESC key
set notimeout
set ttimeout
set timeoutlen=100
"} 
"ui{
"set cursorline " highlight current line
"set cursorcolumn " highlight the current column
set incsearch "highlight as you type search phrase
set hlsearch  "highlight all matched phrases, nohlsearch for inverse
"set laststatus=2 " always show the status line
"set lazyredraw " do not redraw while running macros
"set list " we do what to show tabs, to ensure we get them out of files
"set listchars=tab:>-,trail:- " show tabs and trailing 
set nostartofline " leave my cursor where it was with motion cmds
set novisualbell " don't blink
set number "line numbers
set numberwidth=3
hi LineNr ctermfg=white ctermbg=darkgreen
set ruler " Always show current positions along the bottom
set shortmess=aOstT " shortens messages to avoid 'press a key' prompt
set showcmd " show the command being typed 
set showmatch "matching braces
"}

"text formatting/layout {
set formatoptions=tcqrq "see help fo-table
"set fo+=n "for formatting lists
set ignorecase " case insensitive by default
set infercase " case inferred by default
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set smartcase " if there are caps, go case-sensitive
set shiftwidth=4
set softtabstop=4 
set expandtab
"}

"keybindings {
"focus on cmd input when in command mode
nnoremap <Space> : 
" Bash-style keybindings
map! <C-A> <Home>
map! <C-E> <End>
nmap <C-A> <Home>
nmap <C-E> <End>
nmap <C-M> gt
nmap <C-N> gT
nmap <C-\> <esc>:noh<cr>
map <up> <ESC>:NERDTreeToggle<RETURN>
"map <right> <ESC>:Tlist<RETURN>"for tag list
map <right> <ESC>:bn<RETURN>
map <left> <ESC>:bp<RETURN>

"bindings for controlling pastemode
"<F2> to start, <F3> to cancel.  works in insert mode as well.
map <F2> :set paste<cr> :startinsert<cr>
imap <F2> <Esc> :set paste<cr> :startinsert<cr>
map <F3> :set nopaste<cr>
imap <F3> <nop>
set pastetoggle=<F3>

"quicker window navigation:
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"Reformat hex-dumps into 32-bit words, 8 words per line.
"nmap H :s/\v(\S{8})/\1 /g<CR>:s/\v((\S{8} ){8})/\1<C-V><CR>/g<CR>:nohl<CR>
"map <space> /
"map <c-space> ?
"p4 convenience bindings
nnoremap @p4a :!p4 add %:e
nnoremap @p4e :!p4 edit %:e
nnoremap @p4d :!p4 diff %
"}

