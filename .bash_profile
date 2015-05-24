eval "$(rbenv init -)"
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
PATH=/usr/local/Cellar/vim/7.4.335/bin:/usr/local/git/bin:$PATH
export PATH
alias ls='ls -G'
export LSCOLORS=gxfxcxdxbxegedabagacad
