call plug#begin('~/.vim/plugged')
 Plug 'Shougo/vimproc.vim', {'build' : 'make'}
 Plug 'Shougo/unite.vim'
 Plug 'Shougo/neomru.vim'
 Plug 'Shougo/deoplete.nvim'
 Plug 'Shougo/neocomplete.vim'
 Plug 'Shougo/neosnippet'
 Plug 'Shougo/neosnippet-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'ctrlpvim/ctrlp.vim'
 Plug 'rking/ag.vim'
 Plug 'editorconfig/editorconfig-vim'
 Plug 'csscomb/vim-csscomb'
 Plug 'tpope/vim-fugitive'
 Plug 'airblade/vim-gitgutter'
 Plug 'vim-airline/vim-airline'
 "Plug 'cocopon/shadeline.vim'
 "Plug 'junegunn/fzf', { 'build': './install --all', 'merged': 0 }
 "Plug 'junegunn/fzf.vim', { 'depends': 'fzf' }
 " Plug 'mattn/emmet-vim'
 " markdown
 Plug 'plasticboy/vim-markdown'
 Plug 'kannokanno/previm'
 Plug 'tyru/open-browser.vim'
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
" Airline
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""
" autocmd VimEnter * execute 'NERDTree'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


filetype plugin indent on
syntax enable
