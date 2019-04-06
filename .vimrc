set nocompatible " be iMproved
filetype off " required! /** 从这行开始，vimrc配置 **/

set rtp+=~/.vim/bundle/vundle/ 
call vundle#rc()

Bundle 'gmarik/vundle'
Plugin 'file:///data2/heshengjiang/work/studySpace/localRepo/vimPlug/LeaderF'
Plugin 'file:///data2/heshengjiang/work/studySpace/localRepo/vimPlug/vim-colors-solarized-master'
Plugin 'file:///data2/heshengjiang/work/studySpace/localRepo/vimPlug/ale-master'
Plugin 'file:///data2/heshengjiang/work/studySpace/localRepo/vimPlug/asyncrun.vim-master'
Plugin 'file:///data2/heshengjiang/work/studySpace/localRepo/vimPlug/vim-signify-master'
Plugin 'file:///data2/heshengjiang/work/studySpace/localRepo/vimPlug/vim-airline'
Plugin 'file:///data2/heshengjiang/work/studySpace/localRepo/vimPlug/vim-easymotion'
Plugin 'file:///data2/heshengjiang/work/studySpace/localRepo/vimPlug/vim-which-key'
Plugin 'file:///data2/heshengjiang/work/studySpace/localRepo/vimPlug/sessionman.vim'
Plugin 'file:///data2/heshengjiang/work/studySpace/localRepo/vimPlug/undotree'
Plugin 'file:///data2/heshengjiang/work/studySpace/localRepo/vimPlug/vim-snippets-master'
Plugin 'file:///data2/heshengjiang/work/studySpace/localRepo/vimPlug/ultisnips-master'
Plugin 'file:///data2/heshengjiang/work/studySpace/localRepo/vimPlug/vim-mark-master'

filetype plugin indent on " required! /** vimrc文件配置结束 **/

" /** vundle命令 **/
" Brief help
" :BundleList - list configured bundles
" :BundleInstall(!) - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!) - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"字符编码配置
set encoding=utf-8
set termencoding=utf-8
"set fileencodings=ucs-bom,utf-8,big5,gb18030,gb2312,gbk,cp936,latin1
set fileencodings=ucs-bom,utf-8,gbk,gb2312,big5,gb18030,cp936,latin1
set fileformats=dos,unix
if version >= 603
	set helplang=cn
endif

"界面风格配置
set number
set cindent
set sts=4
set shiftwidth=4
set nohls
set smartindent
set incsearch
set hlsearch
set mouse=a
set cursorline
syntax enable
syntax on
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

" ======= 设置当文件被外部改变的时侯自动读入文件 ======= "  
if exists("&autoread")
	set autoread
endif

