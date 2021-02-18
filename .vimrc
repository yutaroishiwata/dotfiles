call plug#begin('~/.vim/plugged')
 Plug 'Shougo/vimproc.vim', {'build' : 'make'}
 Plug 'Shougo/unite.vim'
 Plug 'scrooloose/nerdtree'
 Plug 'jiangmiao/auto-pairs'
 Plug 'airblade/vim-gitgutter'
 Plug 'vim-airline/vim-airline'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 " Plug 'editorconfig/editorconfig-vim'
 " Plug 'csscomb/vim-csscomb'
 if !has('nvim')
   Plug 'roxma/nvim-yarp'
   Plug 'roxma/vim-hug-neovim-rpc'
 endif

 " Syntax
 Plug 'jiangmiao/simple-javascript-indenter'
 Plug 'jelera/vim-javascript-syntax'
 Plug 'kchmck/vim-coffee-script'
 Plug 'tpope/vim-haml'
 Plug 'groenewege/vim-less'
 Plug 'wavded/vim-stylus'
 Plug 'digitaltoad/vim-jade'
 Plug 'nikvdp/ejs-syntax'
 Plug 'posva/vim-vue'
 Plug 'Yggdroot/indentLine'
call plug#end()

" language & encoding
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileformats=unix,mac
set helplang=ja
set formatexpr=Format_Japanese()

set list
set listchars=eol:¬
set number
set numberwidth=3
set showcmd
set showmatch
set wrap
set modifiable
set write
set hlsearch
set updatetime=100
set ignorecase
" json double quote display
set conceallevel=0
let g:vim_json_syntax_conceal = 0

" backup
set hidden
set nobackup
set noswapfile
set noundofile

" indent
set autoindent
if exists('&breakindent')
  set breakindent
endif
set expandtab
set tabstop=2
set nosmartindent
set shiftround
set shiftwidth=2

" misc
set guioptions-=t
set guioptions-=l
set guioptions-=r
set guioptions-=l
set guioptions-=m

" clipboard
set clipboard+=unnamed

" grep
autocmd QuickFixCmdPost *grep* cwindow

" keymaping-------------------------------------------------------------------
if has('mac')
  nnoremap ; :
  nnoremap : ;
  vnoremap ; :
  vnoremap : ;
endif
noremap j gj
noremap k gk
noremap tg g<s-t>
noremap <s-h> ^
noremap <s-j> }
noremap <s-k> {
noremap <s-l> $
nnoremap <cr> a<cr><esc>
nnoremap <space>n :<c-u>NERDTree<cr>
nnoremap <space>p :<c-u>previmopen<cr>
" switch active window
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" window size
nnoremap + 4<c-w>+
nnoremap - 4<c-w>-
nnoremap { 4<c-w><
nnoremap } 4<c-w>>
" split pane
nnoremap ss :<c-u>split<Return><C-w>w
nnoremap sv :<c-u>vsplit<Return><C-w>w

" Plugins---------------------------------------------------------------------

""""""""""""""""""""""""""""""""""""""""
" Unite.vim
""""""""""""""""""""""""""""""""""""""""
" start insert mode
let g:unite_enable_start_insert = 1

" prefix key
nmap <Space> [unite]
" keymaping
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]r :<C-u>Unite<Space>file_mru<CR>

" Not case sensitive
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" Grep from the current directory
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" Grep from word at cursor position
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" Grep search results recall"
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

""""""""""""""""""""""""""""""""""""""""
" neosnippet
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" coc
""""""""""""""""""""""""""""""""""""""""
" Use deoplete
let g:coc_node_path = '~/.nodebrew/current/bin/node'

""""""""""""""""""""""""""""""""""""""""
" auto-pairs
""""""""""""""""""""""""""""""""""""""""
" use auto-pairs
let g:AutoPairsFlyMode = 1 
 
""""""""""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='onehalflight'

""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""
" autocmd VimEnter * execute 'NERDTree'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1

filetype plugin indent on
syntax enable

""""""""""""""""""""""""""""""""""""""""
"  csscomb
""""""""""""""""""""""""""""""""""""""""
" autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :CSScomb
