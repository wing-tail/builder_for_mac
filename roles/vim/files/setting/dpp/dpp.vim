let $CACHE = '~/.cache'->expand()
if !$CACHE->isdirectory()
  call mkdir($CACHE, 'p')
endif

function InitPlugin(plugin)
  let dir = $CACHE .. '/dpp/repos/github.com/' .. a:plugin
  if !dir->isdirectory()
    execute '!git clone https://github.com/' .. a:plugin dir
  endif
  execute 'set runtimepath^=' .. dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endfunction

call InitPlugin('Shougo/dpp.vim')
call InitPlugin('Shougo/dpp-ext-lazy')

let $DPP_BASE = '~/.cache/dpp'->expand()

if $DPP_BASE->dpp#min#load_state()
  for s:plugin in [
    \ 'Shougo/dpp-ext-installer',
    \ 'Shougo/dpp-ext-local',
    \ 'Shougo/dpp-ext-packspec',
    \ 'Shougo/dpp-ext-toml',
    \ 'Shougo/dpp-protocol-git',
    \ 'vim-denops/denops.vim',
    \ 'rhysd/vim-healthcheck',
    \ ]
    call InitPlugin(s:plugin)
  endfor
  MyAutoCmd User DenopsProcessStarted
    \ : call dpp#make_state($DPP_BASE, '$DPP_DIR/dpp.ts'->expand())
else
  MyAutoCmd BufWritePost *.lua,*.vim,*.toml,*.ts,vimrc,.vimrc
    \ : call dpp#check_files()
endif

MyAutoCmd User Dpp:makeStatePost
  \ : echomsg 'dpp make_state() is done'
  \ | call dpp#min#load_state($DPP_BASE)
  \ | call dpp#sync_ext_action('installer', 'install')
  \ | echomsg 'plugins are ready'
  \ | echomsg 'recommend reopening the file'
