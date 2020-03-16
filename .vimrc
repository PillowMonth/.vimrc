"""""""""""""""""""""""" Vundle """"""""""""""""""""""""
set nocompatible         
filetype off                  

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

	Plugin 'VundleVim/Vundle.vim'
	
	Plugin 'ycm-core/YouCompleteMe'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
	
	Plugin 'scrooloose/nerdtree'	

call vundle#end()
filetype plugin indent on

" :常用的命令
" :PluginList       - 列出所有已配置的插件
" :PluginInstall     - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"""""""""""""""""""""""" Vundle """"""""""""""""""""""""

noremap i k
noremap j h
noremap k j
noremap h i

map B :wq<CR>
map E :q<CR>
map W :w<CR>

map <F5> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=30
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeShowBookmarks=1

imap jj <ESC>
imap ff <ESC>

"开启高亮
syntax on

"启用256色     
set t_Co=256

"显示当前模式
set showmode

"输入搜索内容时就显示搜索结果
set incsearch

"显示输入命令
set showcmd

"高亮匹配括号
set showmatch

"补全括号及引号
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT> 
inoremap < <><LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

"智能补全
set completeopt=preview,menu
set wildmode=longest,list

"显示行号
set number

"搜索忽略大小写
set smartcase

"隐藏滚动条 
set guioptions-=r 
set guioptions-=L
set guioptions-=b

"开启新行时使用智能自动缩进
set smartindent

"自动缩进
set autoindent

"为特定文件类型载入相关缩进文件
filetype indent on

"设置c缩进
set cindent     

"设置table长度
set tabstop=4   
set shiftwidth=4       

"距离顶部和底部长度
set scrolloff=5  

"显示状态栏
set laststatus=2

"文件编码
set fenc=utf-8  

"启用鼠标
"set mouse=a   

set backspace=2

"高亮搜索项
"set hlsearch 

"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle() 
