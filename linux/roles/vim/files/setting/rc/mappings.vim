" Leader {{{
let g:mapleader = ';'
let g:maplocalleader = ','
nnoremap ;  <Nop>
nnoremap ,  <Nop>
" }}}

" window操作 {{{
nnoremap s      <Nop>
nnoremap sp     <Cmd>vsplit<CR><Cmd>wincmd w<CR>
nnoremap so     <Cmd>only<CR>
nnoremap <Tab>  <Cmd>wincmd w<CR>
nnoremap <expr> q
  \ &l:filetype ==# 'qf' ? '<Cmd>cclose<CR><Cmd>lclose<CR>' :
  \ ('#'->winnr()->winbufnr()->getbufvar('&filetype') !=# 'qf'
  \  && '$'->winnr() > 1) ? '<Cmd>close<CR>' : ''
" }}}

" 行移動 {{{
nnoremap <Down> gj
nnoremap <Up>   gk
" }}}

" インデント {{{
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv
" }}}

" インサート抜け {{{
inoremap <silent> jj <esc>
inoremap j<Space>    j
" }}}

" インサート時のカーソル移動 {{{
inoremap <C-d> <Delete>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" }}}

" コマンド時の操作 {{{
cnoremap <C-a> <Home>
cnoremap <C-d> <Delete>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-g> <C-c>
" }}}

" くり返し入力 {{{
nmap <C-Space>  <C-@>
cmap <C-Space>  <C-@>
" }}}

" スペシャルコマンド {{{
nnoremap <Leader>j za

nnoremap <silent><expr> <Leader>h
  \ &hls && v:hlsearch ? ':set nohlsearch' :
  \ ":let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>"

command! WordCount echo getline(1, '$')->join()->strchars()
nnoremap <Leader>w <Cmd>WordCount<CR>
" }}}
