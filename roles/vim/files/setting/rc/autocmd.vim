"シンタックス等の設定を常に有効化
function! SetVisualize()
  if execute('filetype') =~# 'OFF'
    silent! filetype plugin indent on
    syntax enable
    filetype detect
  endif
endfunction

MyAutoCmd FileType,Syntax,BufNewFile,BufNew,BufRead *? call SetVisualize()
"入力時は検索ハイライト無効
MyAutoCmd InsertEnter * set nohlsearch
MyAutoCmd InsertLeave * set hlsearch

"全角スペースをハイライト表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

MyAutoCmd ColorScheme * call ZenkakuSpace()
MyAutoCmd VimEnter,WinEnter * match ZenkakuSpace /　/

if has('syntax')
  call ZenkakuSpace()
endif
