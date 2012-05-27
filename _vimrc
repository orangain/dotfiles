set nocompatible

""" エンコーディング
set encoding=utf-8
scriptencoding utf-8

""" ユーザーランタイムパス
if isdirectory($HOME . '/.vim')
  let $MY_VIMRUNTIME = $HOME.'/.vim'
elseif isdirectory($HOME . '\vimfiles')
  let $MY_VIMRUNTIME = $HOME.'\vimfiles'
elseif isdirectory($VIM . '\vimfiles')
  let $MY_VIMRUNTIME = $VIM.'\vimfiles'
endif 

""" Vundle
filetype off

set rtp+=$MY_VIMRUNTIME/vundle
call vundle#rc('$MY_VIMRUNTIME/bundle/')

Bundle 'Shougo/neocomplcache'


filetype plugin indent on
syntax enable


""" システム
"クリップボードを共有
set clipboard+=unnamed
"バックアップ（~で終わるファイル）をとらない
set nobackup
"上書き前にバックアップを取る。（nobackupによって上書き成功後に削除される）
set writebackup
"カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>
"バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
"□や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double

""" 表示
"行番号を表示
set number
"オートインデントする
set autoindent
"タブの幅
set ts=4 sw=4 sts=4

""" 検索
"大文字小文字を区別しない。ただし検索語が大文字小文字の両方を含む場合は区別する。
set ignorecase
set smartcase
"最後まで行ったら最初から検索する。
set wrapscan
"インクリメンタルサーチ
set incsearch 
"検索語のハイライト
set hlsearch

""" キーマップ
"カーソルとj k では表示行で移動する。物理行移動は<C-n>,<C-p>
"キーボードマクロには物理行移動を推奨
"h l は行末、行頭を超えることが可能に設定(whichwrap)
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap j gj
nnoremap k gk
nnoremap h <Left>
nnoremap l <Right>
"l を <Right>に置き換えても、折りたたみを l で開くことができるようにする
if has('folding')
  nnoremap <expr> l foldlevel(line('.')) ? "\<Right>zo" : "\<Right>"
endif

"ヘルプを<C-h>で引く (WEB+DB Press Vol. 52)
nnoremap <C-h> :<C-u>help<Space>

"最後に変更した領域を選択 (WEB+DB Press Vol. 52)
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

""" プラグイン
"neocomplcache
let g:neocomplcache_enable_at_startup = 1
