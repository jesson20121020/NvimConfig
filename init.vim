""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let mapleader = ","      " 定义<leader>键
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set cmdheight=2          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set laststatus=1         " 总是显示状态栏
set number               " 开启行号显示
set cursorline           " 高亮显示当前行
set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
"set bin noeol            " 默认文末不添加新行
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif " 打开文件自动定位到最后编辑的位置
set guifont=CaskaydiaCove\ NF:h13


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set smarttab             " 在行和段开始处使用制表符
set nowrap               " 禁止折行
set backspace=2          " 使用回车键正常处理indent,eol,start等
set sidescroll=10        " 设置向右滚动字符数
"set nofoldenable         " 禁用折叠代码
set list
set listchars=tab:>-,trail:-
hi SpecialKey ctermfg=66 guifg=#000000 guibg=#000000
set termguicolors


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu             " vim自身命名行模式智能补全
set completeopt+=preview " 补全时不显示窗口，只显示补全列表
set completeopt+=longest,menu "让Vim的补全菜单行为与一般IDE一致
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"离开插入模式后自动关闭预览窗口


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 分屏窗口移动
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 复制粘贴
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard+=unnamedplus
lua << EOF
vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf"
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf"
  },
  cache_enable = 0,
}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set background=dark
" let g:onedark_termcolors=256
" colorscheme onedark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 折叠设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent
set foldlevel=99
nnoremap <space> za


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件列表
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.nvim/plugin')
" 搜索插件
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'AckslD/nvim-neoclip.lua'

" 状态栏
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'SmiteshP/nvim-navic'

" 主题
Plug 'Mofiqul/vscode.nvim'
Plug 'norcalli/nvim-colorizer.lua' " 颜色高亮
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " 代码高亮

" 通知
Plug 'rcarriga/nvim-notify'

" 文件/tab栏
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'kyazdani42/nvim-tree.lua'

" 启动时间
Plug 'dstein64/vim-startuptime'

" git/vsc
Plug 'lewis6991/gitsigns.nvim'

" 括号自动补全、检查
Plug 'windwp/nvim-autopairs'

" todo
Plug 'folke/todo-comments.nvim'

" 代码补全
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'onsails/lspkind-nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'j-hui/fidget.nvim'
Plug 'tami5/lspsaga.nvim'
Plug 'stevearc/aerial.nvim'


call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 加载lua插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require("configure.plugins.lualine")
require("configure.plugins.telescope")
require("configure.plugins.vscode")
require("configure.plugins.nvim-notify")
require("configure.plugins.bufferline")
require("configure.plugins.nvim-tree")
require("configure.plugins.nvim-treesitter")
require("configure.plugins.gitsigns")
require("configure.plugins.nvim-colorizer")
require("configure.plugins.nvim-autopairs")
require("configure.plugins.todo-comments")
require("configure.plugins.nvim-lsp-installer")
require("configure.plugins.lspkind-nvim")
require("configure.plugins.nvim-cmp")
require("configure.plugins.lsp_signature")
require("configure.plugins.fidget")
require("configure.plugins.lspsaga")
require("configure.plugins.aerial")
EOF


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 全局快捷键设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F2> <cmd>NvimTreeToggle<cr>
nnoremap <S-P> <cmd>Telescope<cr>
nnoremap <C-P> <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<cr>
nnoremap <C-F> <cmd>lua require('telescope.builtin').grep_string(require('telescope.themes').get_dropdown({}))<cr>
nnoremap <C-Y> <cmd>lua require('telescope').extensions.aerial.aerial(require('telescope.themes').get_dropdown({}))<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fd <cmd>TodoTelescope<cr>
nnoremap gr <cmd>Lspsaga rename<cr>
nnoremap gx <cmd>Lspsaga code_action<cr>
nnoremap K  <cmd>Lspsaga hover_doc<cr>
nnoremap gd <cmd>Lspsaga show_line_diagnostics<cr>
nnoremap gj <cmd>Lspsaga diagnostic_jump_next<cr>
nnoremap gk <cmd>Lspsaga diagnostic_jump_prev<cr>
nnoremap gp <cmd>Lspsaga preview_definition<cr>
