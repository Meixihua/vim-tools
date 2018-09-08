noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l


" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 定义快捷键的前缀，即<Leader>，默认为"\"
let mapleader=";"

" 开启文件类型侦测
filetype on
" 根据侦测到的文件类型加载对应的插件
filetype plugin on

" 配色方案
" set background=light
set t_Co=256
colorscheme molokai
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'
set backspace=indent,eol,start

set modifiable
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 显示行号
set number
" 高亮显示当前行/列
set cursorline
" set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=2
" 设置格式化时制表符占用空格数
set shiftwidth=2
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=2
" 随 vim 自启动
" let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable


" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/vim-easy-align'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'dyng/ctrlsf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'easymotion/vim-easymotion'
"Plugin 'gou4shi1/Conque-GDB'
Plugin 'mechatroner/minimal_gdb'
cal  vundle#end()
filetype plugin indent on

Plugin 'kien/ctrlp.vim'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
set wildignore+=*\\.git\\*,*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc
" }}}

" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>

let g:UltiSnipsSnippetDirectories=["mysnippets"] 
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_right=1 
" 设置显示／隐藏标签列表子窗口的快捷键。速记：symbol list
nnoremap <Leader>sl :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=20
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
\ 'kinds' : [
   \ 'c:classes:0:1',
   \ 'd:macros:0:1',
   \ 'e:enumerators:0:0', 
   \ 'f:functions:0:1',
   \ 'g:enumeration:0:1',
   \ 'l:local:0:1',
   \ 'm:members:0:1',
   \ 'n:namespaces:0:1',
   \ 'p:functions_prototypes:0:1',
   \ 's:structs:0:1',
   \ 't:typedefs:0:1',
   \ 'u:unions:0:1',
   \ 'v:global:0:1',
   \ 'x:external:0:1'
\ ],
\ 'sro'        : '::',
\ 'kind2scope' : {
   \ 'g' : 'enum',
   \ 'n' : 'namespace',
   \ 'c' : 'class',
   \ 's' : 'struct',
   \ 'u' : 'union'
\ },
\ 'scope2kind' : {
    \ 'enum'      : 'g',
    \ 'namespace' : 'n',
    \ 'class'     : 'c',
    \ 'struct'    : 's',
    \ 'union'     : 'u'
\ }
\ }


" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=26
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

let g:NERDTreeIndicatorMapCustom = {
  \"Modified"  : "✹" ,
  \"Staged"    : "✚" ,
  \"Untracked" : "✭" ,
  \"Renamed"   : "➜" ,
  \"Unmerged"  : "═" ,
  \"Deleted"   : "✖" ,
  \"Dirty"     : "✗" ,
  \"Clean"     : "✔︎" ,
  \'Ignored'   : '☒' ,
  \"Unknown"   : "?" 
\ }

" 显示/隐藏 MiniBufExplorer 窗口.设置快捷键，速度：buffer list
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
noremap <Leader>bn :MBEbn<CR>
noremap <Leader>bp :MBEbp<CR>

" YCM 补全菜单配色
" 菜单
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
" highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
" set tags+=/data/misc/software/misc./vim/stdcpp.tags
set tags+=~/.vim/stdcpp.tags
set tags+=~/.vim/sys_tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全         
let g:ycm_seed_identifiers_with_syntax=1

nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToImprecise<CR>

let g:ctrlsf_ackprg = 'ack'
nnoremap <leader>ff :CtrlSF<CR>
nmap     <C-F>f <Plug>CtrlSFCCwordPath
nnoremap <leader>fo :CtrlSFOpen<CR>
nnoremap <leader>ft :CtrlSFToggle<CR>
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_auto_close = 0

let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>P :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$|build',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

if filereadable('/proc/cpuinfo')
  let &makeprg = 'make -j'.(system('grep -c ^processor /proc/cpuinfo')+1)
endif

" <Leader>f{char} to move to {char}
map  <Leader>F <Plug>(easymotion-bd-f)
nmap <Leader>F <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>W <Plug>(easymotion-bd-w)
nmap <Leader>W <Plug>(easymotion-overwin-w)

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"
" " These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" " Without these mappings, `n` & `N` works fine. (These mappings just provide
" " different highlight method and have some other features )
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)")

let g:ConqueTerm_StartMessages = 0
let g:ConqueGdb_Leader = '<Leader>'
let g:ConqueGdb_Continue = g:ConqueGdb_Leader . 'c'
let g:ConqueGdb_Next = g:ConqueGdb_Leader . 'n'
let g:ConqueGdb_Step = g:ConqueGdb_Leader . 's'
let g:ConqueGdb_Print = g:ConqueGdb_Leader . 'v'
let g:ConqueGdb_SetBreak = g:ConqueGdb_Leader . 'b'
let g:ConqueGdb_DeleteBreak = g:ConqueGdb_Leader . 'r'
let g:ConqueGdb_Backtrace = g:ConqueGdb_Leader . 't'

