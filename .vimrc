" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable Pathogen
execute pathogen#infect()

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=0
"map ]l :lnext<Enter>
"map [l :lprev<Enter>


" Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256

syntax on
filetype plugin indent on
colorscheme deuteranomaly
"colorscheme pipe_dream
"colorscheme ir_black
"colorscheme sol
set background=dark "or light


" Show line numbers
set number

" Turn on line wrapping.
set wrap

" Set the terminal's title
set title

" Minimal width of split windows
set winwidth=82

" Set VertSplit separator character to empty space
set fillchars=

" Behavior
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set noswapfile

"Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

nnoremap <cr> :nohlsearch<cr>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

inoremap <c-H> <c-k><-
inoremap <c-K> <c-k>-!

" Move through buffers like OS X tabs
map L :bnext<Enter>
map H :bprevious<Enter>
"map L :next<Enter>
"map H :prev<Enter>
"map <C-l> :bnext<Enter>
"map <C-h> :bprevious<Enter>
"map <C-]> :bnext<Enter>
"map <C-[> :bprevious<Enter>
"noremap ] :bnext<Enter>
"noremap [ :bprevious<Enter>

" When switching buffers, hide them (instead of abandoning)
set hidden

" Save file and run previous terminal command
"map \ :w<Enter>:!!<Enter>
"map \\ :w<Enter>:!!<Enter>
map <space> :w<Enter>:!!<Enter>

" Do not move cursor on *
map * *N

" Allow cursor everywhere (like in Turbo Pascal editor)
set virtualedit=all

" Case-insensitive searching
set ignorecase

" But case-sensitive if expression contains a capital letter
set smartcase

" Keep selection after changing indent (using > and <)
vmap > >gv
vmap < <gv

" Natural up/down on wraped lines
nnoremap j gj
nnoremap k gk

" Yank to system's clipboard
"set clipboard=unnamed
"set clipboard=*

" Highlight matches as you type
set incsearch

" Highlight matches
set hlsearch

" Show 3 lines of context around cursor
"set scrolloff=3
set scrolloff=999
"let &scrolloff=999-&scrolloff

" Make \t look like 8 spaces
set tabstop=8

" Expand tabs to 4 spaces
set softtabstop=4

" How much to move using > and <
set shiftwidth=4

" Expand tabs to spaces
set expandtab


au FileType python setl sw=4 sts=4 et
au FileType scala setl sw=2 sts=2 et
au FileType ruby,sass,scss,erb,html setl sw=2 sts=2 et
autocmd BufRead,BufNewFile *.erb set sw=2 sts=2 et
autocmd BufRead,BufNewFile *.ml set sw=2 sts=2 et
"autocmd BufRead,BufNewFile *.ml set sw=2 sts=2 et

" Don't syntax highlight markdown because it's often wrong
autocmd! FileType mkd setlocal syn=off


" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
"autocmd BufWritePre * :%s/\s\+$//e

"autocmd FileType c,ruby,python
autocmd BufWritePre <buffer> :%s/\s\+$//e

"http://stackoverflow.com/questions/526858/
"Make vim do normal bash like tab completion for file names
"set wildmode=longest,list,full
set wildmode=longest,list
set wildmenu

"80-character guide line
set colorcolumn=80

" SELECTA

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    silent! exec a:vim_command . " " . system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
  endtry
  redraw!
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find * -type f", "", e")<cr>

" Vertical split on startup if terminal is wider than 160 characters.
" function VSplit()
"     if &columns > 160
"         :vsplit
"     endif
" endfunction
" autocmd VimEnter * :call VSplit()

" Markdown
" autocmd! BufNewFile,BufRead *.md setlocal ft=

" http://stackoverflow.com/questions/9850360/what-is-netrwhist
let g:netrw_dirhistmax = 0
