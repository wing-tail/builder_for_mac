"シンタックス等の設定を常に有効化
function! SetVisualize()
  if execute('filetype') =~# 'OFF'
    silent! filetype plugin indent on
    colorscheme antares
    syntax enable
    filetype detect
  endif
endfunction
augroup AutoVisualize
  autocmd!
  autocmd FileType,Syntax,BufNewFile,BufNew,BufRead *? call SetVisualize()
  "入力時は検索ハイライト無効
  autocmd InsertEnter * set nohlsearch
  autocmd InsertLeave * set hlsearch
augroup END

"全角スペースをハイライト表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif
