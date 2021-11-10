"dein
call dein#begin(expand('~/.vim/dein'))

"以下、プラグインを列挙
"call dein#add('{github.com/以下のリポジトリ名}')
call dein#add('ujihisa/neco-look')
call dein#add('othree/html5.vim')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('jelera/vim-javascript-syntax')
call dein#add('hokaccha/vim-html5validator')
call dein#add('mattn/emmet-vim')
call dein#add('AtsushiM/sass-compile.vim')
call dein#add('zebult/auto-gtags.vim')
call dein#add('fatih/vim-go')
call dein#add('leafgarland/typescript-vim')
call dein#add('peitalin/vim-jsx-typescript')

call dein#end()

"未インストールのプラグインをインストール
if dein#check_install()
  call dein#install()
endif

"Gtags
nmap <C-h> <C-w><C-w><C-w>q
nmap <C-g> :Gtags -g<CR><CR>
nmap <C-l> :Gtags -f %<CR>
nmap <C-j> :Gtags <C-r><C-w><CR>
nmap <C-k> :Gtags -r <C-r><C-w><CR>
nmap <C-n> :cn<CR>
nmap <C-p> :cp<CR>

"auto-gtags
let g:auto_gtags = 1
let g:auto_gtags_directory_list = ['（gtags生成ルートディレクトリパス）']
