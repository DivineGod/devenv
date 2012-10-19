set nocompatible
filetype off

" Automatically source this file if changed.
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

set encoding=utf-8
set visualbell

" make sure tabs are banned
set softtabstop=4
set shiftwidth=4
set tabstop=4
set shiftround
set expandtab
set smarttab

" Vundle bundle handler
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Bundles:
Bundle 'minibufexpl.vim'
Bundle 'The-NERD-tree'

filetype plugin indent on     " required!
" =====

map <F9> ::NERDTreeToggle<CR>

let g:miniBufExplMapCTabSwitchBufs=1
