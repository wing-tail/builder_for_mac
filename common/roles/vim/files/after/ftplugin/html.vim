autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2

"dein
call dein#begin(expand('~/.vim/dein'))

"以下、プラグインを列挙
"call dein#add('{github.com/以下のリポジトリ名}')
call dein#add('othree/html5.vim')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('jelera/vim-javascript-syntax')
call dein#add('hokaccha/vim-html5validator')
call dein#add('mattn/emmet-vim')

call dein#end()

"未インストールのプラグインをインストール
if dein#check_install()
  call dein#install()
endif
