"" display the line number
set number

"" input indent automatically when new line
set autoindent

" shift indent for command mode
nnoremap <S-Tab> <<
" shift indent for insert mode
inoremap <S-Tab> <C-d>

"" default indent settings (space tab, width=4)
set expandtab
set tabstop=4
set shiftwidth=4

""indent setting for .go extension file (hard tab, width=4)
au BufNewFile,BufRead *.go set noexpandtab tabstop=4 shiftwidth=4

""indent setting for .js extension file (space tab, width=2)
au BufNewFile,BufRead *.js set expandtab tabstop=2 shiftwidth=2

""indent setting for .md extension file (space tab, width=1)
au BufNewFile,BufRead *.md set expandtab tabstop=1 shiftwidth=1

"" display the status line
"" http://www.ksknet.net/vi/statusline.html
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set cmdheight=2
set laststatus=2
