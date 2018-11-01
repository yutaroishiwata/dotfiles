"dein Scripts-----------------------------if &compatible
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
 call dein#begin('~/.vim/dein')
 call dein#add('~/.vim/dein')
 call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
 call dein#add('Shougo/unite.vim')
 call dein#add('Shougo/neomru.vim')
 call dein#add('Shougo/deoplete.nvim')
 call dein#add('Shougo/neocomplete.vim')
 call dein#add('Shougo/neosnippet')
 call dein#add('Shougo/neosnippet-snippets')
 call dein#add('mattn/emmet-vim')
 call dein#add('scrooloose/nerdtree')
 call dein#add('ctrlpvim/ctrlp.vim')
 call dein#add('rking/ag.vim')
 call dein#add('editorconfig/editorconfig-vim')
 call dein#add('tpope/vim-fugitive')
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
scriptencoding utf-8
set fileencoding=utf-8
set fileformats=unix,mac
set helplang=ja
set formatexpr=Format_Japanese()

" Appearance
colorscheme iceberg
set background=dark
set cursorline
set laststatus=2
set linespace=4
set list
set listchars=eol:¬,tab:>/ 
set number
set numberwidth=5
set showcmd
set showmatch
set wrap
set modifiable
set write

" Backup
set hidden
set nobackup
set noswapfile
set noundofile

" Indent
set autoindent
if exists('&breakindent')
  set breakindent
endif
set expandtab
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

" Keymaping-------------------------
if has('mac')
  nnoremap ; :
  nnoremap : ;
  vnoremap ; :
  vnoremap : ;
endif
noremap j gj
noremap k gk
noremap tg g<S-t>
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

""""""""""""""""""""""""""""""""""""""""
" dein.vim
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
" neocomplete・neosnippetの設定
""""""""""""""""""""""""""""""""""""""""
" Vim起動時にneocompleteを有効にする
let g:neocomplete#enable_at_startup = 1
" smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" 3文字以上の単語に対して補完を有効にする
let g:neocomplete#min_keyword_length = 3
" 区切り文字まで補完する
let g:neocomplete#enable_auto_delimiter = 1
" 1文字目の入力から補完のポップアップを表示
let g:neocomplete#auto_completion_start_length = 1
" バックスペースで補完のポップアップを閉じる
inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

" エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定・・・・・・②
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
" タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ・・・・・・③
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"


""""""""""""""""""""""""""""""""""""""""
" fugitiv
""""""""""""""""""""""""""""""""""""""""


" Clipboard
set clipboard+=unnamed

" NERDTree
autocmd VimEnter * execute 'NERDTree'

" ag (The Silver Searcher)
if executable('ag')
  " Use ag for unite grep
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
  " Use ag for ctrlp
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g ""'
endif

filetype plugin indent on
syntax enable
