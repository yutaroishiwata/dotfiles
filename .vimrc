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
 call dein#add('scrooloose/nerdtree')
 call dein#add('ctrlpvim/ctrlp.vim')
 call dein#add('rking/ag.vim')
 call dein#add('editorconfig/editorconfig-vim')
 call dein#add('csscomb/vim-csscomb')
 call dein#add('tpope/vim-fugitive')
 call dein#add('airblade/vim-gitgutter')
 call dein#add('cocopon/cholorswatch.vim')
 call dein#add('cocopon/shadeline.vim')
 "call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
 "call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
 " call dein#add('mattn/emmet-vim')
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
 call dein#add('Yggdroot/indentLine')

 call dein#end()
 call dein#save_state()
endif

"End dein Scripts-------------------------------------------------------------

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
set nosmartindent
set shiftround
set shiftwidth=2
set tabstop=2

" misc
set guioptions-=t
set guioptions-=l
set guioptions-=r
set guioptions-=l
set guioptions-=m

" clipboard
set clipboard+=unnamed


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
" vnoremap <silent> <c-p> "0p<cr>
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
" split window
nnoremap ss :<c-u>split<Return><C-w>w
nnoremap sv :<c-u>vsplit<Return><C-w>w


" plugins---------------------------------------------------------------------

""""""""""""""""""""""""""""""""""""""""
" fzf
""""""""""""""""""""""""""""""""""""""""
"nnoremap ; :<c-u>buffers<cr>
"nnoremap t :<c-u>files<cr>
"nnoremap r :<c-u>tags<cr>


""""""""""""""""""""""""""""""""""""""""
" ag (the silver searcher)
""""""""""""""""""""""""""""""""""""""""
if executable('ag')
  " use ag for unite grep
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
  " Use ag for ctrlp
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g ""'
endif


""""""""""""""""""""""""""""""""""""""""
" ripgrep
""""""""""""""""""""""""""""""""""""""""
"if executable('rg')
"    set grepprg=rg\ --vimgrep\ --no-heading
"    set grepformat=%f:%l:%c:%m,%f:%l:%m
"endif


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
" neocomplete・neosnippet
""""""""""""""""""""""""""""""""""""""""
" Enable neocomplete when starting Vim
let g:neocomplete#enable_at_startup = 1
" Activate smartcase
let g:neocomplete#enable_smart_case = 1
" Enable completion for three or more words
let g:neocomplete#min_keyword_length = 3
" Complement to the delimiter
let g:neocomplete#enable_auto_delimiter = 1
" Show completed completion from first character input
let g:neocomplete#auto_completion_start_length = 1
" Close complementary popup in backspace
noremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

" Confirm completion candidate with enter key.Enpression of snippet also confirmed with enter key
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
" Tab key to select completion candidate. Jump in snippet also jump with tab key
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"

""""""""""""""""""""""""""""""""""""""""
"  csscomb
""""""""""""""""""""""""""""""""""""""""
" autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :CSScomb

""""""""""""""""""""""""""""""""""""""""
" ctrlpvim 
""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
" fugitiv
""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
" gitgutter
""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
" shadep/ine 
""""""""""""""""""""""""""""""""""""""""
let g:shadeline = {}
let g:shadeline.active = {
      \   'left': ['fname', 'flags', 'ShadelineItemGitBranch',],
      \   'right': ['<', ['ff', 'fenc', 'ft'],'ruler',],
      \ }
let g:shadeline.inactive = {
      \   'left': ['fname', 'flags',],
      \ }

function! ShadelineItemGitBranch()
  let name = exists('*fugitive#head')
        \ ? fugitive#head()
        \ : ''
  return empty(name) ? '' : printf('(%s)', name)
endfunction


""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * execute 'NERDTree'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


filetype plugin indent on
syntax enable
