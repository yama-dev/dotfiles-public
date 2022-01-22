" vimrc " author: @yama-dev

"--------------------------------------------------
" reset augroup init
"--------------------------------------------------
augroup MyAutoCmd
autocmd!
augroup END

let g:mapleader = "\<Space>"

"--------------------------------------------------
" import
"--------------------------------------------------
source $HOME/vimfiles/functions.vim
source $HOME/vimfiles/js_file_open.vim
source $HOME/vimfiles/file_type_setting.vim
" source $HOME/vimfiles/vimrc-auto-cursorline.vim

"--------------------------------------------------
" Setting Env. >>>
"--------------------------------------------------
if IsWindows()
  if has('nvim')
  else
    set runtimepath+=$VIM
    set pythonthreedll=$VIM/python3/python37.dll
  endif
  if !has('python3')
    " Python Path
    let g:python3_host_prog = fnameescape(expand($VIM.'/python3/python.exe'))
  endif
else
  " Python Path
  let g:python3_host_prog = '/usr/local/bin/python3'
  if has('nvim')
    let g:node_host_prog = '~/.nodebrew/current/bin/neovim-node-host'
  endif
endif

if &compatible
  set nocompatible
endif

"--------------------------------------------------
" Setting Plugin.
"--------------------------------------------------
" set directory.
let s:vim_dir = $VIM
let s:home_dir = $HOME

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" download dein.vim
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim
endif

" dein plugins
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  call dein#add(s:dein_repo_dir)

  " plugin toml file.
  let s:toml = s:home_dir . '/vimfiles/plugins.toml'
  let s:colorscheme_toml = s:home_dir . '/vimfiles/plugins.colorscheme.toml'
  let s:lazy_toml = s:home_dir . '/vimfiles/plugins_lazy.toml'

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:colorscheme_toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if has('vim_starting') && dein#check_install()
 call dein#install()
endif

let g:dein#auto_recache = 1

"--------------------------------------------------
" Settings.
"--------------------------------------------------
""" Common.
set shellslash

""" Search and Replace.
set hlsearch
set ignorecase
set smartcase
set wrapscan
set incsearch
if has('nvim')
  set inccommand=split
endif

""" Tabs.
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
set smarttab
set shiftround

""" Indent.
set autoindent
set smartindent

""" Window size at startup.
set columns=170
set lines=55

""" Line Number.
set number
" set relativenumber

""" diff
set diffopt=internal,filler,iwhiteall,vertical

""" Command line.
set cmdheight=5
set wildmenu
set wildmode=list:longest,list:full
set wildchar=<tab>
set wildignore+=.git/*,.svn/*,.DS_Store,*.swp
set wildignore+=node_modules/*

""" Format option.
set formatoptions+=mM

""" Mouse
set mouse=a
" set mousefocus

""" Encoding.
set encoding=utf-8
" set fileencoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp
set fileformats=unix,dos,mac
scriptencoding utf-8
" 自動判別に失敗した場合に、文字コードを指定してファイルを開き直す
" :e ++enc=文字コード
" :e ++ff=改行コード

""" Backup file settings (file.txt~)
set backup
set backupdir=~/.vim/backup/,~/temp/backup/
if !isdirectory(expand('~/.vim/backup/'))
  call mkdir(expand('~/.vim/backup/'))
endif

""" Swap file settings (.file.txt.swp)
set swapfile
set directory=~/.vim/backup/,~/temp/backup/

" set updatetime= "save at [time]ms intarval
set updatetime=300
" set updatecount= "save at [count]typing intarval

" set shortmess-=I
set shortmess+=c

""" Undo file settings (.file.txt.un~)
set undofile
set undodir=~/.vim/backup/,~/temp/backup/

""" Set cd.
if has('autochdir')
  set autochdir
endif

""" Move cursor to move.
set whichwrap=b,s,h,l,<,>,[,]

""" clip board.
if has('nvim')
  set clipboard+=unnamedplus
endif

""" For IME.
" set ambiwidth=single
set ambiwidth=double

""" Set Fold.
set foldmethod=manual
" manual: 手動で折畳を定義する
" indent: インデントの数を折畳のレベル(深さ)とする
" expr:   折畳を定義する式を指定する
" syntax: 構文強調により折畳を定義する
" diff:   変更されていないテキストを折畳対象とする
" marker: テキスト中の印で折畳を定義する

""" Set Syntax.
set conceallevel=0
set synmaxcol=300

""" Display current line.
" set cursorline
" set cursorcolumn

" set list
set listchars=tab:>-,extends:<,trail:-,eol:<
" set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

""" Set Viminfo.
set viminfo='20,f1,<500,s100,h,%
set viminfo+=n~/.vim/viminfo

" set spell
" set spelllang=en,cjk

set autoread

set virtualedit=onemore

set visualbell

set showmatch

""" scroll offset.
set scrolloff=6

""" enable backspace.
set backspace=indent,eol,start

set wrap

""" ESC response time
set ttimeoutlen=10

set lazyredraw
set ttyfast

""" remove scroll bar.
" set guioptions-=r
" set guioptions-=R
" set guioptions-=l
" set guioptions-=L
" set guioptions-=b

let g:netrw_liststyle = 3
let g:netrw_winsize = 80

"--------------------------------------------------
" Settings key-bind.
"--------------------------------------------------

""" normal-mode key bind at us-keybord
map ; :

""" Highlight cancellation by pressing Esc twice.
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

""" change tabsize.
map <F9> <C-w>10<
map <F10> <C-w>10>
map <S-F9> <C-w>10-
map <S-F10> <C-w>10+

""" change tabsize.
map <F11> :ToggleFullScreen<CR>

""" Settings For Search and Replace.
nnoremap / /\v
nnoremap <C-g>g :vimgrep **/* \| cw
nnoremap <C-g>r :Rg 
nnoremap <C-g>f :/\( \\| \)
nnoremap <C-g>h :%s;;;gc
nnoremap <C-g>z /\zs\ze.*

