vim9script

set nocompatible # be iMproved
filetype off # required! /** 从这行开始，vimrc配置 **/

if has("win32")
    set rtp+=$HOME/vimfiles/bundle/Vundle.vim
else
    set rtp+=~/.vim/bundle/vundle/ 
endif

vundle#begin()
if has("win32")
    Plugin 'gmarik/vundle'
    Plugin 'scrooloose/nerdtree'
    Plugin 'easymotion/vim-easymotion'
    Plugin 'mbbill/undotree'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'taglist.vim'
    Plugin 'vim-airline/vim-airline'
    Plugin 'Yggdroot/LeaderF'
    Plugin 'liuchengxu/vim-which-key'
else
    Plugin 'file:///data1/heshengjiang/work/studySpace/localRepo/vimPlug/LeaderF'
    Plugin 'file:///data1/heshengjiang/work/studySpace/localRepo/vimPlug/vim-colors-solarized-master'
    Plugin 'file:///data1/heshengjiang/work/studySpace/localRepo/vimPlug/ale-master'
    Plugin 'file:///data1/heshengjiang/work/studySpace/localRepo/vimPlug/asyncrun.vim-master'
    Plugin 'file:///data1/heshengjiang/work/studySpace/localRepo/vimPlug/vim-signify-master'
    Plugin 'file:///data1/heshengjiang/work/studySpace/localRepo/vimPlug/vim-airline'
    Plugin 'file:///data1/heshengjiang/work/studySpace/localRepo/vimPlug/vim-easymotion'
    Plugin 'file:///data1/heshengjiang/work/studySpace/localRepo/vimPlug/vim-which-key'
    Plugin 'file:///data1/heshengjiang/work/studySpace/localRepo/vimPlug/sessionman.vim'
    Plugin 'file:///data1/heshengjiang/work/studySpace/localRepo/vimPlug/undotree'
    Plugin 'file:///data1/heshengjiang/work/studySpace/localRepo/vimPlug/vim-snippets-master'
    Plugin 'file:///data1/heshengjiang/work/studySpace/localRepo/vimPlug/ultisnips-master'
    Plugin 'file:///data1/heshengjiang/work/studySpace/localRepo/vimPlug/vim-mark-master'
    Plugin 'file:///data1/heshengjiang/work/studySpace/localRepo/vimPlug/tagbar'
    Plugin 'file:///data1/heshengjiang/work/studySpace/localRepo/vimPlug/vim-preview'
    Plugin 'file:///data1/heshengjiang/work/studySpace/localRepo/vimPlug/vim-gutentags'
    Plugin 'file:///data1/heshengjiang/work/studySpace/localRepo/vimPlug/vcscommand'
#    Plugin 'file:///data1/heshengjiang/work/studySpace/localRepo/vimPlug/coc.nvim'
    #Plugin 'file:///data1/heshengjiang/work/studySpace/localRepo/vimPlug/YouCompleteMe'
endif
vundle#end()

filetype plugin indent on # required! /** vimrc文件配置结束 **/

# /** vundle命令 **/
# Brief help
# :BundleList - list configured bundles
# :BundleInstall(!) - install(update) bundles
# :BundleSearch(!) foo - search(or refresh cache first) for foo
# :BundleClean(!) - confirm(or auto-approve) removal of unused bundles
#
# see :h vundle for more details or wiki for FAQ
# NOTE: comments after Bundle command are not allowed..

#字符编码配置
set encoding=utf-8
set termencoding=utf-8
#set fileencodings=ucs-bom,utf-8,big5,gb18030,gb2312,gbk,cp936,latin1
set fileencodings=ucs-bom,utf-8,cp936,gbk,gb2312,big5,gb18030
set fileformats=dos,unix
#if version >= 603
	set helplang=cn
#endif

#界面风格配置
 #缩进风格：4个空格代替Tab
