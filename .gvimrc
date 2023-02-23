" fonts
if has('win32')
  set guifont=Monaco:h15
else
  set guifont=SourceCodePro-Regular:h11
endif

" Appearance
colorscheme onehalfdark
set background=dark
set cursorline
set laststatus=2
set linespace=4
set list
set number
set numberwidth=5
" Airline
let g:airline_theme='onehalfdark'

" Terminal colos
let g:terminal_ansi_colors = [
\ '#383a42',
\ '#e45649',
\ '#50a14f',
\ '#c18401',
\ '#0184bc',
\ '#a626a4',
\ '#0997b3',
\ '#fafafa',
\ '#282c34',
\ '#e06c75',
\ '#98c379',
\ '#e5c07b',
\ '#61afef',
\ '#c678dd',
\ '#56b6c2',
\ '#dcdfe4',
\ ]

highlight Terminal guifg='#dcdfe4'
highlight Terminal guibg='#282c34'

" Tab setting
if has('win32')
  function! GuiTabLabel()
    let l:label = ''
    let l:bufnrlist = tabpagebuflist(v:lnum)
    let l:bufname = fnamemodify(bufname(l:bufnrlist[tabpagewinnr(v:lnum) - 1]), ':t')
    let l:label .= l:bufname == '' ? 'No title' : l:bufname

    for bufnr in l:bufnrlist
      if getbufvar(bufnr, "&modified")
        let l:label .= '+'
        break
      endif
    endfor

    return l:label
  endfunction

  set guitablabel=%N:\ %{GuiTabLabel()}
endif