" :g/abc/d                 """ abc を含む行を削除する
" :v/abc/d                 """ abc を含まない行を削除する
" :g//z#.5|echo '----'     """ ヒットする行の前後を確認する場合

""" Grep.
autocmd QuickFixCmdPost *grep* cwindow 22

""" Open new tab.
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>T :tabnew<CR>:CocCommand explorer<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT

""" move cursor line.
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

nnoremap <C-f> 20j
nnoremap <C-b> 20k

" nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap <S-h> ^
nnoremap <S-l> g_
nnoremap <C-h> 10h
nnoremap <C-l> 10l
vnoremap <S-h> ^
vnoremap <S-l> g_
vnoremap <C-h> 10h
vnoremap <C-l> 10l

inoremap <C-h> <ESC>10ha
inoremap <C-l> <ESC>10la

""" Not register overwrite.
xnoremap s "_s
nnoremap dd "_dd

""" Add Line.
nnoremap <Leader>al :%s/$/\r/gc<CR>
vnoremap <Leader>al :s/$/\r/gc<CR>

""" Delete Line.
" nnoremap <Leader>dl  :%s/^$\n//gc<CR>
" vnoremap <Leader>dl  :s/^$\n//gc<CR>

""" Delete Space.
" nnoremap <Leader>ds  :%s/\s\+//gc<CR>
" vnoremap <Leader>ds  :s/\s\+//gc<CR>

""" 一致した行を消す
" :%g/^.*Port.*$/d

""" 一致しない行を消す
" :%v/^.*Port.*$/d

inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

""" adjust indent.
vnoremap < <gv
vnoremap > >gv

inoremap jj <Esc>

""" Checkout IME-mode.
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

nnoremap <F12> :edit $MYVIMRC<CR>

"--------------------------------------------------
" grep
"--------------------------------------------------
set grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git\ --exclude-dir=node_modules
autocmd QuickfixCmdPost vimgrep copen
autocmd QuickfixCmdPost grep copen

""" ripgrep
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" command! -nargs=* -complete=file Rg :tabnew | :silent grep --sort-files <args>
" command! -nargs=* -complete=file Rgg :tabnew | :silent grep <args>

"--------------------------------------------------
" terminal
"--------------------------------------------------
""" Instantly insert mode.
if has('nvim')
  autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
else
  autocmd WinEnter * if &buftype ==# 'terminal' | normal i | endif
endif

""" Paste register.
if has('nvim')
  tnoremap <expr> <A-v> '<C-\><C-N>"'.nr2char(getchar()).'pi'
endif

"--------------------------------------------------
" PHP
"--------------------------------------------------
""" $VIMRUNTIME/syntax/php.vim
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1

""" $VIMRUNTIME/syntax/sql.vim
let g:sql_type_default = 'mysql' " For MySQL

"--------------------------------------------------
" HTML
"--------------------------------------------------
augroup AutoCmdHtml
  autocmd!
  " Append br tag.
  autocmd FileType xml,html inoremap <C-CR> <br>
  " Append close tag.
  autocmd Filetype xml,html inoremap <buffer> </ </<C-x><C-o>
augroup END

let g:html_indent_inctags = ""
let g:html_indent_autotags = "html,body"

"--------------------------------------------------
"
"--------------------------------------------------

