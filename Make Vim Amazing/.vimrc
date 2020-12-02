" Version 0.1 By Cells
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
set nu
" 取消自动换行
set nowrap
set smartcase
" 不生成vim.swap文件
set noswapfile
" 设置备份文件夹(需要自己创建该文件夹)
set nobackup
set undodir=~/.vim/undodir
set undofile
" 即时得到结果
set incsearch

" Give more space for displaying messages.
set cmdheight=2

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" enter normal mode and back to previous position
inoremap jj <Esc>`^

call plug#begin('~/.vim/plugged')

" 色彩主题
Plug 'morhetz/gruvbox'
" 快速grep
Plug 'jremmen/vim-ripgrep'
" git相关
Plug 'tpope/vim-fugitive'
" ts着色/格式
Plug 'leafgarland/typescript-vim'
" 查看文档
Plug 'vim-utils/vim-man'
" c++ rtags
Plug 'lyuts/vim-rtags'
" 搜索  Plug 'git@github:ctrlpvim/ctrlp.vim.git'，若安装失败则用下一行语句
" Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
" 补全 Plug 'git@github:ycm-core/YouCompleteMe.git'，若安装失败则用下一行语句
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
" 撤销修改
Plug 'mbbill/undotree'
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" 颜色主题
colorscheme gruvbox                                                             
set background=dark 

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

" ag is fast enough that CtrlP doesn't need to cache "
let g:ctrlp_use_caching = 0

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

" YCM 
" The best part.
" leader+gd 跳转到定义 leader+gr 查找引用
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
nnoremap <silent> <Leader>gr :YcmCompleter GoToReferences<CR>

" fzf查找Git文件 ctrl+i 当前工作目录必须是git仓库内
nnoremap <C-p> :GFiles<CR>
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'
