set nocompatible
filetype off

set rtp+=~/.vim/vundle.git
call vundle#rc()


Bundle 'Shougo/neocomplcache'


filetype plugin indent on
syntax enable

""" エンコーディング
set encoding=utf-8

""" システム
" クリップボードを共有
set clipboard+=unnamed
" バックアップ（~で終わるファイル）をとらない
set backup
" 上書き前にバックアップを取る。（nobackupによって上書き成功後に削除される）
set writebackup

""" 表示
" 行番号を表示
set number
" オートインデントする
set autoindent
" タブの幅
set ts=4 sw=4 sts=4

""" 検索
" 大文字小文字を区別しない。ただし検索語が大文字小文字の両方を含む場合は区別する。
set ignorecase
set smartcase
" 最後まで行ったら最初から検索する。
set wrapscan
" インクリメンタルサーチ
set incsearch 
" 検索語のハイライト
set hlsearch

""" キーマップ
nnoremap j gj
nnoremap k gk

""" プラグイン
" neocomplcache
let g:neocomplcache_enable_at_startup = 1
