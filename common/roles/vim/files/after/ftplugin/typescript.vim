autocmd FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2

"dein
call dein#begin(expand('~/.vim/dein'))

"以下、プラグインを列挙
"call dein#add('{github.com/以下のリポジトリ名}')
call dein#add('leafgarland/typescript-vim')
call dein#add('peitalin/vim-jsx-typescript')

call dein#end()

"未インストールのプラグインをインストール
if dein#check_install()
  call dein#install()
endif
