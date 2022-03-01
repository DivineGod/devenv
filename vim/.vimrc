" This is dg's .vimrc file
" vim:set ts=2 sts=2 sw=2 expandtab:

" Load plug
call plug#begin('~/.vim/bundle')

Plug 'junegunn/goyo.vim'
Plug 'ap/vim-css-color', { 'for': ['javascript', 'css', 'html'] }
Plug 'airblade/vim-rooter'
Plug 'srstevenson/vim-picker'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " :CocInstall coc-tsserver coc-json coc-eslint coc-prettier
" Plug 'dense-analysis/ale'

" Color Scheme Plugins
" Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
" Plug 'jeffkreeftmeijer/vim-dim'
" Plug 'lifepillar/vim-solarized8'

" Doesn't quite work right with termguicolors so that section needs to be disabled if you want the OG.
" Plug 'altercation/vim-colors-solarized'

call plug#end()

" let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
" let g:ale_linters = {'rust': ['rustc', 'analyzer']}
" let g:ale_fixers = {'rust': ['rustfmt']}
" let g:ale_fixer_on_save = 1

let g:goyo_width = 120

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
set cmdheight=2
set switchbuf=useopen
set showtabline=2
set winwidth=79
set shell=fish

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Show line numbers
set relativenumber
set number

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
" set t_ti= t_te=

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

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" display incomplete commands
set showcmd

" Enabled syntax highlighting
syntax on

" Enable file type detection
filetype plugin indent on

"http://stackoverflow.com/questions/526858/
" set emacs-style tab completing when selecting files, etc
"Make vim do normal bash like tab completion for file names
"set wildmode=longest,list,full
set wildmode=longest,list,full
set wildmenu
let mapleader=","
" Fix slow O inserts
:set timeout timeoutlen=1000 ttimeoutlen=100
" Normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1
" Modelines (comments that set vim options on a per-file basis)
set modeline
set modelines=3
" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable
" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces
" If a file is changed outside of vim, automatically reload it without asking
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

augroup vimrcEX
  "Clear all autocmds in the group
  autocmd!
  autocmd Filetype text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " Leave the return key alone when in command line " windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()

  " *.md is markdown
  autocmd! BufNewFile,BufRead *.md setlocal ft=
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOURS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
  let g:solarized_termtrans=0
endif

set background=dark
colorscheme gruvbox-material

highlight Comment cterm=italic

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
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-.> to trigger completion.
inoremap <silent><expr> <c-.> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Keep selection after changing indent (using > and <)
vmap > >gv
vmap < <gv

" Natural up/down on wraped lines
nnoremap j gj
nnoremap k gk

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

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
" nnoremap <leader>f :call selecta#SelectaFile(".")<cr>
" Fuzzy select from git repo excluding .gitignore'd items
" nnoremap <leader>g :call selecta#SelectaGitRepo(".")<cr>
" Fuzzy select a buffer. Open the selected buffer with :b.
" nnoremap <leader>b :call selecta#SelectaBuffer()<cr>

nmap <leader>f :call picker#File('find . -type f', 'edit')<CR>
nmap <leader>g <Plug>(PickerEdit)
nmap <leader>b <Plug>(PickerBuffer)

"80-character guide line
" set colorcolumn=80

" http://stackoverflow.com/questions/9850360/what-is-netrwhist
let g:netrw_dirhistmax = 0

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

autocmd! BufNewFile,BufRead *.vert,*.tesc,*.tese,*.glsl,*.geom,*.frag,*.comp set filetype=glsl

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
