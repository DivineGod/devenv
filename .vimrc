" This is dg's .vimrc file
" vim:set ts=2 sts=2 sw=2 expandtab:

autocmd!

execute pathogen#infect()

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
set shell=zsh
" Show line numbers
set number
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
" set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
set scrolloff=3
"Don't use swp files
set nobackup
set nowritebackup
set noswapfile
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
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

      autocmd! BufRead,BufNewFile *.coffee setfiletype coffee

      autocmd! BufRead,BufNewFile *.sass setfiletype sass

      autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
      autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

      " Indent p tags
      " autocmd FileType html,eruby if g:html_indent_tags !~ " '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | " endif

      " Don't syntax highlight markdown because it's often wrong
      autocmd! FileType mkd setlocal syn=off

      " Leave the return key alone when in command line " windows, since it's used
      " to run commands there.
      autocmd! CmdwinEnter * :unmap <cr>
      autocmd! CmdwinLeave * :call MapCR()

      " *.md is markdown
      autocmd! BufNewFile,BufRead *.md setlocal ft=

      " indent slim two spaces, not four
      autocmd! FileType *.slim set sw=2 sts=2 et
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntastic
" let g:syntastic_check_on_open=0
" let g:syntastic_enable_signs=0
" let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": [],
  \ "passive_filetypes": [] }
"map ]l :lnext<Enter>
"map [l :lprev<Enter>
" let g:neomake_javascript_enabled_makers = ['eslint']
autocmd BufWritePost,BufEnter * Neomake


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOURS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set t_Co=256
set termguicolors
" set background=dark "or light
let g:solarized_term_italics=1
colorscheme solarized8_dark_high
" let g:solarized_termtrans=1

let &t_8f="\e[38;2;%ld;%ld;%ldm"
let &t_8b="\e[48;2;%ld;%ld;%ldm"
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
"map \ :w<Enter>:!!<Enter>
"map \\ :w<Enter>:!!<Enter>
map <space> :w<Enter>:!!<Enter>

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

" This will not preserve the cursor position
" autocmd BufWritePre <buffer> :%s/\s\+$//e

"80-character guide line
" set colorcolumn=80

" SELECTA

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
" Needs selecta (brew install selecta)
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

function! SelectaFile(path)
  call SelectaCommand("find " . a:path . "/* -type f", "", ":e")
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaFile(".")<cr>
nnoremap <leader>ga :call SelectaFile("apps")<cr>

function! SelectaBuffer()
  let bufnrs = filter(range(1, bufnr("$")), 'buflisted(v:val)')
  let buffers = map(bufnrs, 'bufname(v:val)')
  call SelectaCommand('echo "' . join(buffers, "\n") . '"', "", ":b")
endfunction

" Fuzzy select a buffer. Open the selected buffer with :b.
nnoremap <leader>b :call SelectaBuffer()<cr>

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

