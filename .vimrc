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

"YouCompleteMe
Bundle 'Valloric/YouCompleteMe'

"easymotion
Bundle 'easymotion/vim-easymotion'

Bundle 'scrooloose/nerdcommenter'
Bundle 'godlygeek/tabular'
Bundle 'python-mode/python-mode'
Bundle 'SirVer/ultisnips'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-syntastic/syntastic'

" vim-scripts repos （vim-scripts仓库里的，按下面格式填写）
Bundle 'taglist.vim'
"Bundle 'Tagbar'

"sessionman
Bundle 'sessionman.vim'

"gundo
Bundle 'sjl/gundo.vim'

"svnj
Bundle 'juneedahamed/svnj.vim'



"non github repos （非上面两种情况的，按下面格式填写）
"Bundle 'git://git.wincent.com/command-t.git'
" ...

"Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'skywind3000/asyncrun.vim'

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
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2313,cp936,latin1,big5
set fileformats=dos,unix
set cursorline
"set cursorcolumn
syntax enable
syntax on

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

let mapleader=","
nnoremap <leader>=  :resize +3<CR>
nnoremap <leader>-  :resize -3<CR>
nnoremap <leader>]  :vertical resize +3<CR>
nnoremap <leader>[  :vertical resize -3<CR>
nnoremap <leader>;  :botright cwindow<CR>


"ctags config
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nnoremap <C-F12> :!cscope -Rbq<CR>
nnoremap <leader>.	:cn<CR>
nnoremap <leader>,	:cp<CR>

if has("cscope")
"    set csprg=/usr/local/bin/cscope
    set csto=0
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
"noremap <F8> :Tagbar<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() "如果是c语言的程序的话，tagbar自动开启

" NERDTree config
noremap <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeChDirMode=2 "选中root即设置为当前目录
let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1 "显示书签
let NERDTreeMinimalUI=1 "不显示帮助面板
let NERDTreeDirArrows=1 "目录箭头 1 显示箭头 0传统+-|号
let NERDTreeWinPos="left"
let NERDTreeWinSize=25

"airline config
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
"set laststatus=2
"set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled=0
"let g:airline_theme="molokai"
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" old vim-powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"Sessionman config
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
nnoremap <leader>sl :SessionList<CR>
nnoremap <leader>ss :SessionSave<CR>
nnoremap <leader>sc :SessionClose<CR>

"YouCompleteMe
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>


autocmd BufNewFile *.[ch],*.hpp,*.cpp exec ":call SetTitle()" 

"加入注释
func SetComment()
    call setline(1,"/*===============================================================") 
    call append(line("."),   "*   Copyright (C) ".strftime("%Y")." All rights reserved.")
    call append(line(".")+1, "*   ") 
    call append(line(".")+2, "*   File Name:	".expand("%:t")) 
    call append(line(".")+3, "*   Creater:		Johnny He")
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
autocmd BufNewFile * normal G
