set nocompatible

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
