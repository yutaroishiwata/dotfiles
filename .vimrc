call plug#begin('~/.vim/plugged')
 Plug 'Shougo/vimproc.vim', {'build' : 'make'}
 Plug 'Shougo/unite.vim'
 Plug 'Shougo/defx.nvim'
 Plug 'jiangmiao/auto-pairs'
 Plug 'airblade/vim-gitgutter'
 Plug 'vim-airline/vim-airline'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 if !has('nvim')
  Plug 'Shougo/defx.nvim'
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
 endif
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
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
"  csscomb
""""""""""""""""""""""""""""""""""""""""
" autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :CSScomb

""""""""""""""""""""""""""""""""""""""""
"  Defx
""""""""""""""""""""""""""""""""""""""""
nnoremap sf :<c-u>Defx<cr>
nnoremap sd :<c-u>Defx `escape(expand('%:p:h'), ' :')` -search=`expand('%:p')`<cr>
autocmd FileType defx set norelativenumber

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
        \ defx#do_action('open')
  nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
        \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
        \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
        \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
        \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> o
        \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> D
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
        \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
        \ defx#do_action('toggle_columns',
        \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
        \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
        \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
        \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
        \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
        \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
        \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
        \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
        \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
        \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
        \ defx#do_action('change_vim_cwd')
endfunction

call defx#custom#column('icon', {
      \ 'directory_icon': '▸ ',
      \ 'file_icon': '  ',
      \ 'opened_icon': '▾ ',
      \ 'root_icon': '  ',
      \ })
call defx#custom#column('mark', {
      \ 'readonly_icon': '✗',
      \ 'selected_icon': '✓',
      \ })


call defx#custom#option('_', {
      \ 'show_ignored_files': 1,
      \ })

""""""""""""""""""""""""""""""""""""""""
" deoplete.nvim
""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
