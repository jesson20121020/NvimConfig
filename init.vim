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
set clipboard+=unnamed
"set bin noeol            " 默认文末不添加新行
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif " 打开文件自动定位到最后编辑的位置


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
vmap <leader><leader>y "+y                  " 复制当前选中到系统剪切板 
nnoremap <leader><leader>p "+p              " 将系统剪切板内容粘贴到vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
let g:onedark_termcolors=256
colorscheme onedark


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
Plug 'jiangmiao/auto-pairs'
Plug 'voldikss/vim-floaterm'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/LeaderF'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular' "必要插件，安装在vim-markdown前面
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'ferrine/md-img-paste.vim'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-surround'
Plug 'jesson20121020/leetcode.vim'
Plug 'djoshea/vim-autoread'
Plug 'Eric-Song-Nop/vim-glslx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-scripts/vcscommand.vim'
Plug 'puremourning/vimspector'
" Plug 'OmniSharp/omnisharp-vim'
call plug#end()

let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-marketplace']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline 插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" change error symbol: >
let airline#extensions#coc#error_symbol = '×:'
"change warning symbol: >
let airline#extensions#coc#warning_symbol = ':'
" change error format: >
let airline#extensions#coc#stl_format_err = '%×e(#%fe)]}'
" change warning format: >
let airline#extensions#coc#stl_format_warn = '%{[%w(#%fw)]}'
let airline#extensions#tabline#enabled = 1
" support coc-git
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#use_vcscommand = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#branch#format = 2
let g:airline#extensions#hunks#coc_git = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  LeaderF 插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
let g:Lf_UseCache = 0
let g:Lf_PreviewInPopup = 1
let g:Lf_WindowPosition = 'popup'
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_UseVersionControlTool = 0
nnoremap <C-y> :LeaderfFunction<Cr>
noremap <C-B> :<C-U><C-R>=printf("Leaderf rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf rg -e %s ", expand("<cword>"))<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  coc 插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menuone,noselect
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-p> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <leader>gg <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" use f8 toggle file explorer
nmap <F2> :CocCommand explorer<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  coc-git 插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  coc-translator 插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" popup
nmap <Leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  markdown 插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vmt_auto_update_on_save = 0 "取消储存时自动更新目录
let g:mkdp_auto_close = 0
" 设置默认储存文件夹。这里表示储存在当前文档所在文件夹下的'pic'文件夹下，相当于 ./pic/
let g:mdip_imgdir = 'pic' 
"设置默认图片名称。当图片名称没有给出时，使用默认图片名称
let g:mdip_imgname = 'image'
"设置快捷键，个人喜欢 Ctrl+p 的方式，比较直观
autocmd FileType markdown nnoremap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  asynctasks 插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:asyncrun_open = 15
let g:asynctasks_term_pos = 'quickfix'
function! s:lf_task_source(...)
	let rows = asynctasks#source(&columns * 48 / 100)
	let source = []
	for row in rows
		let name = row[0]
		let source += [name . '  ' . row[1] . '  : ' . row[2]]
	endfor
	return source
endfunction


function! s:lf_task_accept(line, arg)
	let pos = stridx(a:line, '<')
	if pos < 0
		return
	endif
	let name = strpart(a:line, 0, pos)
	let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
	if name != ''
		exec "AsyncTask " . name
	endif
endfunction

function! s:lf_task_digest(line, mode)
	let pos = stridx(a:line, '<')
	if pos < 0
		return [a:line, 0]
	endif
	let name = strpart(a:line, 0, pos)
	return [name, 0]
endfunction

function! s:lf_win_init(...)
	setlocal nonumber
	setlocal nowrap
endfunction


let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})
let g:Lf_Extensions.task = {
			\ 'source': string(function('s:lf_task_source'))[10:-3],
			\ 'accept': string(function('s:lf_task_accept'))[10:-3],
			\ 'get_digest': string(function('s:lf_task_digest'))[10:-3],
			\ 'highlights_def': {
			\     'Lf_hl_funcScope': '^\S\+',
			\     'Lf_hl_funcDirname': '^\S\+\s*\zs<.*>\ze\s*:',
			\ },
		\ }

