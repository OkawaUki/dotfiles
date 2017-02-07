" configuration of neovim
" you need to copy this file to ~/.config/nvim/init.vim
" this configuration file is required dein.vim and golang

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

let s:dein_dir = expand('~/.cache/dein')

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  " Required:
  call dein#add(s:dein_dir . '/repos/github.com/Shougo/dein.vim')

  " Plugin for golang
  call dein#add('fatih/vim-go')

  " autocomplete
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-go', {'build': 'make'})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

set number

" Enable deoplete when start up neovim
let g:deoplete#enable_at_startup = 1

" config for deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" scroll completion list with tab
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" settings for golang file
au BufNewFile,BufRead *.go set tabstop=4 shiftwidth=4
