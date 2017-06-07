" 开启 vundle 支持 开始
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vundle vim 插件列表
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'joonty/vdebug'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mileszs/ack.vim'
Plugin 'vim-php/tagbar-phpctags.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'mbbill/undotree'
Plugin 'w0rp/ale'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Plugin 'vim-scripts/php-doc-upgrade'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'Valloric/YouCompleteMe'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" 开启 Vundle 支持结束，以下为常规 vimrc 配置

" 将,（英文逗号）键设置为快捷起始键
let mapleader = ","
vmap '' :w !pbcopy<CR><CR>
" 开启 vim 256色显示
set t_Co=256
" 开启智能缩进
" set smartindent
" 开启状态栏（已启用 airline，不需要状态栏）
" set ruler
" 缩进为4个空格
set shiftwidth=4
" tab键将被转换为空格（paset 模式下无效）
set expandtab
" tab代表的空格数
set tabstop=4
" fix backspace in vim 7.4
set backspace=2
" 设置 vim 内部使用的字符编码为 utf-8
set encoding=utf-8
" 设置文件字符编码尾 utf-8，保持和 encoding 一致
setglobal fileencoding=utf-8
" 设置终端使用的字符编码
set termencoding=utf-8
"如果上面的设置还是不行的话，尝试下面的方法
"let &termencoding=&encoding
" 设置字符编码列表，打开文件时将依次尝试使用列表里的字符编码
set fencs=utf-8,gb18030,gbk,gb2312,ucs-bom,cp936
"设定文件编码类型，彻底解决中文编码问题
" 设置代码折叠方式为缩进
set foldmethod=indent
" 设置代码折叠方式为语法
" set foldmethod=syntax
" 开启 vim 时关闭代码折叠
set nofoldenable
" 设置高亮搜索
set hlsearch
" 搜索结果立即显示
set incsearch
" 设置默认进行大小写不敏感查找
set ignorecase
" 如果有一个大写字母，则切换到大小写敏感查找
set smartcase
" 允许根据文件类型进行不同的设置
filetype plugin on
" 开启语法高亮
syntax on
" set background=dark
" colorscheme solarized
" 在第80个字符处显示提示标识
" set cc=80
" " 行软限制为120个字符（PRS-2)
" set columns=120
" 不断行显示
" set wrap
" 高亮显示当前行/列
" set cursorline
" set cursorcolumn
" 将不用的 buffer 隐藏起来，便于加载其他 buffer
" 没有该选项的话，当前 buffer 被修改后使用 C-］进行跳转时会提示当前 buffer
" 未保存错误(E37)
" set hidden
" 当前目录没有 tags 文件的情况下到上层目录查找
set tags=tags;/
" 开启行号显示
set number
" 启用 airline
set laststatus=2

" 格式化 JSON 快捷键
nmap <silent> <leader>js <ESC>ggVG<ESC>:%!python -m json.tool<CR>
vmap <silent> <leader>js :%!python -m json.tool<CR>
" 格式化　XML 快捷键
nmap <silent> <leader>xml <ESC>ggVG<ESC>:silent %!xmlstarlet format --omit-decl<CR>
vmap <silent> <leader>xml :%!xmlstarlet format --omit-decl<CR>
" 开关文件导航快捷键
map <F2> :NERDTreeToggle<CR>
" 开关 tags 窗口的快捷键
map <F3> :TagbarToggle<CR>
" 调用 pandoc 和 lynx 进行 markdown 预览
" map <C-p> :!pandoc -f markdown_github % \| lynx -stdin<CR>
" 映射 Mac 系统的 Home,End 键
noremap <C-a> <Home>
noremap <C-e> <End>
" nnoremap <C-a> <Home>
" nnoremap <C-e> <End>
" inoremap <C-a> <Home>
" inoremap <C-e> <End>
" vnoremap <C-a> <Home>
" vnoremap <C-e> <End>
" cnoremap <C-a> <Home>
" cnoremap <C-e> <End>
" 按 \\ 搜索当前选中的文字
vnoremap \\ y/<C-R>"<CR>"
" 关闭当前 buffer 快捷键
nmap <leader>q :bdelete<CR>
" 在普通模式下将当前剪贴板里的内容复制到下一新行，适用于非整行复制
nmap <leader>p o<ESC>p<CR>
" 在普通模式下将当前剪贴板里的内容复制到上一新行，适用于非整行复制
nmap <leader>P O<ESC>p<CR>

