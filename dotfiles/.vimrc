let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    call dein#add('Shougo/neocomplete.vim')
    call dein#add('w0ng/vim-hybrid')
    call dein#add('scrooloose/nerdtree')
    call dein#add('joshdick/onedark.vim')
    call dein#add('nathanaelkane/vim-indent-guides')
    call dein#add('bronson/vim-trailing-whitespace')
    call dein#add('jistr/vim-nerdtree-tabs')
    call dein#add('itchyny/lightline.vim')
    call dein#add('othree/html5.vim')
    call dein#add('hail2u/vim-css3-syntax')
    call dein#add('jelera/vim-javascript-syntax')
    call dein#add('hokaccha/vim-html5validator')
    call dein#add('pasela/unite-webcolorname')
    call dein#add('mattn/emmet-vim')
    call dein#add('Shougo/unite.vim')
    call dein#add('tpope/vim-surround')
    call dein#add('cohama/lexima.vim')
    call dein#add('slim-template/vim-slim')
    if dein#check_install()
        call dein#install()
    endif

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

" 画面表示の設定
set number
set cursorline
set laststatus=2
set cmdheight=2
set showmatch
set helpheight=999
set list
set background=dark

autocmd ColorScheme * highlight LineNr ctermfg=244

colorscheme hybrid

" clipboard連携
set clipboard+=unnamed

" カーソル移動関連の設定
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=8
set sidescrolloff=16
set sidescroll=1

" ファイル処理関連の設定
set confirm
set hidden
set autoread
set nobackup
set noswapfile

" 検索/置換の設定
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set path=~/**

" タブ/インデントの設定
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu
set wildmode=full
set history=1000

"ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells
set pastetoggle=<F5>
