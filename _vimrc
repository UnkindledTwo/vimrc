"Automatically set language to English
set langmenu=en_US
language en

"Automatically open nerdtree when vim starts
"au VimEnter * NERDTree Desktop

au VimEnter * WToggleClean 		"Window tweaks
au VimEnter * WCenter 90 		"when gVim starts.
au VimEnter * WSetAlpha 250 	"gVim windows only

"Mappings for NERDTree
cnoreabbrev	tree NERDTree
nmap <F1> :NERDTreeToggle<CR>
nmap <F2> :WCenter 90<CR>
nmap <F3> :silent !start powershell<CR>

"Change NERDTree arrow icons
"let g:NERDTreeDirArrowExpandable = '|>'
"let g:NERDTreeDirArrowCollapsible = 'V' 
									   
let g:ycm_global_ycm_extra_conf = 'D:\Vim\_ycm_extra_conf.py'

" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

"Set colorscheme
colorscheme gruvbox
let g:airline_theme='base16_gruvbox_dark_hard'	"Set airline theme.
let g:airline#extensions#branch#enabled = 0 	"Disable git branches.
let g:airline_powerline_fonts = 1				"Enable powerline fonts.
let g:airline#extensions#hunks#enabled = 0		"Disable hunks.
let g:airline_skip_empty_sections = 1			"Skip empty parts.
let g:airline#extensions#whitespace#enabled = 0	"Don't show white spaces in the airline.

let g:rainbow_active = 1
au FileType c,cpp,objc,objcpp call rainbow#load()	"Load rainbow brackets

set history=1000 			"Increase undo history

set foldmethod=indent 		"Enable code folding
set foldlevel=99			"Enable code folding

"Set a key for folding
nnoremap <space> za	

" Disable blinking:
set guicursor+=a:blinkon0

" Remove previous setting:
"set guicursor-=a:blinkon0

" Restore default setting:
"set guicursor&

set showcmd 		"Show commands

set autoread 		"Automatically read the file when it is changed from outside

set guifont=InputMono_Medium:h12:W500:cTURKISH:qDRAFT "Set the font

set autochdir 		"Automatically set the working directory

set laststatus=2 	"Show file name etc. in the statusbar

set encoding=utf-8 	"Set encoding for YCM plugin

set tabstop=4 		"Tab width with a comfy 4

set nocompatible 	"Set commands incompatible with vi

set number 			"Show line numbers

set t_Co=256 		"Whopping 256 colors

set mouse=a			"Allow the use of mouse

filetype indent on	"Auto indent

set autoindent

set shiftwidth=4	"Width when a paragraph is shifted

set cursorline		"Highlight the line with the cursor

"Disable title, menubar and scrollbars
if has('gui_running')
	set guioptions -=T
	set guioptions -=m 
	set guioptions -=L
endif

set pumheight=10	"Completions shown for autocomplete

"No backup, swap or undo file
set nobackup
set noswapfile
set noundofile

"Set backup, swap and unde file locations
set backupdir=D:\Vim\vim82\Backup
set directory=D:\Vim\vim82\Swap
set undodir=D:\Vim\vim82\Undo

set noshowmode	"Don't show --INSERT-- etc. at the bottom

let g:clang_library_path='D:\LLVM\bin'	"clang path
set completeopt-=preview				"Disable YCM preview window

"-----------Auto Brackets-----------------"
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
"

"Python venv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

filetype off

set rtp+=D:\Vim\vim82\bundle\Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
"Plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kkoenig/wimproved.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'frazrepo/vim-rainbow'
Plugin 'preservim/nerdtree'
Bundle 'OmniSharp/omnisharp-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'sheerun/vim-polyglot'


autocmd BufRead,BufNewFile *.xaml :set filetype=xml
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'tpope/vim-fugitive'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
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



