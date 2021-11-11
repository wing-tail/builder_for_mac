"dein
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

"以下、プラグインを列挙
"call dein#add('{github.com/以下のリポジトリ名}')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neco-vim')
call dein#add('Shougo/neco-syntax')
call dein#add('ujihisa/neco-look')
call dein#add('scrooloose/nerdtree')
call dein#add('itchyny/lightline.vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('Townk/vim-autoclose')
call dein#add('simeji/winresizer')
call dein#add('jeffkreeftmeijer/vim-numbertoggle')
call dein#add('tpope/vim-surround')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('tomtom/tcomment_vim')

call dein#end()

"未インストールのプラグインをインストール
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
let g:deoplete#enable_at_startup = 1

set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
set fileformats=unix,dos,mac
set laststatus=2
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\
set backspace=indent,eol,start

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
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent

"タブ、空白、改行の可視化
set list
set listchars=tab:>-,trail:_,extends:>,precedes:<,nbsp:%

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

"NERDTree
map <C-d> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
