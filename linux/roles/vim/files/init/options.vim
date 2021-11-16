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

set number
set cursorline
set showmatch
set matchtime=1
set wildmode=list:longest
set pumheight=10
set display=lastline

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
