set ttyfast
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
set fileformats=unix,dos,mac
set backspace=indent,eol,start
set number
set cursorline
set timeout timeoutlen=500 ttimeoutlen=100
set updatetime=1000

"補完系
set wildmenu
set wildmode=full
set wildchar=<C-t>
set wildcharm=<C-t>
set wildignorecase
let g:did_install_default_menus = v:true
set completeopt=menuone,noinsert
if '+completepopup'->exists()
  set completeopt+=popup
  set completepopup=height:10,width:80,highlight:InfoPopup
endif
set complete=.
set pumheight=10
set pumwidth=0
set completeslash=slash

set previewheight=20
set helpheight=12
set display=lastline
set display+=uhex

"検索設定
set incsearch
set ignorecase
set smartcase
set hlsearch

"タブとインデントの設定
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent

"タブ、空白、改行の可視化
set list
set listchars=tab:>-,trail:_,extends:>,precedes:<,nbsp:%