" airline 使用 powerline 的 patch 字体
" see https://github.com/powerline/fonts
let g:airline_powerline_fonts = 1
" 设置 airline 主题
let g:airline_theme = 'term'
" 开启 airline 的 tagbar 支持
let g:airline#extensions#tagbar#enabled = 1
" 在 airline 状态栏种显示当前光标所在代码片段对应的 tag（仅显示 tag 名）
let g:airline#extensions#tagbar#flags = 's'
" 开启 airline 内置的 tabline 支持
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_splits = 1
" " tabline 的 buffer 索引使用上标数字
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" " 只有在 buffer 达到 2 个以上时才显示 buffer 条
" let g:airline#extensions#tabline#buffer_min_count = 2
" 使用数字索引的 tabline
" let g:airline#extensions#tabline#buffer_nr_show = 1

" tabline 默认只显示 tab 而不显示 buffer
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#exclude_preview = 1
" let g:airline#extensions#tabline#excludes = ['NERD_Tree', '__Tagbar__', 'ControlP']

" 设置 tabline 快捷键，仅在 buffer_idx_mode 设置为 1 的情况下有效
" leader+1 快速定位到索引为1的 buffer(tab)
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" leader+- 切换到上一 buffer(tab)
nmap <leader>- <Plug>AirlineSelectPrevTab
" leader+= 切换到下一 buffer(tab)
nmap <leader>= <Plug>AirlineSelectNextTab

" 设置 ctags 的路径，一般不需要设置，除非 PATH 变量下找不到
let g:tagbar_ctags_bin='/usr/bin/ctags'
" PHP 专用，使用 phpctags 生成更符合 PHP 使用的 tags 文件
let g:tagbar_phpctags_bin='~/.composer/vendor/bin/phpctags'
" phpctags 生成 tags 文件时最高允许使用的内存
let g:tagbar_phpctags_memory_limit = '512M'
" 打开 tagbar 时将光标移动到 tags 窗口
let g:tagbar_autofocus = 1
" 压缩显示 tags 窗口
let g:tagbar_compact = 1
" 光标在代码窗口滞留时(滞留时间大概是1.5秒)，tags 窗口自动定位到当前 tag
let g:tagbar_autoshowtag = 1
" tags 窗口中打开当前折叠快捷键设置为 =
let g:tagbar_map_openfold = ['=', 'zo', '<kPlus>']
" tags 窗口中折叠所有快捷键设置为 _
let g:tagbar_map_closeallfolds = ['_', 'zM']
" 设置 tags 窗口宽度
let g:tagbar_width = 30
" 设置 tags 默认按照书写顺序排序
let g:tagbar_sort = 0
" tags 窗口浏览时生成一个新分屏显示当前 tag 的代码片段
" let g:tagbar_autopreview = 1

" " 启用 omni 补全
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
"
" let g:neocomplete#enable_at_startup = 1

" 根据不同文件后缀使用不同的缩进
autocmd FileType json,sql,html,css,javascript,xml,yaml set ai
autocmd FileType json,sql,html,css,javascript,xml,yaml set sw=2
autocmd FileType json,sql,html,css,javascript,xml,yaml set ts=2
autocmd FileType json,sql,html,css,javascript,xml,yaml set sts=2
autocmd FileType sql set syn=mysql
" 自动删除行尾空格
autocmd BufWritePre * :%s/\s\+$//e


" 将 ag 命令重映射为 ack 命令
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
" 使用 ag 系统命令替换 ack
let g:ackprg = 'ag --vimgrep --smart-case'
" 高亮 ack 搜索结果
let g:ackhighlight = 1
" 调换 o 和 O 键的映射
let g:ack_mappings = {
  \ 'o': '<CR><C-W><C-W>:ccl<CR>',
  \ 'O': '<CR>' }

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
" let g:neocomplete#sources#dictionary#dictionaries = {
"     \ 'default' : '',
"     \ 'vimshell' : $HOME.'/.vimshell_hist',
"     \ 'scheme' : $HOME.'/.gosh_completions'
"         \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

