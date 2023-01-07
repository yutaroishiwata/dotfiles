call plug#begin('~/.vim/plugged')
 Plug 'vim-denops/denops.vim'
 Plug 'Shougo/ddc.vim'
 Plug 'Shougo/ddc-nvim-lsp'
 Plug 'Shougo/ddu.vim'
 Plug 'Shougo/ddu-ui-filer'
 Plug 'Shougo/ddu-source-file'
 Plug 'Shougo/ddu-kind-file'
 Plug 'Shougo/ddu-column-filename'

 Plug 'Shougo/vimproc.vim', {'build' : 'make'}
 Plug 'Shougo/unite.vim'
 Plug 'jiangmiao/auto-pairs'
 Plug 'airblade/vim-gitgutter'
 Plug 'vim-airline/vim-airline'
 Plug 'mileszs/ack.vim'
 Plug 'mattn/emmet-vim'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()
 
packadd! matchit 
syntax enable
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
set incsearch
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
nnoremap ss :<c-u>vsplit<Return><C-w>w
" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" terminal
nnoremap tt :<c-u>rightb vert term<cr>

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
" coc
""""""""""""""""""""""""""""""""""""""""
" Use deoplete
let g:coc_node_path = '~/.nodebrew/current/bin/node'

let g:coc_global_extensions = [
      \  'coc-css'
      \, 'coc-eslint'
      \, 'coc-html'
      \, 'coc-json'
      \, 'coc-tailwindcss'
      \, 'coc-tsserver'
      \, 'coc-vetur'
      \, 'coc-emmet'
      \, ]

let g:coc_filetype_map = {
  \ 'erb': 'html',
  \ 'html.erb': 'html',
  \ }

""""""""""""""""""""""""""""""""""""""""
" auto-pairs
""""""""""""""""""""""""""""""""""""""""
" use auto-pairs
let g:AutoPairsFlyMode = 1 
 
""""""""""""""""""""""""""""""""""""""""
" ack
""""""""""""""""""""""""""""""""""""""""
let g:ackprg = 'ag --nogroup --nocolor --column'

""""""""""""""""""""""""""""""""""""""""
"  csscomb
""""""""""""""""""""""""""""""""""""""""
" autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :CSScomb

""""""""""""""""""""""""""""""""""""""""
" deoplete.nvim
""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

let g:fzf_layout = { 'window': 'enew' }



""""""""""""""""""""""""""""""""""""""""
" ddc
""""""""""""""""""""""""""""""""""""""""
call ddu#custom#patch_global({
    \   'ui': 'filer',
    \   'actionOptions': {
    \     'narrow': {
    \       'quit': v:false,
    \     },
    \   },
    \ })

""""""""""""""""""""""""""""""""""""""""
" ddu-ui-filer
""""""""""""""""""""""""""""""""""""""""
call ddu#custom#patch_local('filer', {
\   'ui': 'filer',
\   'sources': [
\     {
\       'name': 'file',
\       'params': {},
\     },
\   ],
\   'sourceOptions': {
\     '_': {
\       'columns': ['filename'],
\     },
\   },
\   'kindOptions': {
\     'file': {
\       'defaultAction': 'open',
\     },
\   },
\   'actionOptions': {
\     'narrow': {
\       'quit': v:false 
\     },
\   },
\   'uiParams': {
\     'filer': {
\       'winWidth': 40,
\       'split': 'vertical',
\       'splitDirection': 'topleft',
\     }
\   },
\ })

autocmd TabEnter,CursorHold,FocusGained <buffer>
    \ call ddu#ui#filer#do_action('checkItems')

autocmd FileType ddu-filer call s:ddu_filer_my_settings()
function! s:ddu_filer_my_settings() abort
  
  nnoremap <buffer><silent><expr> <CR>
    \ ddu#ui#filer#is_tree() ?
    \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow'})<CR>" :
    \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open'})<CR>"

  nnoremap <buffer><silent><expr> l
    \ ddu#ui#filer#is_tree() ?
    \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow'})<CR>" :
    \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open'})<CR>"

  nnoremap <buffer><silent> o
    \ <Cmd>call ddu#ui#filer#do_action('expandItem', {'mode': 'toggle'})<CR>

  nnoremap <buffer><silent> q
    \ <Cmd>call ddu#ui#filer#do_action('quit')<CR>

  nnoremap <buffer><silent> c
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'copy'})<CR>

  nnoremap <buffer><silent> h
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow', 'params': {'path': '..'}})<CR>

  nnoremap <buffer><silent> c
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'copy'})<CR>

  nnoremap <buffer><silent> p
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'paste'})<CR>

  nnoremap <buffer><silent> d
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'delete'})<CR>

  nnoremap <buffer><silent> r
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'rename'})<CR>

  nnoremap <buffer><silent> mv
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'move'})<CR>

  nnoremap <buffer><silent> t
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newFile'})<CR>

  nnoremap <buffer><silent> mk
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newDirectory'})<CR>

  nnoremap <buffer><silent> yy
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'yank'})<CR>
endfunction

nmap <silent> sd <Cmd>call ddu#start({
\   'name': 'filer',
\   'uiParams': {'filer': {'search': expand('%:p')}},
\ })<CR>
nmap <silent> sf <Cmd>call ddu#start({
\   'name': 'filer',
\ })<CR>
