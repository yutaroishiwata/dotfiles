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
 call dein#add('Shougo/neomru.vim')
 call dein#add('Shougo/deoplete.nvim')
 call dein#add('mattn/emmet-vim')
 call dein#add('scrooloose/nerdtree')
 call dein#add('ctrlpvim/ctrlp.vim')
 call dein#add('editorconfig/editorconfig-vim')
 call dein#add('cocopon/colorswatch.vim')
 call dein#add('cocopon/shadeline.vim')
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
 call dein#add('leafgarland/typescript-vi')
 call dein#add('nikvdp/ejs-syntax')
 call dein#add('posva/vim-vue')

 call dein#end()
 call dein#save_state()
endif

"End dein Scripts-------------------------

" language & encoding
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
set helplang=ja
set formatexpr=Format_Japanese()

" Appearance
colorscheme iceberg
set background=dark
set cursorline
set laststatus=2
set linespace=4
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set number
set numberwidth=5

" Backup
set nobackup
set noswapfile
set noundofile

" Indent
set autoindent
if exists('&breakindent')
	set breakindent
endif
set noexpandtab
set nosmartindent
set shiftround
set shiftwidth=2
set tabstop=2

" Misc
set guioptions-=T
set guioptions-=L
set guioptions-=R
set guioptions-=l
set guioptions-=m

" Keymaping
" nnoremap ; :
" nnoremap : ;
" vnoremap ; :
" vnoremap : ;
noremap j gj
noremap k gk
noremap <S-h> ^
noremap <S-j> }
noremap <S-k> {
noremap <S-l> $
nnoremap <CR> A<CR><ESC>
nnoremap <Space>n :<C-u>NERDTree<CR>
nnoremap <Space>p :<C-u>PrevimOpen<CR>
" Switch active window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"prefix key
nmap <Space> [unite]
" dein
nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>

" Clipboard
set clipboard+=unnamed

" NERDTree
autocmd VimEnter * execute 'NERDTree'

filetype plugin indent on
syntax enable
