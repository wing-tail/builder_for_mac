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

let s:path = $CACHE . '/dein'
if dein#min#load_state(s:path)
  let s:base_dir = fnamemodify(expand('<sfile>'), ':h') . '/init/'
  let g:dein#inline_vimrcs = [s:base_dir . 'autocmd.vim', s:base_dir . 'options.vim', s:base_dir . 'mappings.vim']

  let s:dein_toml = s:base_dir . 'dein.toml'
  let s:dein_lazy_toml = s:base_dir . 'deinlazy.toml'
  let s:dein_ddc_toml = s:base_dir . 'ddc.toml'
  let s:dein_ft_toml = s:base_dir . 'deinft.toml'

  call dein#begin(s:path, [expand('<sfile>'), s:dein_toml, s:dein_lazy_toml, s:dein_ft_toml])

  call dein#load_toml(s:dein_toml, {'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml, {'lazy' : 1})
  call dein#load_toml(s:dein_ddc_toml, {'lazy' : 1})
  call dein#load_toml(s:dein_ft_toml)

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

call SetVisualize()
set secure
