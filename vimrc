set nocompatible " be iMproved
filetype off " required! /** 从这行开始，vimrc配置 **/

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" let Vundle manage Vundle
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here: /* 插件配置格式 */
"
" original repos on github （Github网站上非vim-scripts仓库的插件，按下面格式填写）
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'

" vim-scripts repos （vim-scripts仓库里的，按下面格式填写）
"Bundle 'taglist.vim'
Bundle 'Tagbar'

" non github repos （非上面两种情况的，按下面格式填写）
"Bundle 'git://git.wincent.com/command-t.git'
" ...

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

set number
set cindent
set sts=4
set shiftwidth=4
set nohls
set smartindent
set incsearch
set hlsearch
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,gb18030,gb2312,cp936,ucs-bom,latin1
set fileformats=dos,unix
set mouse=a
set pastetoggle=<F11>
syntax enable
syntax on
let mapleader=','
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
set cursorline
"set cursorcolumn
colorscheme darkburn

" ======= 自动打开上次编辑过的文件 ======= "
"au VimLeave * mks! ~/.Session.vim
"if expand("%")==""
"	if(expand("~/.Session.vim")==findfile("~/.Session.vim"))
"		silent :source ~/.Session.vim
"	endif
"endif

" ======= 恢复上次文件打开位置 ======= "  
"set viminfo='10,\"100,:20,%,n~/.viminfo
"au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm'\"")|else|exe "norm $"|endif|endif

" ======= 设置当文件被外部改变的时侯自动读入文件 ======= "  
if exists("&autoread")
	set autoread
endif

nnoremap <leader>=  :resize +5<CR>
nnoremap <leader>-  :resize -5<CR>
nnoremap <leader>]  :vertical resize +10<CR>
nnoremap <leader>[  :vertical resize -10<CR>
nnoremap <leader>;  :botright cwindow<CR>
nnoremap <leader>pr	o<ESC>0cwprintf("====DEBUG[Johnny][%s][%s][%d]====\n", __FILE__,  __func__, __LINE__);<ESC>
nnoremap <leader>5	:cd Baseline/APPS<CR> :make<CR> :cd-<CR>
nnoremap <leader>`	:call UpdateCscope()<CR>
"nnoremap <leader>f	:vimgrep /<C-R>=expand("<cword>")/ **/*.c<CR>

nnoremap <C-H>	<C-W>h
nnoremap <C-J>	<C-W>j
nnoremap <C-K>	<C-W>k
nnoremap <C-L>	<C-W>l

"ctags config
"noremap <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nnoremap <C-F12>	:!cscope -Rbq<CR>
nnoremap <leader>cn	:cn<CR>
nnoremap <leader>cp	:cp<CR>

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

"Tagbar config
"nnoremap <F8> :TagbarToggle<CR>		"快捷键设置
"let g:tagbar_ctags_bin='ctags'          "ctags程序的路径
"let g:tagbar_width=28                   "窗口宽度的设置
"noremap <F3>	:Tagbar<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() "如果是c语言的程序的话，tagbar自动开启

" NERDTree config
noremap <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeChDirMode=2 "选中root即设置为当前目录
let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1 "显示书签
let NERDTreeMinimalUI=1 "不显示帮助面板
let NERDTreeDirArrows=0 "目录箭头 1 显示箭头 0传统+-|号
let NERDTreeWinPos="left"
let NERDTreeWinSize=25

" ======airline configuration===================
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
nnoremap <leader>m :b#<CR>
"set laststatus=2
set t_Co=256
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


" =====ctrl-p configuration=============
let g:ctrlp_map = '<leader>p'
"<leader>f搜索MRU（Most Recently Used）文件
nnoremap <leader>f :CtrlPMRUFiles<CR>
"<leader>b显示缓冲区文件，并可通过序号进行跳转
nnoremap <Leader>b :CtrlPBuffer<CR>
"设置搜索时忽略的文件
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc|png|jpg|o|d|bak|[0-9])$',
    \ }
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 1
"修改QuickFix窗口显示的最大条目数
let g:ctrlp_max_height = 15
let g:ctrlp_match_window_reversed = 0
"设置MRU最大条目数为500
let g:ctrlp_mruf_max = 500
let g:ctrlp_follow_symlinks = 1
"默认使用全路径搜索，置1后按文件名搜索，准确率会有所提高，可以用<C-d>进行切换
let g:ctrlp_by_filename = 1
"默认不使用正则表达式，置1改为默认使用正则表达式，可以用<C-r>进行切换
let g:ctrlp_regexp = 0
"自定义搜索列表的提示符
let g:ctrlp_line_prefix = '♪ '


" =====undotree configuration=============
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 2
nnoremap <leader>ud	:UndotreeToggle<CR>
set undodir='~/.vim/undodir'
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" =====syntastic configuration=============
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

autocmd BufNewFile *.[ch],*.hpp,*.cpp exec ":call SetTitle()" 
autocmd BufNewFile * normal G
"autocmd BufWritePost *.[ch],*.hpp,*.cpp exec ":call UpdateCscope()"

"加入注释
func SetComment()
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
func SetTitle()
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
func UpdateCscope()
"	execute "normal! :cd /\<cr>"
	execute "normal! :!find `pwd` -name '*.[ch]' -o -name '*.cpp' > `pwd`/cscope.files\<cr>"
	execute "normal! :!cscope -bq\<cr>"
	execute "normal! :cscope reset\<cr><cr>"
endfunc
