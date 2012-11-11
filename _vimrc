set nocompatible

""" エンコーディング
" 参考: http://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-utf8
" encodingをUTF-8にするとWindowsのコマンドライン版で漢字が入力できなくなるので、その他の場合だけUTF-8にする。
if has('gui_running') && !has('unix')
  set encoding=utf-8
endif
" このスクリプト自体のエンコーディングを指定する。
scriptencoding utf-8
"ファイルを開く際のエンコーディングを指定
set fileencodings=ucs-bom,utf-8,iso-2022-jp,cp932,euc-jp,default,latin

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
Bundle 'ciaranm/inkpot'
Bundle 'scrooloose/nerdtree'

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
"幅によって自動的にテキスト整形されないようにする
"コメントが自動的に挿入されないようにする
set formatoptions=ql
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""" 表示
"行番号を表示
set number
"オートインデントする
set autoindent
"タブの幅
set ts=4 sw=4 sts=4
"コマンドラインの高さ (gvimはgvimrcで指定)
set cmdheight=1
set laststatus=2
"コマンドをステータス行に表示
set showcmd
"画面最後の行をできる限り表示する
set display=lastline
"Tab、行末の半角スペースを明示的に表示する
set list
set listchars=tab:^\ ",trail:~
"ステータスライン
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 
"色テーマ設定（gvimの色テーマは.gvimrcで指定する）
"colorscheme inkpot

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
"カーソルとj k では表示行で移動する。物理行移動は<C-n>,<C-p>（と思ってたけどタブの操作に割り当てたので、どうしよう）
"キーボードマクロには物理行移動を推奨
"h l は行末、行頭を超えることが可能に設定(whichwrap)
noremap <Down> gj
noremap <Up>   gk
noremap j gj
noremap k gk
noremap h <Left>
noremap l <Right>
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

"タブの切替
nnoremap <C-n> gt
nnoremap <C-p> gT

"Esc連打で検索ハイライトを消去
nnoremap <Esc><Esc> :nohlsearch<Return><Esc>

""" プラグイン
"neocomplcache
let g:neocomplcache_enable_at_startup = 1