set cindent
set softtabstop=4
set tabstop=4
set expandtab
set shiftwidth=4
set number
set smartindent
set incsearch
#set nohls
set hlsearch
set mouse=a
set cursorline
syntax enable
syntax on
g:solarized_termcolors = 256
#g:solarized_termtrans=1
#set background=light
colorscheme solarized

if has("win32")
    set guifont=DejaVu_Sans_Mono_for_Powerline:h16
    set guioptions-=m
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set guioptions-=b
    cd E:\vim工作目录
endif

# ======= 设置当文件被外部改变的时侯自动读入文件 ======= #  
if exists("&autoread")
	set autoread
endif

g:mapleader = ','
#界面设置类快捷键
nnoremap <leader>=  :resize +5<CR>
nnoremap <leader>-  :resize -5<CR>
nnoremap <leader>]  :vertical resize +10<CR>
nnoremap <leader>[  :vertical resize -10<CR>
nnoremap <leader>;  :botright cwindow<CR>
nnoremap <leader>en  :e ++enc=gbk<CR>
nnoremap <F12>		:call SwitchBgStyle()<CR>

#代码工程管理类快捷键
#nnoremap <leader>5	:cd APPS<CR> :make prj<CR> :cd-<CR>
nnoremap <leader>5	:AsyncStop<CR>:cd Baseline/APPS<CR>:AsyncRun make<CR>:cd-<CR>
nnoremap <leader>7	:cd APP/Baseline/APPS<CR>:AsyncRun make<CR>:cd-<CR>
#nnoremap <leader>6	:cd APPS<CR> :make clean_prj<CR><CR> :make prj<CR> :cd-<CR>
nnoremap <leader>6	:cd Baseline/APPS<CR>:make clean<CR><CR>:AsyncRun make all<CR>:cd-<CR>
nnoremap <leader>`	:call UpdateCscope()<CR>
nnoremap <leader>4	:w<CR>:call RunPython()<CR>

#代码跳转类快捷键
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
nnoremap <leader>te :vsplit<CR><C-W>l:terminal++curwin<CR>


#文字输入类快捷键
set pastetoggle=<F11>
set clipboard=unnamedplus
nnoremap ;			:
nnoremap <leader>pr	o<ESC>0cwprintf("____DEBUG[%s][%s][%d][%p]____\n", __FILE__, __func__, __LINE__, __builtin_return_address(0));<ESC>
nnoremap <leader>td	o<ESC>0cw//TODO:<ESC>
inoremap <C-u>		<ESC>viwUea
inoremap jk			<ESC>
nnoremap <leader>rd	@a
vnoremap <leader>ec y:!echo "<C-R>""<CR>
nnoremap <leader>ec viwy:!echo "<C-R>""<CR>
vnoremap <leader>yy :<C-u>call CopyFunc_V()<CR>
nnoremap <leader>yy :call CopyFunc_N()<CR>
vnoremap <leader>pp d:call PasteFunc()<CR>
nnoremap <leader>pp :call PasteFunc()<CR>

#surround
vnoremap <leader>"  <ESC>`<i"<ESC>`>la"<ESC>
vnoremap <leader>'  <ESC>`<i'<ESC>`>la'<ESC>
vnoremap <leader>9  <ESC>`<i(<ESC>`>la)<ESC>
vnoremap <leader>[  <ESC>`<i[<ESC>`>la]<ESC>
vnoremap <leader>{  <ESC>`<i{<ESC>`>la}<ESC>

#snippet system
augroup snippet
    autocmd!
    autocmd FileType c,cpp,h  :iabbrev <buffer> iff if ()<cr>{<cr>}<ESC>ka
    autocmd FileType c,cpp,h	:iabbrev <buffer> prr printf("____DEBUG[%s][%s][%d]____\n", __FILE__,  __func__, __LINE__);
	autocmd FileType c,cpp,h 	:iabbrev <buffer> iif #ifdef <cr>#endif<cr><ESC>kk$i
augroup END


#代码搜索快捷键
#nnoremap <leader>g  :vimgrep -R <cword> .<cr>
set grepprg=grep\ -nr\ --include=*.{c,c++,h}
#nnoremap <leader>g	:vimgrep /<C-R>=expand("<cword>")/j **/*.c<CR>
nnoremap <leader>vg	:vimgrep! /\<<C-R>=expand("<cword>")<CR>\>/j **/*.c<CR>
nnoremap <leader>g	:grep! <C-R>=expand("<cword>")<CR> .<CR>

#ctags config
set tags=./.tags;,.tags
#noremap <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
#nnoremap <C-F12>	:!cscope -Rbq<CR>

#cscope config
if has("cscope")
#    set csprg=/usr/local/bin/cscope
    set csto=0
	set cspc=3
    set cst
    set nocsverb
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    # add any database in current directory
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

#gtags config
set cscopetag # 使用 cscope 作为 tags 命令
#set cscopeprg='gtags-cscope' # 使用 gtags-cscope 代替 cscope
g:GtagsCscope_Auto_Load = 1
g:CtagsCscope_Auto_Map = 1
g:GtagsCscope_Quiet = 1

#taglist config
noremap <F3> :TlistToggle<CR>
if has("win32")
    g:Tlist_Ctags_Cmd = 'C:/windows/system32/ctags.exe'
endif
g:Tlist_Show_One_File = 1  
g:Tlist_Exit_OnlyWindow = 1
g:Tlist_WinWidt = 28
g:Tlist_Use_Right_Window = 1            #在右侧窗口中显示taglist窗口
#augroup taglistCfg
#	autocmd!
#	autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx  :TlistOpen #如果是c语言的程序的话，taglist自动开启
#augroup END

#Tagbar config
#nnoremap <F8> :TagbarToggle<CR>		#快捷键设置
#g:tagbar_ctags_bin='ctags'          #ctags程序的路径
#g:tagbar_width=28                   #窗口宽度的设置
#noremap <F3>	:Tagbar<CR>
#autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() #如果是c语言的程序的话，tagbar自动开启

# NERDTree config
noremap <F2> :NERDTreeToggle<CR>
augroup nerdtree
	autocmd!
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END
g:NERDTreeChDirMode = 2 #选中root即设置为当前目录
g:NERDTreeQuitOnOpen = 1
g:NERDTreeShowBookmarks = 1 #显示书签
g:NERDTreeMinimalUI = 1 #不显示帮助面板
g:NERDTreeDirArrows = 1 #目录箭头 1 显示箭头 0传统+-|号
g:NERDTreeWinPos = "left"
g:NERDTreeWinSize = 25

g:NERDTreeIndicatorMapCustom = {
      \ "Modified": "✹",
      \ "Staged": "✚",
      \ "Untracked": "✭",
      \ "Renamed": "➜",
      \ "Unmerged": "═",
      \ "Deleted": "✖",
      \ "Dirty": "✗",
      \ "Clean": "✔︎",
      \ "Unknown": "?"
      \ }

# ======airline configuration===================
#set laststatus=2
g:airline#extensions#tabline#enabled = 1
g:airline#extensions#tagbar#enabled = 1
g:airline#extensions#tabline#buffer_nr_show = 1
g:airline#extensions#tabline#fnamemod = ':t'
g:airline#extensions#whitespace#enabled = 0
#g:airline_theme="molokai"
g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	g:airline_symbols = {}
endif

# powerline symbols
g:airline_left_sep = ''
g:airline_left_alt_sep = ''
g:airline_right_sep = ''
g:airline_right_alt_sep = ''
g:airline_symbols.branch = ''
g:airline_symbols.colnr = ' ℅:'
g:airline_symbols.readonly = ''
g:airline_symbols.linenr = ' :'
#g:airline_symbols.maxlinenr = ''
g:airline_symbols.dirty = '⚡'

g:airline#extensions#bookmark#enabled = 1
g:airline#extensions#taglist#enabled = 1
g:airline#extensions#vim9lsp#enabled = 1
g:airline#extensions#vim9lsp#error_symbol = 'E:'
g:airline#extensions#vim9lsp#warning_symbol = 'W:'
g:airline#extensions#tagbar#flags = ''  #(default, 'f', 's', 'p')
g:airline_section_b = '%{strftime("%y/%m/%d %H:%M")}'

#=====Sessionman config================
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
nnoremap <leader>sl :SessionList<CR>
nnoremap <leader>ss :SessionSave<CR>
nnoremap <leader>sc :SessionClose<CR>
#au VimLeave * mks! ~/.Session.vim

#LeaderF config
g:Lf_ShortcutF = '<c-p>'
g:Lf_GtagsAutoGenerate = 1
#g:Lf_WindowPosition = 'popup'
g:Lf_PreviewInPopup = 1
g:Lf_PopupColorscheme = 'solarized'
g:Lf_Gtagslabel = 'native-pygments'
g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
g:Lf_ReverseOrder = 1
g:Lf_RootMarkers = ['.svn', '.root']
g:Lf_WildIgnore = {
	     'dir': ['.svn', '.git', '.hg', '.root'], 
	     'file': ['*.sw?', '~$*', '*.bak', '*.exe', '*.o', '*.so', '*.dll', '*.d', '*.zip', '*.tar', '*.tar.gz', '*.png', '*.jpg']
	    }

#\p 打开函数列表
#noremap <Leader>p :LeaderfFunction<cr>
noremap <Leader>ft :Leaderf gtags<cr>
noremap <Leader>ff :LeaderfFunction<cr>
#noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
#noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
#noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
#noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
#noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

noremap <Leader>fc :Leaderf --recall<CR>
if executable('rg')
    nnoremap <leader>fr :<C-U><C-R>=printf("Leaderf rg -e %s -g '*.h' -g '*.c' -g '*.cpp' -g '*.sh'", expand("<cword>"))<CR><CR>
    nnoremap <leader>fa :<C-U><C-R>=printf("Leaderf rg -e %s", expand("<cword>"))<CR><CR>
endif

# =====undotree configuration=============
g:undotree_SetFocusWhenToggle = 1
g:undotree_WindowLayout = 2
nnoremap <leader>ud	:UndotreeToggle<CR>
set hidden
set nobackup
set	noswapfile
set undofile
if has("win32")
    set undodir='$HOME/vimfiles/_undodir'
else
    set undodir='$HOME/.vim/.undodir'
endif
set undolevels=1000 #maximum number of changes that can be undone
set undoreload=10000 #maximum number lines to save for undo on a buffer reload

#ale
#始终开启标志列
g:ale_sign_column_always = 1
g:ale_set_highlights = 0
#自定义error和warning图标
g:ale_sign_error = 'E'
g:ale_sign_warning = 'W'
#在vim自带的状态栏中整合ale
g:ale_statusline_format = ['E %d', 'W %d', 'O OK']
#显示Linter名称,出错或警告等相关信息
g:ale_echo_msg_error_str = 'E'
g:ale_echo_msg_warning_str = 'W'
g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
#普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
g:airline#extensions#ale#enabled = 1
g:error_symbol = get(g:, 'airline#extensions#ale#error_symbol', 'E:')
g:warning_symbol = get(g:, 'airline#extensions#ale#warning_symbol', 'W:')
#<Leader>s触发/关闭语法检查
#nmap <Leader>s :ALEToggle<CR>
#<Leader>d查看错误或警告的详细信息
#nmap <Leader>d :ALEDetail<CR>
#使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
g:ale_linters = {
   'c++': ['g++'],
   'c': ['gcc'],
   'python': ['pylint'],
}
#当前支持的符号：→

# =====multiple cursors configuration=============
g:multi_cursor_next_key = '<C-N>' 
#g:multi_cursor_prev_key='<leader>mp'  
#g:multi_cursor_skip_key='<leader>mx'  
g:multi_cursor_quit_key = '<Esc>'

# =====svnj configuration=============
g:svnj_cache_dir = "/data1/heshengjiang/.vim/.svnj"
g:svnj_branch_url = ["https://192.0.0.140/DVR-DS9000/custom/KY2015/V3.4.97(K74)/branches/DZP20190313131北美Annke定制76NI-Q系列程序升级"]
g:svnj_username = "heshengjiang"
g:svnj_password = "3edc4rfv"

hi EasyMotionTarget ctermbg=none ctermfg=darkred
hi EasyMotionShade  ctermbg=none ctermfg=none

hi EasyMotionTarget2First ctermbg=none ctermfg=darkred
hi EasyMotionTarget2Second ctermbg=none ctermfg=magenta

#hi EasyMotionMoveHL ctermbg=green ctermfg=black
#hi EasyMotionIncSearch ctermbg=green ctermfg=black

#which-key config
nnoremap <silent> <leader> :WhichKey ','<CR>

g:UltiSnipsExpandTrigger = "<tab>"
# 使用 tab 切换下一个触发点，shit+tab 上一个触发点
g:UltiSnipsJumpForwardTrigger = "<C-J>"
g:UltiSnipsJumpBackwardTrigger = "<C-K>"
# 使用 UltiSnipsEdit 命令时垂直分割屏幕
g:UltiSnipsEditSplit = "vertical"
g:UltiSnipsSnippetsDir = "~/.vim/bundle/vim-snippets-master/snippets/"
g:snips_author = "He Shengjiang"


# gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

# 所生成的数据文件的名称
g:gutentags_ctags_tagfile = '.tags'

# 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
g:vim_tags = expand('~/.cache/tags')
g:gutentags_cache_dir = g:vim_tags

# 配置 ctags 的参数
g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
g:gutentags_ctags_extra_args += ['--c-kinds=+px']

# 同时开启 ctags 和 gtags 支持：
g:gutentags_modules = []
if executable('ctags')
	g:gutentags_modules += ['ctags']
endif
#if executable('gtags-cscope') && executable('gtags')
#	g:gutentags_modules += ['gtags_cscope']
#endif

# 禁用 gutentags 自动加载 gtags 数据库的行为
g:gutentags_auto_add_gtags_cscope = 0

#g:gutentags_define_advanced_commands = 1

# 检测 ~/.cache/tags 不存在就新建
if !isdirectory(g:vim_tags)
   silent! call mkdir(g:vim_tags, 'p')
endif


# =====AsyncRun configuration=============
augroup asyncQuickfix
	autocmd!
	autocmd User AsyncRunStop call asyncrun#quickfix_toggle(10,1)
	autocmd User AsyncRunStop exec "!sudo exchange -p ~/nfs/rootfs > /dev/null 2>&1 &"
augroup END

# =====settitle configuration=============
augroup settitle
	autocmd!
	autocmd BufNewFile *.[ch],*.hpp,*.cpp exec ":call SetTitle()" 
	autocmd BufNewFile * normal G
	#autocmd BufWritePost *.[ch],*.hpp,*.cpp exec ":call UpdateCscope()"
augroup END

# =====settitle configuration=============
#autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
#autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

#加入注释
def SetComment()
    call setline(1, "/*===============================================================") 
    call append(line("."),   "*   Copyright (C) " .. strftime("%Y") .. " All rights reserved.")
    call append(line(".") + 1, "*   ") 
    call append(line(".") + 2, "*   File Name:	" .. expand("%:t")) 
    call append(line(".") + 3, "*   Creater:		Shengjiang He")
    call append(line(".") + 4, "*   Create Date:	" .. strftime("%Y-%m-%d")) 
    call append(line(".") + 5, "*   Detail:		") 
    call append(line(".") + 6, "*")
    call append(line(".") + 7, "*   Update Log:	") 
    call append(line(".") + 8, "*") 
    call append(line(".") + 9, "================================================================*/") 
enddef
	
#定义函数SetTitle，自动插入文件头 
def SetTitle()
	call SetComment()
	if expand("%:e") == 'hpp' || expand("%:e") == 'h' 
		call append(line(".") + 10, "#ifndef __" .. toupper(expand("%:t:r")) .. "_H_") 
		call append(line(".") + 11, "#define __" .. toupper(expand("%:t:r")) .. "_H_") 
		call append(line(".") + 12, "")
		call append(line(".") + 13, "")
		call append(line(".") + 14, "")
		call append(line(".") + 15, "#endif //__" .. toupper(expand("%:t:r")) .. "_H_") 
		call append(line(".") + 16, "")
	elseif &filetype == 'c' || &filetype == 'cpp'
		call append(line(".") + 10, "#include \"" .. expand("%:t:r") .. ".h\"") 
		call append(line(".") + 11, "")
	endif
enddef

#定义函数UpdateCscope,自动更新cscope数据库
def UpdateCscope()
	execute "normal! :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q \<cr>"
	execute "normal! :!find `pwd` -name '*.[ch]' -o -name '*.cpp' > `pwd`/cscope.files\<cr>"
	execute "normal! :!cscope -bq\<cr>"
	execute "normal! :cscope reset\<cr><cr>"
enddef

def SwitchBgStyle()
	if &background == 'light'
		g:solarized_termtrans = 1
		set background=dark
	else
		g:solarized_termtrans = 0
		set background=light
	endif
    hi EasyMotionTarget ctermbg=none ctermfg=darkred
    hi EasyMotionShade  ctermbg=none ctermfg=none

    hi EasyMotionTarget2First ctermbg=none ctermfg=darkred
    hi EasyMotionTarget2Second ctermbg=none ctermfg=magenta
    source $HOME/.vim/syntax/c.vim
enddef

#定时器Handle函数，有想法的时候继续添加
def MyTimerHandle(id: number)
    #早上7点以前和晚上20点以后，使用深色主题
    if ((localtime() / 60 / 60 % 24 + 8 < 6) || (localtime() / 60 / 60 % 24 + 8 > 19))
        if &background != 'dark'
            call SwitchBgStyle()
            echom 'switch background to dark.'
        endif
    else
        if &background != 'light'
            call SwitchBgStyle()
            echom 'switch background to light.'
        endif
    endif
#    echom 'set end.'
enddef

#设置定时器
g:timer = timer_start( 10 * 1000, 'MyTimerHandle', { 'repeat': -1 } )


export def SearchText()
    text = input("Search Content: ")
    if executable('rg')
        execute "Leaderf! rg -e " .. text .. " -g '*.h' -g '*.c' -g '*.cpp' -g '*.sh'"
    else
        execute "grep -rn " .. text .. " --include=\"*.c *.h *.cpp *.sh\" *"
    endif
enddef

nnoremap <leader>fi :call SearchText()<CR>


#解决quickfix输出中文乱码问题
def QfMakeConv()
	qflist = getqflist()
	for i in qflist
		i.text = iconv(i.text, "cp936", "utf-8")
	endfor
	call setqflist(qflist)
enddef

#解决Source Insight看代码，中文注释都是乱码的问题
def FileSaveConv()
    set fileencoding=cp936
enddef

#解决Source Insight看代码，中文注释都是乱码的问题
def VimrcUpdate()
    source $MYVIMRC
	execute "AirlineRefresh"
enddef

augroup makeconv
	autocmd!
	autocmd QuickfixCmdPost make call QfMakeConv()
	autocmd BufNewFile * exec ":set fileencoding=cp936"
augroup END

augroup vimrcUpdate
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    autocmd BufWritePost $MYVIMRC exec ":AirlineRefresh"
    autocmd BufWritePost $MYVIMRC source $HOME/.vim/syntax/c.vim
augroup END