" 定义自动补全快捷键
inoremap ,, <C-x><C-o>
" 使自动补全窗口的列表从上至下
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
" 关闭当前 buffer
nnoremap <silent><leader>q <ESC>:bdelete<CR>
" 设置 PHP 代码提示中包含 docblock
" let g:phpcomplete_parse_docblock_comments = 1

" Make multiple cursors fast with neocomplete
function! Multiple_cursors_before()
    exe 'NeoCompleteDisable'
endfunction

function! Multiple_cursors_after()
    exe 'NeoCompleteEnable'
endfunction

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_php = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'php': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" 括号匹配插件设置，括号匹配后按回车自动换行并缩进
let delimitMate_expand_cr=2

" neocomplete 与 delimitMate 插件兼容代码
" see: https://github.com/Raimondi/delimitMate/issues/111#issuecomment-257555997
imap <expr> <CR> pumvisible()
    \ ? "\<C-y>\<CR>"
    \ : '<Plug>delimitMateCR'

" 打开 undotree 窗口
nnoremap <leader>uu :UndotreeToggle<CR>
" undotree 窗口打开时自动获取光标
let g:undotree_SetFocusWhenToggle = 1

" 禁止自动备份文件
set nobackup
" 设置 undotree 持久化，持久化后即使文档关闭，再打开依然能够撤销到之前的状态
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif

" 设置 ctrlp 快捷键
let g:ctrlp_map = '<leader>cp'

" 设置 ale 进行代码检测的文件类型
let g:ale_linters = {
    \ 'php': ['php', 'phpcs'],
    \ 'python': ['flake8']
    \ }
" 设置 ale 延迟1秒进行代码检测
let g:ale_lint_delay = 1000
let g:ale_php_phpcs_standard = 'psr2'

" 设置 python 不提示的代码格式错误
let g:ale_python_flake8_args = '--ignore="C0103,C0111,E0401,E402"'

" 定位到下一个错误或警告
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" 定位到上一个错误或警告
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" 开启或关闭 ALE 功能
nmap <silent> <Leader>at <ESC>:ALEToggle<CR>

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
" PHP documenter script bound to Control-P
autocmd FileType php nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>
autocmd FileType php vnoremap <leader>d :call pdv#DocumentWithSnip()<CR>
" autocmd FileType php inoremap <leader>d  <ESC>:call PhpDocSingle()<CR>i
" autocmd FileType php nnoremap <leader>d  :call PhpDocSingle()<CR>
" autocmd FileType php vnoremap <leader>d  :call PhpDocRange()<CR>
" autocmd FileType php nnoremap <leader>h :Php <q-args>

" 开启 php 7 的返回类型检测
let g:ultisnips_php_scalar_types = 1
" 开启 php 7 的严格模式
let g:ultisnips_php_strict_types = 1
" 设置 snips 开发者名称
let g:snips_author = 'Chopin Ngo <consatan@gmail.com>'
" 将 e 命令重映射为 tabnew
cnoreabbrev e tabnew
" 在新 tab 打开 tag
nnoremap <leader>] <C-w><C-]><C-w>T

" 可视化缩进
" 禁止随 vim 自启动
let g:indent_guides_enable_on_vim_startup = 0
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level = 2
" 色块宽度
let g:indent_guides_guide_size = 1
" 设置代码可视化缩进在哪些文件类型中不开启
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar']
" 禁用默认键盘映射
let g:indent_guides_default_mapping = 0
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" 设置可视化代码缩进奇偶行颜色不同
colorscheme nocolor
set background=dark
hi IndentGuidesOdd  ctermbg = black
hi IndentGuidesEven ctermbg = darkgrey

" php xdebug 监听端口
" autocmd FileType php let g:vdebug_options = { "port" : 10000 }
let g:vdebug_options = { "port" : 10000 }

" Indent Python in the Google way.

setlocal indentexpr=GetGooglePythonIndent(v:lnum)

let s:maxoff = 50 " maximum number of lines to look backwards.

function GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"
