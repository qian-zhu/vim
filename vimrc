" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'ocompatiblei.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

set nocompatible

set showcmd        " Show (partial) command in status line.
set showmode       " Show mode in status line

set showmatch       " Show matching brackets.
set mat=2

" Search
set hlsearch        " Hightlight search
set ignorecase      " Ignore case when searching
set smartcase       " Do smart case matching: ignore case if search pattern is all lowercase, case-sensitive otherwise

" Smart indent
set smartindent
set autoindent    " always set autoindenting on
" Tab 
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set shiftround 

" Misc
set autowrite       " Automatically save before commands like :next and :make
set pastetoggle=<F9>
set nu
set title
set autoread
set fdm=manual
set termencoding=utf-8
set fileformats=unix
set hlsearch 
set wildmenu
set backspace=2


filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

"Smart indent
set smartindent
set autoindent    " always set autoindenting on

"Auto-complete
set completeopt=longest,menu

" map leader key
let mapleader = ','
let g:mapleader = ','

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc


" ============================================= Configuration for Plugin ===================================="
filetype off " required! turn off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
"   ,n  打开 关闭树形目录结构
"
"    在nerdtree窗口常用操作：(小写当前，大写root)
"    x.......Close the current nodes parent收起当前目录树
"    R.......Recursively refresh the current root刷新根目录树
"    r.......Recursively refresh the current directory刷新当前目录
"    P.......Jump to the root node
"    p.......Jump to current nodes parent
"    K.......Jump up inside directories at the current tree depth  到同目录第一个节点
"    J.......Jump down inside directories at the current tree depth 最后一个节点
"    o.......Open files, directories and bookmarks
"    i.......Open selected file in a split window上下分屏
"    s.......Open selected file in a new vsplit左右分屏
map <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end


Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"解决FileExplorer窗口变小问题
let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplorerMoreThanOne=2
let g:miniBufExplCycleArround=1

" 默认方向键左右可以切换buffer
nnoremap <TAB> :MBEbn<CR>
nnoremap <S-TAB> :MBEbp<CR>
nnoremap <A-down> :MBEbd<CR>


"Bundle 'Lokaltog/powerline'
"let g:Powerline_symbols = 'unicode'

Bundle 'vim-scripts/taglist.vim'
let Tlist_Process_File_Always = 1
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
nnoremap <silent> <F8> :TlistToggle<CR>
set statusline=%<%f%=%([%{Tlist_Get_Tagname_By_Line()}]%)
set laststatus=2


Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"Bundle 'Lokaltog/vim-powerline'
"let g:Powerline_symbols = 'unicode'

Bundle 'Lokaltog/vim-easymotion'
" <leader>, w : jump to word above current character
" <leader>, fc : jump to next c

Bundle 'Valloric/YouCompleteMe'
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"Stop asking once per .ycm_extra_conf.py file if it is safe to be loaded
let g:ycm_confirm_extra_conf = 0


"################# 语法检查 ###############

" 编辑时自动语法检查标红, vim-flake8目前还不支持,所以多装一个
" 使用pyflakes,速度比pylint快
Bundle 'scrooloose/syntastic'
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
"let g:syntastic_python_checkers=['pyflakes']
highlight SyntasticErrorSign guifg=white guibg=black

" python fly check, 弥补syntastic只能打开和保存才检查语法的不足
"Bundle 'kevinw/pyflakes-vim'
"let g:pyflakes_use_quickfix = 0


"################# 具体语言语法高亮 ###############

" for python.vim syntax highlight
"Bundle 'hdima/python-syntax'
"let python_highlight_all = 1

" for golang
"Bundle 'jnwhiteh/vim-golang'
"Bundle 'Blackrush/vim-gocode'

" for markdown
Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1


Bundle 'scrooloose/nerdcommenter'
" select --> ,cc : add comments.  ,cu: uncomments

Bundle 'Raimondi/delimitMate'
" insert matched ),",' ....

"Bundle 'fs111/pydoc.vim'
" K -- show manuall for current word or select sentence.
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
"---------- HTML ---------------
"Hightlist matching html
Bundle 'gcmt/breeze.vim' 
"Beautify your source code in Vim. javascript,css,html
Bundle "maksimr/vim-jsbeautify"
" Install nodejs at first
"autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
"autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
"autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
Bundle "othree/javascript-libraries-syntax.vim"
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 0

filetype plugin indent on

"" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline


"============== Add my personal vimrc================="
source ~/.vim/myvimrc/cscope/plugin/cscope_maps.vim
source ~/.vim/myvimrc/fold/fold.vim
source ~/.vim/myvimrc/misc/myvim.vim

if filereadable("vimrc.local")
  source vimrc.local
endif

