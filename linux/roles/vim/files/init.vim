if &compatible
  set nocompatible
endif

let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif

if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE . '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

let g:dein#lazy_rplugins = v:true
let g:dein#install_progress_type = 'title'
let g:dein#install_check_diff = v:true
let g:dein#enable_notification = v:true
let g:dein#auto_recache = v:true

let s:path = $CACHE . '/dein'
let s:base_dir = fnamemodify(expand('<sfile>'), ':h') . '/init/'
let $RC_DIR = s:base_dir . '/rc/'
let $DDC_DIR = s:base_dir . '/ddc/'
if dein#min#load_state(s:path)
  let g:dein#inline_vimrcs = [$RC_DIR . 'autocmd.vim', $RC_DIR . 'options.vim', $RC_DIR . 'mappings.vim']

  let s:dein_toml = s:base_dir . 'dein.toml'
  let s:dein_lazy_toml = s:base_dir . 'deinlazy.toml'
  let s:dein_ft_toml = s:base_dir . 'deinft.toml'

  call dein#begin(s:path, [expand('<sfile>'), s:dein_toml, s:dein_lazy_toml, s:dein_ft_toml])

  call dein#load_toml(s:dein_toml, {'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml, {'lazy' : 1})
  call dein#load_toml($DDC_DIR . 'ddc.toml', {'lazy' : 1})
  call dein#load_toml(s:dein_ft_toml)

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

call SetVisualize()
set secure