let mapleader=','
"界面设置类快捷键
nnoremap <leader>=  :resize +5<CR>
nnoremap <leader>-  :resize -5<CR>
nnoremap <leader>]  :vertical resize +10<CR>
nnoremap <leader>[  :vertical resize -10<CR>
nnoremap <leader>;  :botright cwindow<CR>
nnoremap <F12>		:call SwitchBgStyle()<CR>

"代码工程管理类快捷键
"nnoremap <leader>5	:cd APPS<CR> :make prj<CR> :cd-<CR>
nnoremap <leader>5	:cd Baseline/APPS<CR>:AsyncRun make<CR>:cd-<CR>
"nnoremap <leader>6	:cd APPS<CR> :make clean_prj<CR><CR> :make prj<CR> :cd-<CR>
nnoremap <leader>6	:cd Baseline/APPS<CR>:make clean<CR><CR>:AsyncRun make all<CR>:cd-<CR>
nnoremap <leader>`	:call UpdateCscope()<CR>
nnoremap <leader>4	:w<CR>:call RunPython()<CR>

"代码跳转类快捷键
nnoremap <C-H>	<C-W>h
nnoremap <C-J>	<C-W>j
nnoremap <C-K>	<C-W>k
nnoremap <C-L>	<C-W>l
nnoremap <C-E>	3<C-E>
nnoremap <C-Y>	3<C-Y>
nnoremap <Space>	$
vnoremap <Space>	$
nnoremap <leader>cn	:cn<CR>
nnoremap <leader>cp	:cp<CR>
nnoremap <leader>d :bn<CR>
nnoremap <leader>a :bp<CR>
nnoremap <leader>. :b#<CR>
nnoremap <leader>ev	:vsplit $MYVIMRC<CR>
nnoremap <leader>py	:vsplit $HOME/.vim/plugin/johnny.vim<CR>
nnoremap <leader>se	:source $MYVIMRC<CR>
nnoremap <leader>lg	:vsplit $HOME/.worklog<CR>
autocmd! bufwritepost $MYVIMRC source %


"文字输入类快捷键
set pastetoggle=<F11>
nnoremap ;			:
nnoremap <leader>pr	o<ESC>0cwprintf("====DEBUG[Johnny][%s][%s][%d]====\n", __FILE__, __func__, __LINE__);<ESC>
nnoremap <leader>td	o<ESC>0cw//TODO:<ESC>
inoremap <C-u>		<ESC>viwUea
inoremap jk			<ESC>
nnoremap <leader>rd	@a
vnoremap <leader>ec y:!echo "<C-R>""<CR>
nnoremap <leader>ec viwy:!echo "<C-R>""<CR>

"surround
vnoremap <leader>"  <ESC>`<i"<ESC>`>la"<ESC>
vnoremap <leader>'  <ESC>`<i'<ESC>`>la'<ESC>
vnoremap <leader>9  <ESC>`<i(<ESC>`>la)<ESC>
vnoremap <leader>[  <ESC>`<i[<ESC>`>la]<ESC>

"snippet system
augroup snippet
    autocmd!
    autocmd FileType c,cpp,h  :iabbrev <buffer> iff if ()<cr>{<cr>}<ESC>ka
    autocmd FileType c,cpp,h	:iabbrev <buffer> prr printf("====DEBUG[Johnny][%s][%s][%d]====\n", __FILE__,  __func__, __LINE__);
	autocmd FileType c,cpp,h 	:iabbrev <buffer> iif #ifdef <cr>#endif<cr><ESC>kk$i
augroup END


"代码搜索快捷键
"nnoremap <leader>g  :vimgrep -R <cword> .<cr>
set grepprg=grep\ -nr\ --include=*.{c,c++,h}
"nnoremap <leader>g	:vimgrep /<C-R>=expand("<cword>")/j **/*.c<CR>
nnoremap <leader>vg	:vimgrep! /\<<C-R>=expand("<cword>")<CR>\>/j **/*.c<CR>
nnoremap <leader>g	:grep! <C-R>=expand("<cword>")<CR> .<CR>

"ctags config
"noremap <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"nnoremap <C-F12>	:!cscope -Rbq<CR>

"cscope config
if has("cscope")
"    set csprg=/usr/local/bin/cscope
    set csto=0
	set cspc=3
    set cst
    set nocsverb
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    " add any database in current directory
    if filereadable("cscope.out")
	cs add cscope.out
    endif
    nnoremap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nnoremap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nnoremap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nnoremap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nnoremap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nnoremap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nnoremap <C-@>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
    nnoremap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
    set csverb
endif

"taglist config
noremap <F3> :TlistToggle<CR>
let Tlist_Show_One_File=1  
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidt =28
let Tlist_Use_Right_Window=1            "在右侧窗口中显示taglist窗口
"augroup taglistCfg
"	autocmd!
"	autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx  :TlistOpen "如果是c语言的程序的话，taglist自动开启
"augroup END

"Tagbar config
"nnoremap <F8> :TagbarToggle<CR>		"快捷键设置
"let g:tagbar_ctags_bin='ctags'          "ctags程序的路径
"let g:tagbar_width=28                   "窗口宽度的设置
"noremap <F3>	:Tagbar<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() "如果是c语言的程序的话，tagbar自动开启

" NERDTree config
noremap <F2> :NERDTreeToggle<CR>
augroup nerdtree
	autocmd!
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END
let NERDTreeChDirMode=2 "选中root即设置为当前目录
let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1 "显示书签
let NERDTreeMinimalUI=1 "不显示帮助面板
let NERDTreeDirArrows=1 "目录箭头 1 显示箭头 0传统+-|号
let NERDTreeWinPos="left"
let NERDTreeWinSize=25

" ======airline configuration===================
"set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled=0
"let g:airline_theme="molokai"
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

"=====Sessionman config================
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
nnoremap <leader>sl :SessionList<CR>
nnoremap <leader>ss :SessionSave<CR>
nnoremap <leader>sc :SessionClose<CR>
"au VimLeave * mks! ~/.Session.vim


"LeaderF config
let g:Lf_ShortcutF = '<c-p>'    
"\p 打开函数列表
noremap <Leader>p :LeaderfFunction<cr>
let g:Lf_StlSeparator = { 'left': '⮀', 'right': '⮂', 'font': '' }
let g:Lf_ReverseOrder = 1
let g:Lf_WildIgnore = {
	    \ 'dir': ['.svn','.git','.hg'],
	    \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.dll','*.d','*.zip','*.tar','*.tar.gz','*.png','*.jpg']
	    \}


" =====undotree configuration=============
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 2
nnoremap <leader>ud	:UndotreeToggle<CR>
set nobackup
set	noswapfile
set undofile
set undodir='/data2/heshengjiang/.vim/.undodir'
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

"ale
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['E %d', 'W %d', 'O OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
let g:airline#extensions#ale#enabled = 1
let s:error_symbol = get(g:, 'airline#extensions#ale#error_symbol', 'E:')
let s:warning_symbol = get(g:, 'airline#extensions#ale#warning_symbol', 'W:')
"<Leader>s触发/关闭语法检查
"nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
"nmap <Leader>d :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['g++'],
\   'c': ['gcc'],
\   'python': ['pylint'],
\}
"当前支持的符号：→

" =====multiple cursors configuration=============
let g:multi_cursor_next_key='<C-N>' 
"let g:multi_cursor_prev_key='<leader>mp'  
"let g:multi_cursor_skip_key='<leader>mx'  
let g:multi_cursor_quit_key='<Esc>'

" =====svnj configuration=============
let g:svnj_cache_dir="/data2/heshengjiang/.vim/.svnj"
let g:svnj_branch_url = ["https://192.0.0.140/DVR-DS9000/custom/KY2015/V3.4.97(K74)/branches/DZP20190313131北美Annke定制76NI-Q系列程序升级"]
"let g:svnj_username="heshengjiang"
"let g:svnj_password="3edc4rfv"

hi EasyMotionTarget ctermbg=none ctermfg=darkred
hi EasyMotionShade  ctermbg=none ctermfg=none

hi EasyMotionTarget2First ctermbg=none ctermfg=darkred
hi EasyMotionTarget2Second ctermbg=none ctermfg=magenta

"hi EasyMotionMoveHL ctermbg=green ctermfg=black
"hi EasyMotionIncSearch ctermbg=green ctermfg=black

"which-key config
nnoremap <silent> <leader> :WhichKey ','<CR>

let g:UltiSnipsExpandTrigger="<tab>"
" 使用 tab 切换下一个触发点，shit+tab 上一个触发点
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" 使用 UltiSnipsEdit 命令时垂直分割屏幕
let g:UltiSnipsEditSplit="vertical"

" =====AsyncRun configuration=============
augroup asyncQuickfix
	autocmd!
	autocmd User AsyncRunStop call asyncrun#quickfix_toggle(10,1)
augroup END

" =====settitle configuration=============
augroup settitle
	autocmd!
	autocmd BufNewFile *.[ch],*.hpp,*.cpp exec ":call SetTitle()" 
	autocmd BufNewFile * normal G
	"autocmd BufWritePost *.[ch],*.hpp,*.cpp exec ":call UpdateCscope()"
augroup END

"加入注释
function! SetComment()
    call setline(1,"/*===============================================================") 
    call append(line("."),   "*   Copyright (C) ".strftime("%Y")." All rights reserved.")
    call append(line(".")+1, "*   ") 
    call append(line(".")+2, "*   File Name:	".expand("%:t")) 
    call append(line(".")+3, "*   Creater:		Shengjiang He")
    call append(line(".")+4, "*   Create Date:	".strftime("%Y-%m-%d")) 
    call append(line(".")+5, "*   Detail:		") 
    call append(line(".")+6, "*")
    call append(line(".")+7, "*   Update Log:	") 
    call append(line(".")+8, "*") 
    call append(line(".")+9, "================================================================*/") 
endfunc
	
"定义函数SetTitle，自动插入文件头 
function! SetTitle()
	call SetComment()
	if expand("%:e") == 'hpp' || expand("%:e") == 'h' 
		call append(line(".")+10, "#ifndef __".toupper(expand("%:t:r"))."_H_") 
		call append(line(".")+11, "#define __".toupper(expand("%:t:r"))."_H_") 
		call append(line(".")+12, "")
		call append(line(".")+13, "")
		call append(line(".")+14, "")
		call append(line(".")+15, "#endif //__".toupper(expand("%:t:r"))."_H_") 
		call append(line(".")+16, "")
	elseif &filetype == 'c' || &filetype == 'cpp'
		call append(line(".")+10,"#include \"".expand("%:t:r").".h\"") 
		call append(line(".")+11, "")
	endif
endfunc

"定义函数UpdateCscope,自动更新cscope数据库
function! UpdateCscope()
	execute "normal! :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q \<cr>"
	execute "normal! :!find `pwd` -name '*.[ch]' -o -name '*.cpp' > `pwd`/cscope.files\<cr>"
	execute "normal! :!cscope -bq\<cr>"
	execute "normal! :cscope reset\<cr><cr>"
endfunc

function! SwitchBgStyle()
	if &background == 'light'
		let g:solarized_termtrans=1
		set background=dark
	else
		let g:solarized_termtrans=0
		set background=light
	endif
endfunction

"解决quickfix输出中文乱码问题
function! QfMakeConv()
	let qflist = getqflist()
	for i in qflist
		let i.text = iconv(i.text, "cp936", "utf-8")
	endfor
	call setqflist(qflist)
endfunction

augroup makeconv
	autocmd!
	autocmd QuickfixCmdPost make call QfMakeConv()
augroup END
