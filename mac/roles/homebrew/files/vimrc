"dein
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')

"以下、プラグインを列挙
"call dein#add('{github.com/以下のリポジトリ名}')
call dein#add('itchyny/lightline.vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('scrooloose/nerdtree')
call dein#add('Townk/vim-autoclose')
call dein#add('honza/vim-snippets')
call dein#add('ujihisa/neco-look')
call dein#add('othree/html5.vim')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('jelera/vim-javascript-syntax')
call dein#add('hokaccha/vim-html5validator')
call dein#add('mattn/emmet-vim')
call dein#add('AtsushiM/sass-compile.vim')
call dein#add('zebult/auto-gtags.vim')
call dein#add('fatih/vim-go')
call dein#add('simeji/winresizer')
call dein#add('jeffkreeftmeijer/vim-numbertoggle')
call dein#add('tpope/vim-surround')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('tomtom/tcomment_vim')
call dein#add('leafgarland/typescript-vim')
call dein#add('peitalin/vim-jsx-typescript')

call dein#end()
filetype plugin indent on

"未インストールのプラグインをインストール
if dein#check_install()
    call dein#install()
endif

set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
set fileformats=unix,dos,mac
set laststatus=2
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\

"モード表示はlightline任せ
set noshowmode
if !has('gui_running')
    set t_Co=256
endif

colorscheme antares
syntax enable

set number
set cursorline
set showmatch
set matchtime=1
set wildmode=list:longest
set pumheight=10
set display=lastline
nnoremap <Down> gj
nnoremap <Up> gk
imap <silent> jj <esc>
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>

"検索設定
set incsearch
set ignorecase
set smartcase
set hlsearch

"タブとインデントの設定
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

"タブ、空白、改行の可視化
set list
set listchars=tab:>-,trail:_,extends:>,precedes:<,nbsp:%

augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript
    autocmd FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.{yaml,yml} setlocal filetype=yaml
    autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

"入力時は検索ハイライト無効
autocmd InsertEnter * set nohlsearch
autocmd InsertLeave * set hlsearch

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

"NERDTree
map <C-d> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
