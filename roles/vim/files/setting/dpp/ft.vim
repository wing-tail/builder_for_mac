" hook_source {{{
MyAutoCmd BufEnter,BufRead,BufNewFile {Gemfile,Vagrantfile,Berksfile} setlocal ft=ruby
" }}}

" _ {{{
" Disable automatically insert comment.
setlocal formatoptions-=t
setlocal formatoptions-=c
setlocal formatoptions-=r
setlocal formatoptions-=o
setlocal formatoptions+=mMBl

" Disable auto wrap.
if &l:textwidth != 70 && &filetype !=# 'help'
  setlocal textwidth=0
endif

if !&l:modifiable
  setlocal nofoldenable
  setlocal foldcolumn=0
  setlocal colorcolumn=
endif
" }}}

" python {{{
setlocal tabstop=4 softtabstop=4 shiftwidth=4
setlocal smarttab
setlocal expandtab
setlocal nosmartindent
" }}}

" php {{{
setlocal tabstop=4 softtabstop=4 shiftwidth=4
" }}}

" html {{{
setlocal tabstop=2 softtabstop=2 shiftwidth=2
setlocal includeexpr=v:fname->substitute('^\\/','','')
setlocal path+=./;/
" }}}

" scss {{{
setlocal tabstop=2 softtabstop=2 shiftwidth=2
" }}}

" go {{{
setlocal tabstop=4 softtabstop=4 shiftwidth=4
setlocal noexpandtab
highlight default link goErr WarningMsg
match goErr /\<err\>/
" }}}

" vim {{{
setlocal tabstop=2 softtabstop=2 shiftwidth=2
setlocal iskeyword+=:,#
setlocal indentkeys+=\\,endif,endfunction,endfor,endwhile,endtry
" }}}

" ruby {{{
setlocal shiftwidth=2 softtabstop=2 tabstop=2
setlocal iskeyword+=!
setlocal iskeyword+=?
setlocal omnifunc=
" }}}

" typescript {{{
setlocal tabstop=2 softtabstop=2 shiftwidth=2
" }}}

" toml {{{
setlocal tabstop=2 softtabstop=2 shiftwidth=2
setlocal foldenable foldmethod=expr foldexpr=s:fold_expr(v:lnum)
function! s:fold_expr(lnum)
  const line = getline(a:lnum)
  return line ==# '' || line =~# '^\s\+'
endfunction
" }}}

" yaml {{{
setlocal tabstop=2 softtabstop=2 shiftwidth=2
setlocal iskeyword+=-
" }}}
