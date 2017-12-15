let s:dein_dir=expand('~/vimfiles/dein')
let s:dein_repo_dir=s:dein_dir . '/repos/github.com/Shougo/dein.vim'
 
if &compatible
  set nocompatible               " Be iMproved
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim.git' s:dein_repo_dir
endif

if &compatible
 set nocompatible
endif

" Required:
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state('~/vimfiles/dein/')
call dein#begin(expand('~/vimfiles/dein/'))
call dein#add('scrooloose/nerdtree')
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('kana/vim-submode')
call dein#add('jistr/vim-nerdtree-tabs')
call dein#end()
call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
 call dein#install()
endif

 " スワップファイルを生成しない 
 set noswapfile 
 set nobackup
 set noundofile



set enc=utf-8
 source $VIMRUNTIME/delmenu.vim
 set langmenu=ja_jp.utf-8
 source $VIMRUNTIME/menu.vim
 set guifont=Ricty:h12:cSHIFTJIS
 set renderoptions=type:directx
 set antialias

"NERDTree setting
set modifiable
let g:NERDTreeChDirMode = 2

" setting
"文字コードをUFT-8に設定
set fenc=utf-8

" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"クリップボード ⇔ VIM設定
set clipboard=unnamed,autoselect

"AutoCommand
autocmd vimenter * NERDTree

"タブ操作、ウインドウ操作
nnoremap s <Nop>
"タブ下に移動
nnoremap sj <C-w>j
"タブ上に移動
nnoremap sk <C-w>k
"タブ右に移動
nnoremap sl <C-w>l
"タブ左に移動
nnoremap sh <C-w>h
"ウインドウ下に移動
nnoremap sJ <C-w>J
"ウインドウ上に移動
nnoremap sK <C-w>K
"ウインドウ右に移動
nnoremap sL <C-w>L
"ウインドウ左に移動
nnoremap sH <C-w>H
"次のタブに切替
nnoremap sn gt
"前のタブに切替
nnoremap sp gT
"ウインドウ回転
nnoremap sr <C-w>r
"タブ大きさを揃える
nnoremap s= <C-w>=
"タブ次に移動
nnoremap sw <C-w>w
"タブ縦横最大化
nnoremap so <C-w>_<C-w>|
"タブ大きさを揃える
nnoremap sO <C-w>=
"新規タブ作成
nnoremap st :<C-u>tabnew<CR>
"タブ一覧表示
nnoremap sT :<C-u>Unite tab<CR>
"タブ水平分割
nnoremap ss :<C-u>sp<CR>
"タブ垂直分割
nnoremap sv :<C-u>vs<CR>
"ウインドウ閉じる
nnoremap sq :<C-u>q<CR>
"バッファ閉じる
nnoremap sQ :<C-u>bd<CR>
"現在のタブで開いたバッファ一覧
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
"バッファ一覧
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
