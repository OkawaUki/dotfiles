if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" 指定した文字を基準に列を整頓してくれる
NeoBundle 'Align'

" ファイルツリーの表示
NeoBundle 'scrooloose/nerdtree'

" Gitを使うプラグイン
NeoBundle 'tpope/vim-fugitive'

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

let g:Align_xstrlen = 3
set ambiwidth=double
set paste
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
set backupdir=~/.vim/tmp
set tw=0
syntax on
colorscheme desert
