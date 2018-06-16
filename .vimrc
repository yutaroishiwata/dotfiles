if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
 call dein#begin('~/.vim/dein')
 call dein#add('~/.vim/dein')
 call dein#add('Shougo/unite.vim')
 call dein#add('Shougo/deoplete.nvim')
 call dein#add('mattn/emmet-vim')
 call dein#add('scrooloose/nerdtree')
 " markdown
 call dein#add('plasticboy/vim-markdown')
 call dein#add('kannokanno/previm')
 call dein#add('tyru/open-browser.vim')
 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#end()
 call dein#save_state()
endif

" alias
:command Tr NERDTree
:command Po PrevimOpen


filetype plugin indent on
syntax enable
