" Load plug
call plug#begin('~/.vim/bundle')

Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'morhetz/gruvbox'

call plug#end()

" Load plugins
filetype plugin indent on
"
" This is dg's .vimrc file
" vim:set ts=2 sts=2 sw=2 expandtab:

autocmd!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
" When switching buffers, hide them (instead of abandoning)
set hidden
" remember more commands and history
set history=10000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
" set copyindent
set smartindent
set laststatus=2
set showmatch
set incsearch
set hlsearch

" Case-insensitive searching; case-sensitive if they contains capital letter
set ignorecase smartcase
set cursorline
set cmdheight=1
set switchbuf=useopen
set showtabline=2
set winwidth=79
set shell=fish

" Show line numbers
set relativenumber
set number

" Keep more context when scrolling off the end of a buffer
set scrolloff=3

" Don't use swp files
set nobackup
set nowritebackup
set noswapfile
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp

" Permanent undo
set undodir=~/.vimdid
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOURS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let &t_ut='' " Background Colour Erase (bce) is not supported in some terminals
set termguicolors

set background=dark " or: set background=light
let g:gruvbox_italic=1
colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <cr> :nohlsearch<cr>
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

inoremap <c-H> <c-k><-
inoremap <c-K> <c-k>-!

map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>

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

" Save file and run previous terminal command
map <space> :w<Enter>:!!<Enter>

let g:rustfmt_autosave = 1

" Do not move cursor on *
map * *N

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

" Keep selection after changing indent (using > and <)
vmap > >gv
vmap < <gv

" Natural up/down on wraped lines
nnoremap j gj
nnoremap k gk


au FileType yaml setl sw=1 sts=1 et
au FileType python setl sw=4 sts=4 et
au FileType scala setl sw=2 sts=2 et
au FileType ruby setl sw=2 sts=2 et
au FileType coffee setl sw=2 sts=2 et
au FileType sass,scss,erb,html setl sw=4 sts=4 et
au FileType javascript setl sw=4 sts=4 et
au Filetype cpp setl sw=2 sts=2 et
autocmd BufRead,BufNewFile *.erb set sw=2 sts=2 et
autocmd BufRead,BufNewFile *.ml set sw=2 sts=2 et


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

" This will not preserve the cursor position
" autocmd BufWritePre <buffer> :%s/\s\+$//e

"80-character guide line
" set colorcolumn=80

" Auto source .vimrc on save
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost init.vim source %

" Create non-existing dir on save
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

hi Search cterm=underline
hi IncSearch cterm=underline

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

" Enabled syntax highlighting
syntax on

" Enable file type detection
filetype plugin indent on
