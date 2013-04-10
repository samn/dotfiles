"help from http://www.vi-improved.org/vimrc.php, http://github.com/dakrone/dakrone-dotfiles/blob/master/.vimrc
call pathogen#runtime_append_all_bundles() " init pathogen
filetype off
syntax on
filetype plugin indent on " filetype based indents
set modelines=0                  " no modelines [http://www.guninski.com/vim1.html]
let g:secure_modelines_verbose=0 " securemodelines vimscript
let g:secure_modelines_modelines = 15 " 15 available modelines
let g:LustyExplorerSuppressRubyWarning = 1
set background=dark
colorscheme solarized
colors darkblue
set nocompatible " explicitly get out of vi-compatible mode
set noexrc " don't use local version of .(g)vimrc, .exrc
set backup " make backup files
" ending with the double slash includes the full path in the filename
" of the swap files to avoid conflicts
set backupdir=~/.vim/backup//
set directory=~/.vim/tmp// " directory to place swap files in

"general{
"when joining lines, leave cursor where it is
set autoindent
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
set noesckeys
"set nohidden  " close the buffer when I close a tab (I use tabs more than buffers)
set noautowrite "don't automagically write on :next
set matchpairs+=<:>" add < and > to match pairs
runtime macros/matchit.vim
" Disable ALL bells
set noerrorbells
set visualbell t_vb=  
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
"sick of hitting K by accident
map K <nop>

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

" write current file with root privileges
cmap w!! w !sudo tee % > /dev/null
"}

" make [d work for local definitions in Python files
au FileType python setlocal define=^\s*\\(def\\\\/class\\)

" Eclim stuff
" let g:EclimJavaImportPackageSeparationLevel = 2
" let g:EclimXmlValidate = 0
" function JavaImports()
"     :JavaImportMissing
"     :JavaImportClean
"     :JavaImportSort
" endfunction
" nnoremap <C-i> <esc>:call JavaImports()<cr>

" Supertab settings
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-u>"
let g:SuperTabContextTextOmniPrecedence = ['&completefunc', '&omnifunc']

" Settings for VimClojure
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#FuzzyIndent=1
let vimclojure#WantNailgun=1
let vimclojure#SplitPos="bottom"
let vimclojure#SplitSize=10
let g:paredit_mode=0
au Bufenter,Bufnewfile *.clj setl shiftwidth=2 softtabstop=2 syntax=clojure

" Two spaces for coffeescript please
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
au BufNewFile,BufReadPost,Bufenter *.rb setl shiftwidth=2 softtabstop=2 expandtab tabstop=2
