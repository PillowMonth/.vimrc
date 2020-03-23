"         __     _____ __  _______   ____
"         \ \   / /_ _|  \/  |  _ \ / ___|
"          \ \ / / | || |\/| | |_) | |
"        _  \ V /  | || |  | |  _ <| |___
"       |_|  \_/  |___|_|  |_|_| \_\\____|
"         
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/autoload/plugged')

""""""""""""""""""""""""""插件列表""""""""""""""""""""""""""

""""""""""""""""""""""""""""""                             "YouCompleteMe
Plug 'ycm-core/YouCompleteMe'
let g:ycm_global_ycm_extra_conf='~/.vim/autoload/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"开始补全的字符数
let g:ycm_min_num_of_chars_for_completion = 2
"jedi模块所在python解释器路径
let g:ycm_python_binary_path = 'python'
"开启使用语言的一些关键字查询
let g:ycm_seed_identifiers_with_syntax = 1
"补全后自动关闭预览窗口
let g:ycm_autoclose_preview_window_after_completion=1
"映射按键上下选择补全列表
let g:ycm_key_list_select_completion = ['<c-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-k>', '<Up>']
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_key_invoke_completion = '<c-z>'
""""""""""""""""""""""""""""""                             "树型文件夹
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
map <F4> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=30
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeShowBookmarks=1
"打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif

""""""""""""""""""""""""""""""                             "树型文件夹图标
Plug 'ryanoasis/vim-devicons'

""""""""""""""""""""""""""""""                             "airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_theme="solarized"

""""""""""""""""""""""""""""""                             "python缩进
Plug 'vim-scripts/indentpython.vim'

""""""""""""""""""""""""""""""                             "括号补全
Plug 'jiangmiao/auto-pairs'

""""""""""""""""""""""""""""""                             "异步语法检查
Plug 'w0rp/ale'
"ale-setting
let g:ale_set_highlights = 1
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"打开文件时是否进行检查
let g:ale_lint_on_enter = 0
"普通模式下前往上一个/下一个错误或警告快捷键
nmap fp <Plug>(ale_previous_wrap)
nmap fn <Plug>(ale_next_wrap)
"触发/关闭语法检查快捷键
nmap <Leader>o :ALEToggle<CR>
"查看错误或警告的详细信息快捷键
nmap <Leader>p :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
			\   'c++': ['clang'],
			\   'c': ['clang'],
			\   'python': ['pylint'],
			\}

""""""""""""""""""""""""""""""                             "python语法检查
"	Plug 'scrooloose/syntastic'

""""""""""""""""""""""""""""""                             "代码片段
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-f>"

""""""""""""""""""""""""""""""                             "内置终端优化
Plug 'skywind3000/vim-terminal-help'

""""""""""""""""""""""""""""""                             "import整理
Plug 'timothycrosley/isort'
autocmd FileType python nnoremap <F9> :!isort %<CR><CR>

""""""""""""""""""""""""""""""                             "格式化
Plug 'Chiel92/vim-autoformat'
Plug 'pignacio/vim-yapf-format'
let g:formatdef_jx = '"yapf --style=google "'
let g:formatters_python = ['jxm']
noremap <F6> :Autoformat<CR>

""""""""""""""""""""""""""""""
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
Plug 'junegunn/fzf.vim'
nnoremap <silent> <C-p> :Files<CR>

""""""""""""""""""""""""""""""                             "surround
Plug 'tpope/vim-surround'                                  

""""""""""""""""""""""""""""""                             "注释工具
Plug 'preservim/nerdcommenter'                             
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=" "

noremap ; :

noremap H ^
noremap L $
noremap J L
noremap K H

nnoremap Y y$
vnoremap Y "+y

nmap Q :q<CR>
nmap W :w<CR>

map <c-k> 5k
map <c-j> 5j

imap jj <ESC>
imap <m-l> <RIGHT>
imap <m-h> <LEFT>
imap <m-j> <DOWN>
imap <m-k> <UP>

colorscheme torte
set background=dark

language messages zh_CN.utf-8                              "语言设置

set autowrite                                              "自动保存

set cursorline                                             "显示行线

syntax on                                                  "开启高亮

set t_Co=256                                               "启用256色

set showmode                                               "显示当前模式

set incsearch                                              "输入搜索内容时就显示搜索结果

set showcmd                                                "显示输入命令

set wildmenu                                               "显示指令菜单

set showmatch                                              "高亮匹配括号

set completeopt=preview,menu                               "智能补全菜单
set wildmode=longest,list

set number                                                 "显示行号
set relativenumber

set smartcase                                              "搜索忽略大小写

set guioptions-=r                                          "隐藏滚动条
set guioptions-=L
set guioptions-=b

set smartindent                                            "开启新行时使用智能自动缩进

set autoindent                                             "自动缩进

filetype indent on                                         "为特定文件类型载入相关缩进文件

set tabstop=4                                              "设置table长度
set shiftwidth=4

set scrolloff=7                                            "距离顶部和底部长度

"set laststatus=2                                          "显示状态栏

set encoding=utf-8                                         "文件编码
set fenc=utf-8

"set mouse=a                                               "启用鼠标

set backspace=2

set hlsearch                                               "搜索项
map <F12> :nohlsearch<CR>
set ignorecase
set smartcase

set foldmethod=indent                                      "代码折叠 zc创建折叠
set foldlevel=99

"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()

"""""""""""""""""""""""""编译运行"""""""""""""""""""""""""""
noremap <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		set splitbelow
		exec "!g++ % -o %<"
		exec "term ./%<"

	elseif &filetype == 'cpp'
        set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	
	elseif &filetype == 'java'
        set splitbelow
		exec "!javac %"
		exec "term java %<"
	
	elseif &filetype == 'sh'
        set splitbelow
		:term bash %
	
	elseif &filetype == 'python'
        set splitbelow
		:term python3 %
	
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	
	elseif &filetype == 'dart'
		CocCommand flutter.run
	
	elseif &filetype == 'go'
        set splitbelow
		:sp
		:term go run .
	
	endif
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
