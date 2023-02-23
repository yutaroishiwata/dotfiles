call plug#begin('~/.vim/plugged')
 Plug 'vim-denops/denops.vim'

 Plug 'Shougo/ddu.vim'
 Plug 'Shougo/ddu-ui-ff'
 Plug 'Shougo/ddu-ui-filer'
 Plug 'Shougo/ddu-source-file_rec'
 Plug 'Shougo/ddu-filter-matcher_substring'
 Plug 'Shougo/ddu-source-file'
 Plug 'Shougo/ddu-kind-file'
 Plug 'Shougo/ddu-column-filename'
 Plug 'shun/ddu-source-rg'
 Plug 'shun/ddu-source-buffer'

 Plug 'Shougo/ddc.vim'
 Plug 'Shougo/ddc-around'
 Plug 'Shougo/ddc-ui-native'
 Plug 'Shougo/ddc-matcher_head'
 Plug 'Shougo/ddc-sorter_rank'
 Plug 'Shougo/ddc-converter_remove_overlap'
 Plug 'shun/ddc-source-vim-lsp'
 Plug 'LumaKernel/ddc-file'
 Plug 'prabirshrestha/vim-lsp'
 Plug 'mattn/vim-lsp-settings'

 Plug 'jiangmiao/auto-pairs'
 Plug 'airblade/vim-gitgutter'
 Plug 'vim-airline/vim-airline'
 Plug 'ntpeters/vim-better-whitespace'
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
set wildignore=*/.,*/node_modules/*,*/dist/*
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
nnoremap sh <c-w>h
nnoremap sj <c-w>j
nnoremap sk <c-w>k
nnoremap sl <c-w>l
" window size
nnoremap + 4<c-w>+
nnoremap - 4<c-w>-
nnoremap { 4<c-w><
nnoremap } 4<c-w>>
" split pane
nnoremap ss :<c-u>vsplit<Return><C-w>w
" Use <Tab> and <S-Tab> to navigate the completion list:
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" terminal
nnoremap tt :<c-u>rightb vert term<cr>
tnoremap <Esc> <c-w>N

" Plugins---------------------------------------------------------------------


""""""""""""""""""""""""""""""""""""""""
" vim-lsp
""""""""""""""""""""""""""""""""""""""""
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


""""""""""""""""""""""""""""""""""""""""
" ddc-source-vim-lsp
""""""""""""""""""""""""""""""""""""""""
call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('sourceParams', #{
      \   around: #{ maxSize: 500 },
      \ })
call ddc#custom#patch_global('sources', ['vim-lsp'])
call ddc#custom#patch_global('sourceOptions', {
    \ 'vim-lsp': {
    \   'matchers': ['matcher_head'],
    \   'mark': 'lsp',
    \ },
    \ })

" if you want to use the unsupported CompleteProvider Server,
" set true by'ignoreCompleteProvider'.
call ddc#custom#patch_filetype(['css'], {
    \ 'sourceParams': {
    \   'vim-lsp': {
    \     'ignoreCompleteProvider': v:true,
    \   },
    \ },
    \ })

" Use ddc.
call ddc#enable()


""""""""""""""""""""""""""""""""""""""""
" ddu-ui-ff
""""""""""""""""""""""""""""""""""""""""
call ddu#custom#patch_global({
\   'ui': 'ff',
\   'sources': [
\     {'name': 'buffer'},
\   ],
\   'sourceOptions': {
\     '_': {
\       'matchers': ['matcher_substring'],
\     },
\   },
\   'kindOptions': {
\     'file': {
\       'defaultAction': 'open',
\     },
\   },
\ })

call ddu#custom#patch_local('buffer', {
\   'ui': 'ff',
\   'sources': [
\     {'name': 'buffer'},
\   ],
\ })

call ddu#custom#patch_local('file_rec', {
\   'ui': 'ff',
\   'sources': [
\     {'name': 'file_rec', 'params': { 'ignoredDirectories': ['.git', 'node_modules', 'vendor', '.next', 'dist']}},
\   ],
\ })

autocmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
  nnoremap <buffer><silent> <CR>
        \ <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
  nnoremap <buffer><silent> <Space>
        \ <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
  nnoremap <buffer><silent> i
        \ <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent> q
        \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  noremap <buffer><silent> <CR>
  \ <Esc><Cmd>close<CR>
  nnoremap <buffer><silent> <CR>
  \ <Cmd>close<CR>
  nnoremap <buffer><silent> q
  \ <Cmd>close<CR>
endfunction

nmap <silent> <Space>b <Cmd>call ddu#start({
\   'name': 'buffer',
\   'uiParams': {
\     'filer': {
\       'splitDirection': 'top',
\       'split': 'horizontal',
\     }
\   },
\ })<CR>

nmap <silent> <Space>n <Cmd>call ddu#start({
\   'name': 'file_rec',
\   'uiParams': {
\     'filer': {
\       'splitDirection': 'top',
\       'split': 'horizontal',
\     }
\   },
\ })<CR>

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

  nnoremap <buffer><silent> n
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newFile'})<CR>

  nnoremap <buffer><silent> f
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newDirectory'})<CR>

  nnoremap <buffer><silent> yy
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'yank'})<CR>
endfunction

nmap <silent> sd <Cmd>call ddu#start({
\   'name': 'filer',
\   'uiParams': {
\     'filer': {
\       'path': expand('%:p'),
\       'sortTreesFirst': v:true,
\     }
\   },
\ })<CR>

""""""""""""""""""""""""""""""""""""""""
" auto-pairs
""""""""""""""""""""""""""""""""""""""""
" use auto-pairs
let g:AutoPairsFlyMode = 1

""""""""""""""""""""""""""""""""""""""""
" vim-better-whitespace
""""""""""""""""""""""""""""""""""""""""
let g:better_whitespace_guicolor='#E06C75'
let g:better_whitespace_enabled=1
