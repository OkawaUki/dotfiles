" Installation guide for this .vimrc

" 1. install neobundle.
" https://github.com/Shougo/neobundle.vim

" 2. set the $GOPATH and add $GOPATH/bin to $PATH in .bashrc 
" https://golang.org/doc/code.html#GOPATH

" 2. install vim-go
" https://github.com/fatih/vim-go

" 3. execute :GoInstallBinaries to install package that is required vim-go
" https://github.com/fatih/vim-go

" 4. execute follow command for tern-project(javascript completion)
" `cd ~/.vim/bundle/tern_for_vim`
" `npm install`

" 5. create symboliclink in home directory
" `ln -s dotfiles/.vimrc .vimrc`
" `ln -s dotfiles/.tern-project .tern-project`

" start configuration for NeoBundle------------------

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" use neocomplete when if_lua is enable
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'

" install js syntax highlighter
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

" install plugin for golang
NeoBundle 'fatih/vim-go'

" install badwolf
NeoBundle 'w0ng/vim-hybrid'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" end configuration for NeoBundle--------------------



if neobundle#is_installed('neocomplete')
    " neocomplete用設定
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
elseif neobundle#is_installed('neocomplcache')
    " neocomplcache用設定
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_ignore_case = 1
    let g:neocomplcache_enable_smart_case = 1
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"


" display the line number
set number

" input indent automatically when new line
set autoindent

" shift indent for command mode
nnoremap <S-Tab> <<
" shift indent for insert mode
inoremap <S-Tab> <C-d>

" default indent settings (space tab, width=4)
set expandtab
set tabstop=4
set shiftwidth=4

" indent setting for .go extension file (hard tab, width=4)
" this setting unuse when vim-go is enabled
"au BufNewFile,BufRead *.go set noexpandtab tabstop=4 shiftwidth=4

" indent setting for .js extension file (space tab, width=2)
au BufNewFile,BufRead *.js set expandtab tabstop=2 shiftwidth=2

" indent setting for .md extension file (space tab, width=1)
au BufNewFile,BufRead *.md set expandtab tabstop=1 shiftwidth=1

" display the status line
" http://www.ksknet.net/vi/statusline.html
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set cmdheight=2
set laststatus=2

" disable preview window of the completion
set completeopt-=preview

" settings for color scheme
set background=dark
colorscheme hybrid
