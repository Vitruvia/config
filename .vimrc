
set nocompatible              " be iMproved, required
filetype off                  " required

"Plugins
    "set the runtime path to include Vundle and initialize
     set rtp+=~/.config/nvim/bundle/Vundle.vim
     call vundle#begin()
     "  let Vundle manage Vundle, required
     Plugin 'VundleVim/Vundle.vim'
         "
     "##Faster editing and navigation
     Plugin 'https://github.com/tpope/vim-unimpaired'              "Complements pairings of mappings
     Plugin 'tpope/vim-surround'                                   "Quicker placement of parenthesis and others
     Plugin 'tpope/vim-repeat'                                     "Allows '.' to repeat plugin commands as well as default vim commands
     Plugin 'https://github.com/tpope/vim-commentary'              "For commenting
     Plugin 'guns/vim-sexp'                                        "Quicker navigation of surrounding elements
     Plugin 'tpope/vim-sexp-mappings-for-regular-people'
     Plugin 'https://github.com/xolox/vim-session'                 "Makes it easier to save a session
     Plugin 'https://github.com/xolox/vim-misc'                    "Necessary with vim-sessions
     "##Clojure
     Plugin 'tpope/vim-fireplace'                                  "Clojure Repl
     Plugin 'guns/vim-clojure-static'                              "Syntax highlighting, identation, autocompletion
     Plugin 'guns/vim-clojure-highlight'                           "Extends highlighting
     " ##R
     Plugin 'https://github.com/jalvesaq/Nvim-R'                   "Integrates vim with R
     Plugin 'https://github.com/jalvesaq/colorout'                 "Colorizes R output, works only on linux and OSX
    "##Markdown
     Plugin 'https://github.com/tpope/vim-markdown'
     Plugin 'https://github.com/nelstrom/vim-markdown-folding'
    "##Themes
     Plugin 'luochen1990/rainbow'                                  "Makes parenthesis look better
     Plugin 'https://github.com/lu-ren/SerialExperimentsLain'
    "##Writing and note taking
     Plugin 'https://github.com/beloglazov/vim-online-thesaurus'   "Searches word on a thesaurus
     Plugin 'https://github.com/vimwiki/vimwiki'                   "Enables a wiki on vim

    
     "  All of your Plugins must be added before the following line
     call vundle#end()           " required
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


"General config
    set number   "Show line Numbers
    set hidden   "Allow Hidden Buffers

    "## Autoexpand filepath
    cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%' 

    "##Tabs and spacing
    set tabstop=4       "Size of a hard Tabstop
    set expandtab       "Always use spaces instead of tab characters
    set shiftwidth=4    "Size of an indent
    set softtabstop=4   "Columns per TAB

"vim-session options
let g:session_autoload='yes'
let g:session_autosave='no'
let g:session_autosave_periodic = 5

"Key Mappings
nnoremap ç ^
vnoremap ç ^
onoremap ç ^
nnoremap Ç $
vnoremap Ç $
onoremap Ç $


"Nvim-R settings

    "Autostart R
    autocmd FileType r if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
    autocmd FileType rmd if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
    "Evaluate line or selection with spacebar
    vmap <Space> <Plug>RDSendSelection
    nmap <Space> <Plug>RDSendLine



"Colorscheme
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
syntax enable
colorscheme SerialExperimentsLain

" Rainbow Parenthesis
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
