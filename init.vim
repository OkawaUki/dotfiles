
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/root/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/root/.cache/dein')
  call dein#begin('/root/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/root/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
  
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
"if dein#check_install()
"  call dein#install()
"endif

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
