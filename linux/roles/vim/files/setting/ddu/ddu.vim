" hook_add {{{
nnoremap s<Space> <Cmd>Ddu
  \ -name=files file
  \ -source-option-file-path=`'$DDU_DIR'->expand()`
  \ -ui-param-ff-split=floating
  \ <CR>

nnoremap ss
  \ <Cmd>Ddu -name=files-`tabpagenr()` file_point file_old
  \ `'.git'->finddir(';') != '' ? 'file_git' : ''`
  \ file -source-option-file-volatile
  \ file -source-param-file-new -source-option-file-volatile
  \ -unique -expandInput
  \ -resume=`ddu#get_items(#{ sources: ['file_point'] })->empty() ? 'v:true' : 'v:false'`
  \ -ui-param-ff-displaySourceName=short
  \ -ui-param-ff-split=floating
  \ <CR>

nnoremap <Leader>/ <Cmd>Ddu
  \ -name=search line -resume=v:false
  \ -ui-param-ff-startFilter=v:true
  \ <CR>

nnoremap <Leader>* <Cmd>Ddu
  \ -name=search line -resume=v:false
  \ -input=`expand('<cword>')`
  \ -ui-param-ff-startFilter=v:false
  \ <CR>

nnoremap <Leader>g <Cmd>Ddu
  \ -name=search rg -resume=v:false
  \ -ui-param-ff-ignoreEmpty
  \ -source-param-rg-input='`'Pattern: '->input('<cword>'->expand())`'
  \ <CR>

xnoremap <Leader>g y<Cmd>Ddu
  \ -name=search rg -resume=v:false
  \ -ui-param-ff-ignoreEmpty
  \ -source-param-rg-input='`'Pattern: '->input(v:register->getreg())`'
  \ <CR>

nnoremap <Leader>f <Cmd>Ddu
  \ -name=search rg -resume=v:false
  \ -ui-param-ff-ignoreEmpty
  \ -source-param-rg-input='`'Pattern: '->input('<cword>'->expand())`'
  \ -source-option-rg-path='`'Directory: '->input($'{getcwd()}/', 'dir')`'
  \ <CR>

nnoremap <Leader>n <Cmd>Ddu
  \ -name=search -resume
  \ -ui-param-ff-startFilter=v:false
  \ <CR>

nnoremap <Leader>r <Cmd>Ddu
  \ -name=register register
  \ -source-option-register-defaultAction=
  \`'.'->col() == 1 ? 'insert' : 'append'`
  \ -ui-param-ff-autoResize
  \ <CR>

nnoremap <Leader>d <Cmd>Ddu
  \ -name=outline markdown
  \ -ui-param-ff-ignoreEmpty
  \ -ui-param-ff-displayTree
  \ <CR>

nnoremap <Leader>o <Cmd>Ddu
  \ -name=output output
  \ -source-param-output-command='`'Command: '->input('', 'command')`'
  \ <CR>

xnoremap <expr> <Leader>r
  \ (mode() ==# 'V' ? '"_R<Esc>' : '"_d')
  \ .. '<Cmd>Ddu -name=register register
  \ -source-option-ff-defaultAction=insert
  \ -ui-param-ff-autoResize<CR>'

nnoremap <C-o> <Cmd>Ddu jumplist <CR>

inoremap <C-q> <Cmd>call ddu#start(#{
  \   name: 'file',
  \   ui: 'ff',
  \   sync: v:true,
  \   input: '.'->getline()[: '.'->col() - 1]->matchstr('\f*$'),
  \   sources: [
  \     #{ name: 'file', options: #{ defaultAction: 'feedkeys' } },
  \   ],
  \   uiParams: #{
  \     ff: #{
  \       startFilter: v:true,
  \       replaceCol: '.'->getline()[: '.'->col() - 1]->match('\f*$') + 1,
  \     },
  \   },
  \ })<CR>

cnoremap <C-q> <Cmd>call ddu#start(#{
  \   name: 'file',
  \   ui: 'ff',
  \   sync: v:true,
  \   input: getcmdline()[: getcmdpos() - 2]->matchstr('\f*$'),
  \   sources: [
  \     #{ name: 'file', options: #{ defaultAction: 'feedkeys' } },
  \   ],
  \   uiParams: #{
  \     ff: #{
  \       startFilter: v:true,
  \       replaceCol: getcmdline()[: getcmdpos() - 2]->match('\f*$') + 1,
  \     },
  \   },
  \ })<CR><Cmd>call setcmdline('')<CR><CR>

call ddu#load('ui', ['ff'])
call ddu#load('kind', ['file'])
" }}}

" hook_source {{{
call ddu#custom#load_config('$DDU_DIR/ddu.ts'->expand())
" }}}

" hook_post_update {{{
call ddu#set_static_import_path()
" }}}
