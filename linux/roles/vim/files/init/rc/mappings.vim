nnoremap s    <Nop>
nnoremap sp  <Cmd>vsplit<CR><Cmd>wincmd w<CR>
nnoremap so  <Cmd>only<CR>
nnoremap <Tab>      <cmd>wincmd w<CR>
nnoremap <expr> q
      \ &l:filetype ==# 'qf' ? '<Cmd>cclose<CR><Cmd>lclose<CR>' :
      \ ('#'->winnr()->winbufnr()->getbufvar('&filetype') !=# 'qf'
      \  && '$'->winnr() > 1) ? '<Cmd>close<CR>' : ''

nnoremap <Down> gj
nnoremap <Up> gk

inoremap <silent> jj <esc>
inoremap j<Space>     j

inoremap <c-d> <delete>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>

nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
