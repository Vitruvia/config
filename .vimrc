
set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
 set rtp+=~/.config/nvim/bundle/Vundle.vim
 call vundle#begin()
 "  alternatively, pass a path where Vundle should install plugins
 " call vundle#begin('~/some/path/here
 "
 "  let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'
 
 "  The following are examples of different formats supported.
 "  Keep Plugin commands between vundle#begin/end.
 "  plugin on GitHub repo
 " Plugin 'tpope/vim-fugitive'
 "  plugin from http://vim-scripts.org/vim/scripts.html
 "  Plugin 'L9'
 "  Git plugin not hosted on GitHub
 " Plugin 'git://git.wincent.com/command-t.git'
 "  git repos on your local machine (i.e. when working on your own plugin)
 " Plugin 'file:///home/gmarik/path/to/plugin'
 "  The sparkup vim script is in a subdirectory of this repo called vim.
 "  Pass the path to set the runtimepath properly.
 " Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
 "  Install L9 and avoid a Naming conflict if you've already installed a
 "  different version somewhere else.
 "  Plugin 'ascenator/L9', {'name': 'newL9'}
 "
 Plugin 'tpope/vim-fireplace'
 Plugin 'luochen1990/rainbow'
 Plugin 'guns/vim-clojure-static'
 Plugin 'guns/vim-sexp'
 Plugin 'tpope/vim-sexp-mappings-for-regular-people'
 Plugin 'tpope/vim-repeat'
 Plugin 'tpope/vim-surround'
 Plugin 'guns/vim-clojure-highlight'
let g:rainbow_active = 1
 "  All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on
 "  To ignore plugin indent changes, instead use:
 " filetype plugin on
 " 
 " Brief help
 " :PluginList       - lists configured plugins
 " :PluginInstall    - installs plugins; append `!` to update or just
 " :PluginUpdate
 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 " :PluginClean      - confirms removal of unused plugins; append `!` to
 " auto-approve removal
 "
 " see :h vundle for more details or wiki for FAQ
 " Put your non-Plugin stuff after this line
 "


let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}


 
let g:rainbow_active = 1
