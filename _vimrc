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
"改行コードはWindowsでもUnixを優先
set fileformats=unix,dos,mac

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
Bundle 'tpope/vim-surround'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'Blackrush/vim-gocode'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'rhysd/clever-f.vim'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'orangain/vim-review'
Bundle 'coot/CRDispatcher'
Bundle 'coot/EnchantedVim'

if executable('exuberant-ctags') || executable('exctags') || executable('ctags') || executable('ctags.exe') || executable('tags')
	Bundle 'taglist.vim'
endif

""" Go lang
filetype plugin indent off
set runtimepath+=/usr/local/Cellar/go/1.2/libexec/misc/vim

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
" '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set shiftround
" 80文字目にラインを入れる
if exists('+colorcolumn')
	set colorcolumn=80
endif
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
" < -   Where to truncate line if too long.  Default is at the start. No width fields allowed.
" f S   Path to the file in the buffer, as typed or relative to current directory.
" m F   Modified flag, text is "[+]"; "[-]" if 'modifiable' is off.
" r F   Readonly flag, text is "[RO]".
" h F   Help buffer flag, text is "[help]".
" w F   Preview window flag, text is "[Preview]".
" { NF  Evaluate expression between '%{' and '}' and substitute result.
"       Note that there is no '%' before the closing '}'.
" = -   Separation point between left and right aligned items. No width fields allowed.
" B N   Value of character under cursor in hexadecimal.
" v N   Virtual column number.
" l N   Line number.
" L N   Number of lines in buffer.
" P S   Percentage through file of displayed window.  This is like the
"       percentage described for 'ruler'. Always 3 in length.
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ [U+%04.B](%v,%l)/%L%8P

augroup Highlights
  autocmd!
  "行末のスペースをハイライトする
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * let m1 = matchadd("TrailingSpaces", '\s\+$')
  "nbspをハイライトする（listcharsが効かないのはなんでだろ）
  autocmd VimEnter,WinEnter,ColorScheme * highlight SpecialSpaces term=underline guibg=DarkGreen ctermbg=Green
  autocmd VimEnter,WinEnter * let m2 = matchadd("SpecialSpaces", '\%u00A0')
augroup END

"色テーマ設定（gvimの色テーマは.gvimrcで指定する）
"colorscheme inkpot

""" 検索
"大文字小文字を区別しない。
set ignorecase
"ただし検索語が大文字小文字の両方を含む場合は区別する。
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
noremap gj j
noremap gk k
"l を <Right>に置き換えても、折りたたみを l で開くことができるようにする
if has('folding')
  nnoremap <expr> l foldlevel(line('.')) ? "\<Right>zo" : "\<Right>"
endif

"Jで行を結合するときにスペースを入れないようにする。
"単にJxに割り当てると行末尾に空白があった場合に、行頭にあった文字が削除されてしまうので
"行末尾の空白を消してからJxを実行する。
noremap <silent> J :s/\s*$//<CR>Jx:nohlsearch<Return>
"gJは特に使わないので、Jを割り当てる。
noremap gJ J

"ヘルプを<C-h>で引く (WEB+DB Press Vol. 52)
nnoremap <C-h> :<C-u>help<Space>

"最後に変更した領域を選択 (WEB+DB Press Vol. 52)
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

"Esc連打で検索ハイライトを消去
nnoremap <Esc><Esc> :nohlsearch<Return><Esc>
" 検索・置換時にvery magicを有効にし、メタ文字をエスケープせずに使えるようにする。
" ※普通にEnchanted Vimを有効にするとincsearchが使えなくなるので、/と?はキーマップで実現する。
" See: http://stackoverflow.com/questions/3760444/in-vim-is-there-a-way-to-set-very-magic-permanently-and-globally
let g:VeryMagic = 0
nnoremap / /\v
nnoremap ? ?\v
vnoremap / /\v
vnoremap ? ?\v
" Turn on all other features.
let g:VeryMagicSubstituteNormalise = 1
let g:VeryMagicSubstitute = 1
let g:VeryMagicGlobal = 1
let g:VeryMagicVimGrep = 1
let g:VeryMagicSearchArg = 1
let g:VeryMagicFunction = 1
let g:VeryMagicHelpgrep = 1
let g:VeryMagicRange = 1
let g:VeryMagicEscapeBackslashesInSearchArg = 1
let g:SortEditArgs = 1

"<Space-d> で a.hoge を a['hoge'] に変換する（hogeにカーソルがある状態で実行）
noremap <Space>d F.r[a'<Esc>wwi']<Esc>
"<Space-D> で a['hoge'] を a.hoge に変換する（hogeにカーソルがある状態で実行）
noremap <Space>D f]xdhF[xxi.<Esc>

"ノーマルモードでEnter押したら改行挿入
nnoremap <CR> o<ESC>
"Shift+Enterで上の行に挿入
nnoremap <S-CR> O<ESC>
"quickfixでは改行を挿入しない
"See: http://yakinikunotare.boo.jp/orebase2/vim/another_setting_in_quickfix_window
"See: http://stackoverflow.com/questions/11983282/vim-how-to-map-command-according-to-buffer-type
autocmd FileType qf nnoremap <buffer> <CR> <CR>

""" プラグイン
"neocomplcache
let g:neocomplcache_enable_at_startup = 1
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'
"Disable preview window
set completeopt-=preview

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><Up> pumvisible() ? "\<C-p>" : "\<Up>"

"syntastic
let g:syntastic_always_populate_loc_list=1
"自動でエラーリストを表示する
let g:syntastic_auto_loc_list=1
"flake8で1行は99文字まで
let g:syntastic_python_flake8_args="--max-line-length=99"
"Use gjslint
let g:syntastic_javascript_checkers = ['gjslint']
"gjslintで1行は99文字まで
let g:syntastic_javascript_gjslint_args="--max_line_length=99"
"javacの出力をUTF-8にする
let g:syntastic_java_javac_options="-Xlint -J-Dfile.encoding=UTF-8"
