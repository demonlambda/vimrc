"vundle安装: git clone http://github.com/VundleVim/Vundle.Vim
"~/.vim/bundle/Vundle.vim
"安装默认的插件：PluginInstall

"默认工作目录
"cd d:/www/

"文件打开保存编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312
set termencoding=utf-8
"vim内部编码
set encoding=utf-8
"提示信息中文
language messages zh_CN.utf-8

"start--------------------------vundle配置
set nocompatible

"filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' "目录显示
Plugin 'scrooloose/nerdtree' "目录显示
Plugin 'taglist.vim' "函数、变量显示
Plugin 'kien/ctrlp.vim' "文件搜索
Plugin 'Yggdroot/indentLine' "垂直对齐显示
Plugin 'matchit.zip' "
Plugin 'fatih/vim-go' "golang 语法支持
Plugin 'brookhong/DBGPavim' "php调试插件
Plugin 'vim-syntastic/syntastic' "php语法检查插件

call vundle#end()
"------------------------------end



"start-------------------------base
"colorscheme molokai
"let g:molokai_original=1 
"let g:rehash256=1
"set t_Co=256
color desert

let mapleader = "," "leader设置为,
syntax on "语法高亮
set nobackup "禁用文件保存时备份
set noswapfile "编辑时不生成swap文件
set backspace=2
set noautoindent "不自动缩进
set shiftwidth=4 "自动缩进4位
set cindent "c语言风格缩进
set nu "显示行号
set go= "隐藏菜单栏
set tabstop=4 "一个tab4位
set expandtab "将tab转换成space
set guifont=courier_new:h13 "字体
set fdm=marker "折叠
"---------end

"taglist-----config
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
"let Tlist_Auto_Open = 1

"nerdtree----config
let NERDTreeShowBookmarks=1 
let NERDTreeMinimalUI=1 
let NERDTreeDirArrows=1

"缩进对齐效果(空格缩进)
" Vim
let g:indentLine_color_term = 239
"GVim
let g:indentLine_color_gui = '#A4E57E'
" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

let b:match_words='\<begin\>:\<end\>'

"map iabbrev autocmd set
map <C-N> :NERDTreeToggle<cr>
map <C-T> :Tlist<cr>
map <F5> :!ctags -R .<cr>
map <F6> :NERDTreeFind<cr>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"自定义快捷键
nnoremap <leader>cw :copen<cr>
nnoremap <leader>cc :cclose<cr>
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
inoremap jk <esc>
nnoremap vg :vimgrep<Space>
nnoremap d<Space> 4X
nnoremap d<S-Left><Space> 4x

set laststatus=2
" 状态栏各个状态
let statusHead	="%-.50f\ %h%m%r"
let statusBreakPoint	="%<"
let statusSeparator	="|"
let statusFileType	="%{((&ft\ ==\ \"help\"\ \|\|\ &ft\ ==\ \"\")?\"\":\"[\".&ft.\"]\")}"
let statusFileFormat ="[%{(&ff\ ==\ \"unix\")?\"u\":\"d\"}]"
let statusAscii	="\{%b:0x%B\}"
let statusCwd	="%-.50{getcwd()}"
let statusBody	=statusFileType.statusFileFormat.statusSeparator.statusAscii.statusSeparator."\ ".statusBreakPoint.statusCwd
let statusEncoding	="[%{(&fenc\ ==\ \"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]"
let statusBlank	="%="
let statusKeymap	="%k"
let statusRuler	="%-12.(%lL,%c%VC%)\ %P"
let statusTime	="%{strftime(\"%y-%m-%d\",getftime(expand(\"%\")))}"
let statusEnd=statusKeymap."\ ".statusEncoding.statusRuler."\ ".statusTime
" 最终状态栏的模式字符串
let statusString=statusHead.statusBody.statusBlank.statusEnd
set statusline=%!statusString

" php调试
"let g:dbgRavimOnce = 1
"let g:dbgRavimPort = 9009
"let g:dbgPavimBreakAtEntry = 1

"文件搜索
let g:ctrlp_by_filename=1

" php文件类型
augroup filetype_php
	autocmd!
	autocmd FileType php :iabbrev <buffer> pfun public function
	autocmd FileType php :iabbrev <buffer> ppfun protected function
	autocmd FileType php :iabbrev <buffer> pppfun private function
augroup END

:filetype plugin on
