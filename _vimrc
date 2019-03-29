"插件管理 vim-plug
call plug#begin('d:\Program Files (x86)\Vim\vim80\plugged')
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/taglist.vim'
Plug 'mhinz/vim-signify'
Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call plug#end()



"字符编码配置
set fileformats=dos,unix
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

if has("win32")
    "set fileencoding=chinese
    set fileencoding=utf-8
    "for GVim
    set guifont=Consolas_for_Powerline_FixedD:h14:cANSI
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
else
    set fileencoding=utf-8
endif

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8

"界面风格配置
set number
set cindent
set sts=4
set shiftwidth=4
set nohls
set smartindent
set incsearch
set hlsearch
set cursorline
"set mouse=a
syntax enable
syntax on
"colorscheme darkburn
colorscheme evening

" ======= 设置当文件被外部改变的时侯自动读入文件 ======= "  
if exists("&autoread")
	set autoread
endif


let mapleader=','
"界面设置类命令快捷键
nnoremap <leader>=  :resize +5<CR>
nnoremap <leader>-  :resize -5<CR>
nnoremap <leader>]  :vertical resize +10<CR>
nnoremap <leader>[  :vertical resize -10<CR>
nnoremap <leader>;  :botright cwindow<CR>
nnoremap <leader>4  :!python %<CR><CR>
nnoremap <leader>5  :cd Baseline/APPS<CR> :make<CR> :cd-<CR>
nnoremap <leader>6  :cd Baseline/APPS<CR> :make clean<CR><CR> :make<CR> :cd-<CR>
nnoremap <leader>`  :call UpdateCscope()<CR>
"nnoremap <leader>f :vimgrep /<C-R>=expand("<cword>")/ **/*.c<CR>

"跳转类命令快捷键
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

"cscope config
"if has("cscope")
if !has("cscope")
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

"LeaderF config
let g:Lf_ShortcutF = '<c-p>'    
"\p 打开函数列表
noremap <Leader>p :LeaderfFunction<cr>

"taglist config
noremap <F3> :TlistToggle<CR>
let Tlist_Show_One_File=1  
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidt =28
let Tlist_Use_Right_Window=1            "在右侧窗口中显示taglist窗口

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
let NERDTreeDirArrows=0 "目录箭头 1 显示箭头 0传统+-|号
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

hi EasyMotionTarget ctermbg=none ctermfg=darkred
hi EasyMotionShade  ctermbg=none ctermfg=none

hi EasyMotionTarget2First ctermbg=none ctermfg=darkred
hi EasyMotionTarget2Second ctermbg=none ctermfg=magenta

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

