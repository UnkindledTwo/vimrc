"Automatically set language to English
set langmenu=en_US
language en
"Automatically open nerdtree when vim starts
au VimEnter * NERDTree Desktop

"Mappings for NERDTree
cnoreabbrev	tree NERDTree
nmap <F1> :NERDTreeToggle<CR>

"Change NERDTree arrow icons
let g:NERDTreeDirArrowExpandable = '|>'
let g:NERDTreeDirArrowCollapsible = 'V' 
									   

" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

"Set colorscheme
colorscheme onedark

"Set lightline colors
let g:lightline = {}
let g:lightline.colorscheme = 'onedark'

"Show commands
set showcmd
"Automatically read the file when it is changed from outside
set autoread
"Set the font
set guifont=InputMono_Medium:h12:W500:cTURKISH:qDRAFT
"Automatically set the working directory
set autochdir
"Show file name etc. in the statusbar
set laststatus=2
"Set encoding for YCM plugin
set encoding=utf-8
"Tab width with a comfy 4
set tabstop=4
"Set nocompatible
set nocompatible
"Show line numbers
set number
"Whopping 256 colors
set t_Co=256
"Allow the use of mouse
set mouse=a
"Auto indent
filetype indent on
set autoindent
"Width when a paragraph is shifted
set shiftwidth=4
"Highlight the line with the cursor
set cursorline
"Disable title, menubar and scrollbars
set guioptions -=T
set guioptions -=m 
set guioptions -=L
"Completions shown for autocomplete
set pumheight=10
"No backup, swap or undo file
set nobackup
set noswapfile
set noundofile
"Set backup, swap and unde file locations
set backupdir=D:\Vim\vim82\Backup
set directory=D:\Vim\vim82\Swap
set undodir=D:\Vim\vim82\Undo
"Don't show --INSERT-- etc. at the bottom
set noshowmode

"clang path
let g:clang_library_path='D:\LLVM\bin'
"Disable YCM preview window
set completeopt-=preview

filetype off

set rtp+=D:\Vim\vim82\bundle\Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
"Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'frazrepo/vim-rainbow'
Plugin 'preservim/nerdtree'
Bundle 'OmniSharp/omnisharp-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'itchyny/lightline.vim'
Plugin 'shinchu/lightline-gruvbox.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'mileszs/ack.vim'

"-----------Auto Brackets-----------------"
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
"


autocmd BufRead,BufNewFile *.xaml :set filetype=xml
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.




if &diffopt !~# 'internal'
	set diffexpr=MyDiff()
endif



function MyDiff()
	let opt = '-a --binary '
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	let arg1 = v:fname_in
	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	let arg1 = substitute(arg1, '!', '\!', 'g')
	let arg2 = v:fname_new
	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	let arg2 = substitute(arg2, '!', '\!', 'g')
	let arg3 = v:fname_out
	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	let arg3 = substitute(arg3, '!', '\!', 'g')
	if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
			if empty(&shellxquote)
				let l:shxq_sav = ''
				set shellxquote&
			endif
			let cmd = '"' . $VIMRUNTIME . '\diff"'
		else
			let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	let cmd = substitute(cmd, '!', '\!', 'g')
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
	if exists('l:shxq_sav')
		let &shellxquote=l:shxq_sav
	endif
endfunction



