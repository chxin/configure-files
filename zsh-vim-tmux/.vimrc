" no vi
set nocompatible

" encoding
set encoding=utf-8

" show line number 
set number
set relativenumber

" show commond
set showcmd

" set cindent with tab
set smartindent
" set autoindent
filetype plugin indent on
set tabstop=2
set shiftwidth=2

" no fold when startup
set nofoldenable

" hignlight search content
set hlsearch
set incsearch

" use ~/.vim/.vimrc.bundles to configure Vundle
" :PluginInstall to install plugins
if filereadable(expand("~/.vim/.vimrc.bundles"))
	source ~/.vim/.vimrc.bundles
endif

"" plugin NERDTree
" map <C-n> :NERDTreeToggle<CR>
"" plugin NERDCommenter
" # <leader>c<space> 注释/取消注释
" # <leader>cc // 注释
" # <leader>cm 只用一组符号注释
" # <leader>cA 在行尾添加注释
" # <leader>c$ /* 注释 */
" # <leader>cs /* 块注释 */
" # <leader>cy 注释并复制
" # <leader>ca 切换　// 和 /* */
" # <leader>cu 取消注释
""" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"" plugin Taglist
nmap <silent> <F4> : TagbarToggle<CR>
"" plugin Tasklist
nmap <leader>td <Plug>TaskList
"" plugin ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
"" plugin vim-latex
" :TTemplate to select template
" \ll to compile
filetype plugin on
set shellslash
filetype indent on
let g:tex_flavor='latex'
"" plugin vim-latex-live-preview
let g:livepreview_previewer = 'zathura'
"" plugin vim-instant-markdown
let g:instant_markdown_autostart = 0

" Quickly Run By F5
map <F5> : call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python3 %"
	elseif &filetype == 'html'
		exec "!chrome % &"
	elseif &filetype =='go'
		exec "!go build %<"
		exec "!time go run %"
	elseif &filetype == 'mkd'
		exec "!~/.vim/markdown.pl % > %.html &"
		exec "!chrome %.html &"
	endif
endfunc

" % enhance
filetype plugin on
runtime macros/matchit.vim

" status-line beauty method
set laststatus=2
" set statusline=
" set statusline +=%1*\ %n\ %*            "buffer number
" set statusline +=%5*%{&ff}%*            "file format
" set statusline +=%3*%y%*                "file type
" set statusline +=%4*\ %<%F%*            "full path
" set statusline +=%2*%m%*                "modified flag
" set statusline +=%1*%=%5l%*             "current line
" set statusline +=%2*/%L%*               "total lines
" set statusline +=%1*%4v\ %*             "virtual column number
" set statusline +=%2*0x%04B\ %*          "character under cursor

" configure for filetype
" another method: ~/.vim/after/ftplugin/*.vim  can take effect when special
" file opened
if has("autocmd")
	filetype on 
	autocmd FileType ruby setlocal ts=2 sts=2 sw=2 et
  autocmd FileType c setlocal ts=4 sts=4 sw=4 et
endif
