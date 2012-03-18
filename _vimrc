set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'


filetype plugin indent on
syntax enable

" エンコーディング
set encoding=utf-8

" 表示
set number
set autoindent
set ts=4 sw=4 sts=4

" キーマップ
nnoremap j gj
nnoremap k gk