nmap <S-t> :Leaderf --nowrap task<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Leetcode 插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:leetcode_browser = 'edge'
let g:leetcode_china = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Format 指令设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:custom_format()
	execute ":Format"
	if (&ft == "python")
		execute "set tabstop=4"
		execute "set noexpandtab"
		execute "%retab!"
	endif
endfunction
nmap <F4> :call <SID>custom_format()<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Ctrl-Ship-P 指令设置, 读取所有的Command并显示在Leadf窗口中
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:lf_commands_source(...)
	let rows = split(execute(":command"), "[\n\r]")
	let source = []
	for row in rows[1:]
		let line = split(row, "")
		let name = line[0]
		let arg = line[1]
		if name == '!'
			let name = line[1]
			let arg = line[2]
		endif
		if arg == '0' || arg == '*' || arg == '?'
			let source += ['גּ' . ' '. name]
		endif
	endfor
	return source
endfunction


function! s:lf_commands_accept(line, arg)
	execute(":". split(a:line, '')[-1])
endfunction


let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})
let g:Lf_Extensions.commands = {
			\ 'source': string(function('s:lf_commands_source'))[10:-3],
			\ 'accept': string(function('s:lf_commands_accept'))[10:-3],
			\ 'get_digest': string(function('s:lf_task_digest'))[10:-3]
		\ }

nmap <S-p> :Leaderf --nowrap commands<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimspector 插件设置, 快捷键说明
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =========================================================================================================================
" |      _Key_      |                _Mapping_                |                         _Function_                        |
" =========================================================================================================================
" | 'F5'            | '<Plug>VimspectorContinue'              | When debugging, continue. Otherwise start debugging.      |
" -------------------------------------------------------------------------------------------------------------------------
" | 'F6'            | '<Plug>VimspectorStop/Reset'            | Stop and reset debugging.                                 |
" -------------------------------------------------------------------------------------------------------------------------
" | 'F9'            | '<Plug>VimspectorToggleBreakpoint'      | Toggle line breakpoint on the current line.               |
" -------------------------------------------------------------------------------------------------------------------------
" | 'F10'           | '<Plug>VimspectorStepOver'              | Step Over                                                 |
" -------------------------------------------------------------------------------------------------------------------------
" | 'F11'           | '<Plug>VimspectorStepInto'              | Step Into                                                 |
" -------------------------------------------------------------------------------------------------------------------------
" | 'F12'           | '<Plug>VimspectorStepOut'               | Step out of current function scope                        |
" -------------------------------------------------------------------------------------------------------------------------
nmap <F5> <Plug>VimspectorContinue<CR>
nmap <F6> :call vimspector#Stop() \| call vimspector#Reset()<CR>
nmap <F9> <Plug>VimspectorToggleBreakpoint<CR>
nmap <F10> <Plug>VimspectorStepOver<CR>
nmap <F11> <Plug>VimspectorStepInto<CR>
nmap <F12> <Plug>VimspectorStepOut<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ominisharp-vim 插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:OmniSharp_translate_cygwin_wsl = 1
" let g:OmniSharp_popup_options = {
" \ 'winblend': 30,
" \ 'winhl': 'Normal:Normal'
" \}
" augroup omnisharp_commands
"   autocmd!
" 
"   " Show type information automatically when the cursor stops moving.
"   " Note that the type is echoed to the Vim command line, and will overwrite
"   " any other messages in this space including e.g. ALE linting messages.
"   autocmd CursorHold *.cs OmniSharpTypeLookup
" 
"   " The following commands are contextual, based on the cursor position.
"   autocmd FileType cs nmap <silent> <buffer> <leader>gg <Plug>(omnisharp_go_to_definition)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
"   autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
"   autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
" 
"   " Navigate up and down by method/property/field
"   autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
"   autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
"   " Find all code errors/warnings for the current solution and populate the quickfix window
"   autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
"   " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
"   autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
"   " Repeat the last code action performed (does not use a selector)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
"   autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
" 
"   autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)
" 
"   autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)
" 
"   autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
" augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义命令
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=0 OpenFolder execute("!explorer.exe /e,/select,`wslpath -w %`")

" Python 缩进设置
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=400 |
    \ set noexpandtab |
    \ set fileformat=unix |

" glsl 设置
autocmd! BufNewFile,BufRead *.vs,*.fs,*.ps set ft=glslx
