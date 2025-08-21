" hook_add {{{
nnoremap :       <Cmd>call CommandlinePre(':')<CR>:
nnoremap ?       <Cmd>call CommandlinePre('/')<CR>?
xnoremap :       <Cmd>call CommandlinePre(':')<CR>:

function! CommandlinePre(mode) abort
  " Overwrite sources
  let b:prev_buffer_config = ddc#custom#get_buffer()

  if a:mode ==# ':'
    call ddc#custom#patch_buffer('sourceOptions', #{
          \   _: #{
          \     keywordPattern: '[0-9a-zA-Z_:#-]*',
          \   },
          \ })
    " Use zsh source for :! completion
    call ddc#custom#set_context_buffer({ ->
          \ getcmdline()->stridx('!') ==# 0 ? {
          \   'cmdlineSources': [
          \     'shell-native', 'cmdline', 'cmdline-history', 'around',
          \   ],
          \ } : {} })
  endif

  MyAutoCmd User DDCCmdlineLeave ++once call CommandlinePost()

  call ddc#enable_cmdline_completion()
endfunction

function! CommandlinePost() abort
  " Restore config
  if 'b:prev_buffer_config'->exists()
    call ddc#custom#set_buffer(b:prev_buffer_config)
    unlet b:prev_buffer_config
  endif
endfunction
" }}}

" hook_source {{{
call ddc#custom#load_config(expand('$DDC_DIR/ddc.ts'))
" For insert mode completion
inoremap <expr> <Tab>
      \ pum#visible() ?
      \   '<Cmd>call pum#map#insert_relative(+1, "empty")<CR>' :
      \ col('.') <= 1 ? '<Tab>' :
      \ getline('.')[col('.') - 2] =~# '\s' ? '<Tab>' :
      \ ddc#map#manual_complete()
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1, 'empty')<CR>
inoremap <C-n>   <Cmd>call pum#map#select_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#select_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-o>   <Cmd>call pum#map#confirm_word()<CR>
inoremap <Home>  <Cmd>call pum#map#insert_relative(-9999, 'ignore')<CR>
inoremap <End>   <Cmd>call pum#map#insert_relative(+9999, 'ignore')<CR>
inoremap <expr> <C-e> pum#visible()
      \ ? '<Cmd>call pum#map#cancel()<CR>'
      \ : '<End>'

" For command line mode completion
cnoremap <expr> <Tab>
      \ wildmenumode() ? &wildcharm->nr2char() :
      \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
      \ ddc#map#manual_complete()
cnoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
cnoremap <C-o>   <Cmd>call pum#map#confirm()<CR>
cnoremap <C-q>   <Cmd>call pum#map#select_relative(+1)<CR>
cnoremap <C-z>   <Cmd>call pum#map#select_relative(-1)<CR>
cnoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
cnoremap <expr> <C-e> pum#visible()
      \ ? '<Cmd>call pum#map#cancel()<CR>'
      \ : '<End>'

cnoremap <expr> <C-t>  ddc#map#insert_item(0)
inoremap <expr> <C-t>
      \ pum#visible() ? ddc#map#insert_item(0) : "\<C-v>\<Tab>"

xnoremap <Tab>   "_R<Cmd>call ddc#map#manual_complete()<CR>
snoremap <Tab>   <C-o>"_di<Cmd>call ddc#map#manual_complete()<CR>

" For terminal completion
call ddc#enable_terminal_completion()

call ddc#enable()
" }}}
