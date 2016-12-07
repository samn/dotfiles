let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" change cursor to | in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

filetype plugin indent on

" Autoreload vimrc
autocmd! bufwritepost .vimrc source %
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" let mapleader = ","

call plug#begin('~/.vim/plugged')

Plug 'ervandew/supertab'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree' ", { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ap/vim-css-color'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'
Plug 'guns/vim-clojure-static', { 'for': ['clojure'] }
Plug 'kchmck/vim-coffee-script'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim'
Plug 'plasticboy/vim-markdown'
" splitjoin:
" gS to split a one-liner into multiple lines
" gJ (with the cursor on the first line of a block) to join a block into a single-line statement.
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-endwise'
" Comment lines: gcc to comment current line, or select and then gc
Plug 'tpope/vim-commentary'
" Plug 'flowtype/vim-flow', { 'for': ['javascript', 'jsx'] }
Plug 'machakann/vim-highlightedyank'

" Add plugins to &runtimepath
call plug#end()

"syntax enable
"syntax on
" colors darkblue
" colorscheme gruvbox
colorscheme solarized
" set background=light


set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
" Disable the mouse so i can copy selections from the terminal using the mouse
set mouse=

set noexrc " don't use local version of .(g)vimrc, .exrc
set backupdir=~/.vim/backup//
set directory=~/.vim/tmp// " directory to place swap files in
set undofile
set undodir=~/.tmp/undodir
set undolevels=1000
set undoreload=10000

set iskeyword+=_,$,@,%,# " none of these are word dividers
" ignore these list file extensions
set wildignore=*.o,*.obj,*.bak,*.pyc,
    \*.jpg,*.gif,*.png,*.class,*.d
set wildmode=list:longest " turn on wild mode huge list
" Keep cycled-away buffers open (preserving undo,
" allowing buffer switch without write)
set hidden
set esckeys " Cursor keys in insert mode.
set noautowrite "don't automagically write on :next
set matchpairs+=<:>" add < and > to match pairs
set showmatch " matching braces
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
" Disable ALL bells
set noerrorbells
set visualbell t_vb=
" STRIP TRAILING WHITESPACE ON SAVE
autocmd BufWritePre * :%s/\s\+$//e

set list " we do want to show tabs, to ensure we get them out of files
set listchars=tab:>-,trail:- " show tabs and trailing
set nostartofline " leave my cursor where it was with motion cmds
set ruler
set nofoldenable
" set number
" relative line numbers
set rnu
set shortmess=aOstT " shortens messages to avoid 'press a key' prompt
set showcmd " show the command being typed
set ignorecase " case insensitive by default
set infercase " case inferred by default
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set smartcase " if there are caps, go case-sensitive
set hlsearch  "highlight all matched phrases, nohlsearch for inverse
set inccommand=nosplit "incremental "live" substitute

" rainbow_parentheses.vim
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" vim-go golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
au BufNewFile,BufReadPost,Bufenter *.go setlocal nolist noet ts=4 sw=4 sts=4

" enable jsx syntax in non .jsx files
let g:jsx_ext_required = 0

"vim-highlightedyank
let g:highlightedyank_highlight_duration = 250

"quicker window navigation:
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"focus on cmd input when in command mode
nnoremap <Space> :
map! <C-A> <Home>
map! <C-E> <End>
nmap <C-A> <Home>
nmap <C-E> <End>
nmap <C-M> gt
nmap <C-N> gT
nmap <C-\> <esc>:noh<cr>
noremap <Leader>a :Ag <cword><cr>
map <up> <ESC>:NERDTreeToggle<RETURN>
map <right> <ESC>:bn<RETURN>
map <left> <ESC>:bp<RETURN>
"sick of hitting K by accident
map K <nop>

noremap <Leader>[ :set nopaste<cr>
noremap <Leader>] :set paste<cr>

noremap <Leader>r :NERDTreeFind<RETURN>

"enable fzf
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
set rtp+=~/.fzf
map <C-p> :FZF<cr>

" Open NERDTree on startup if no files are specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" highlight partial matches in fzf results
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

