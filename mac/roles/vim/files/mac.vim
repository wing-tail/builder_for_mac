"dein
call dein#begin(expand('~/.vim/dein'))

"以下、プラグインを列挙
"call dein#add('{github.com/以下のリポジトリ名}')

call dein#end()

"未インストールのプラグインをインストール
if dein#check_install()
  call dein#install()
endif
