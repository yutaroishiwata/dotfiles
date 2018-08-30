"dein Scripts-----------------------------
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

 " Syntax
 call dein#add('jiangmiao/simple-javascript-indenter')
 call dein#add('jelera/vim-javascript-syntax')
 call dein#add('kchmck/vim-coffee-script')
 call dein#add('tpope/vim-haml')
 call dein#add('groenewege/vim-less')
 call dein#add('wavded/vim-stylus')
 call dein#add('digitaltoad/vim-jade')
 call dein#add('leafgarland/typescript-vim')
 call dein#add('nikvdp/ejs-syntax')
 call dein#add('posva/vim-vue')

 call dein#end()
 call dein#save_state()
endif

"End dein Scripts-------------------------

" language
set encoding=utf-8
scriptencoding utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

" Appearance
colorscheme iceberg
set background=dark
set list
set listchars=eol:¬,tab:▸\
set number
set numberwidth=5

" alias
:command Tr NERDTree
:command Po PrevimOpen

" NERDTree seting
autocmd VimEnter * execute 'NERDTree'


filetype plugin indent on
syntax enable
