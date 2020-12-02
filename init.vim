
" 设置256色终端
set t_Co=256
" 基础高亮
syntax on
" 取消音效
set noerrorbells
set tabstop=4 softtabstop=4
" shift > 组合键的宽度
set shiftwidth=4
" tab到空格键的转换
set expandtab
" 智能缩进
set smartindent
" 设置行号和相对行号
" 进入编辑模式时使用绝对行号，退出编辑模式进入normal模式时使用相对行号
set nu
set rnu
augroup relative_numbser
 autocmd!
 autocmd InsertEnter * :set norelativenumber
 autocmd InsertLeave * :set relativenumber
augroup END

" 取消自动换行
set nowrap
set smartcase
" 不生成vim.swap文件
set noswapfile
" 设置备份文件夹(需要自己创建该文件夹)
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
" 即时得到结果
set incsearch
" set paste mode
map <F9> :set paste<CR>
map <F10> :set nopaste<CR>
imap <F9> <C-O>:set paste<CR>
imap <F10> <nop>
set pastetoggle=<F10>

" Give more space for displaying messages.
set cmdheight=2

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" enter normal mode and back to previous position
inoremap jj <Esc>`^

" Plugins
call plug#begin('~/.vim/plugged')
" 色彩主题
Plug 'gruvbox-community/gruvbox'
" git相关
Plug 'tpope/vim-fugitive'
" ts着色/格式
Plug 'leafgarland/typescript-vim'
" 查看文档
Plug 'vim-utils/vim-man'
" c++ rtags
Plug 'lyuts/vim-rtags'
" 补全 替代YCM 
Plug 'neoclide/coc.nvim',{'branch':'release'}
" 撤销修改
Plug 'mbbill/undotree'
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
" airline
Plug 'https://github.com/vim-airline/vim-airline.git'
" vim game(Neovim Only)
Plug 'https://github.com/ThePrimeagen/vim-be-good.git'
" 异步执行任务 vim-dispatch
Plug 'tpope/vim-dispatch'
" dashboard 启动板
Plug 'glepnir/dashboard-nvim'
" 注释插件
Plug 'tpope/vim-commentary'
" graphical debugger 
Plug 'puremourning/vimspector'
" maximizer window
Plug 'szw/vim-maximizer'
" code formatter
Plug 'sbdchd/neoformat'
" edit quotes
Plug 'tpope/vim-surround'
" motion
Plug 'justinmk/vim-sneak'
" python highlight
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

call plug#end()

" 颜色主题
colorscheme gruvbox                                                             
set background=dark 
let g:gruvbox_contrast_dark='hard'
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

" Python 高亮配色修改
let g:semshi#always_update_all_highlights = v:true
function MyCustomHighlights()
    hi semshiBuiltin ctermfg=81
endfunction
autocmd FileType python call MyCustomHighlights()

" git搜索
if executable('rg')
    let g:rg_derive_root='true'
endif

" 设置ctrlp不想搜索的文件
" let g:ctrlp_user_command = ['.git/','git --git-dir=%s/.git ls-files -oc --exclude-standard']

" leader key 进入你的命令模式
let mapleader = " "
" 文件树
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

" remaps

" leader+h/l 左右窗口跳转
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" undotree
nnoremap <leader>u :UndotreeShow<CR>
" 分割出新窗口,显示之前的工作目录
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" 文本搜索 需要安装ripgrep 
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
" shift+j/k 移动区块并格式化
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" 快速查找
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
" 快速查看帮助文档
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
" visual模式下粘贴内容，删除的内容不会影响当前"剪切板"中的内容 
vnoremap <leader>p "_dP
" format code 
nnoremap <C-l> :Neoformat<CR>


" YCM 
" The best part.
" leader+gd 跳转到定义 leader+gr 查找引用
" nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
" nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
" nnoremap <silent> <Leader>gr :YcmCompleter GoToReferences<CR>

" coc.nvim
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" rename
nmap <leader>rr <Plug>(coc-rename)
" search
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" fzf set
let g:fzf_layout = {'window':{'width':0.8,'height':0.8}}
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <leader>gc :GCheckout<CR>
" fzf查找Git文件 ctrl+i 当前工作目录必须是git仓库内
nnoremap <C-p> :GFiles<CR>
" Always enable preview window on the right with 60% width
" let g:fzf_preview_window = 'right:60%'


" git 
" 处理conflict 2为当前分支（左边窗口） 3为待合并分支（右边窗口）
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
" 查看当前分支状态
nmap <leader>gs :G<CR>

" Debugger remaps 
" vim-maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

" vimspector
fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

