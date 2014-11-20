if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" if_luaが有効ならneocompleteを使う
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'

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

" 指定した文字を基準に列を整頓してくれる
NeoBundle 'Align'

" ファイルツリーの表示
NeoBundle 'scrooloose/nerdtree'

" markdown用の設定
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

let g:vim_markdown_folding_disabled=1

" Gitを使うプラグイン
NeoBundle 'tpope/vim-fugitive'

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

"plasticboy/vim-markdownはfiletypeをmkdにしてしまうらしい
fun! MyAddToFileType(ft)
  if index(split(&ft, '\.'), a:ft) == -1
      let &ft = a:ft
   endif
endfun

"au FileType markdown call MyAddToFileType('mkd')
au FileType mkd      call MyAddToFileType('markdown')

" *.mdファイルもmdファイルとする
augroup PrevimSettings
    autocmd!
        autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END


" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

let g:Align_xstrlen = 3
set ambiwidth=double
set number
set title
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set cmdheight=2
set laststatus=2
set nobackup
set noswapfile
set tw=0
set clipboard=unnamed,autoselect
set backspace=start,eol,indent
set ic
syntax on
colorscheme desert
