set nocompatible              " be iMproved, required
filetype off                  " required
syntax enable

"Windows specific options
if has ('win32') || has('win64')
    let &shell='cmd.exe'
    let g:loaded_youcompleteme = 0
endif

"# Plugin installation with Vundle
    "## set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    "## let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    "## Faster editing and navigation
    Plugin 'https://github.com/tpope/vim-unimpaired'              
    Plugin 'tpope/vim-surround'                                   
    Plugin 'tpope/vim-repeat'                                     
    Plugin 'https://github.com/tpope/vim-commentary'              
    Plugin 'guns/vim-sexp'                                        
    Plugin 'tpope/vim-sexp-mappings-for-regular-people'
    Plugin 'https://github.com/xolox/vim-session'                 
    Plugin 'https://github.com/xolox/vim-misc'                    

    "## Clojure
    Plugin 'tpope/vim-fireplace'                                  
    Plugin 'guns/vim-clojure-static'                              
    Plugin 'guns/vim-clojure-highlight'                           

    "## R
    Plugin 'https://github.com/jalvesaq/Nvim-R'                   
    Plugin 'https://github.com/jalvesaq/colorout'                 

    "## LaTeX
    Plugin 'https://github.com/vim-latex/vim-latex'
	Plugin 'https://github.com/donRaphaco/neotex'

    "## Markdown
    Plugin 'https://github.com/tpope/vim-markdown'
    Plugin 'https://github.com/nelstrom/vim-markdown-folding'
    Plugin 'https://github.com/JamshedVesuna/vim-markdown-preview'
    " Plugin 'https://github.com/suan/vim-instant-markdown'

    "## Python
    Plugin 'https://github.com/python-mode/python-mode'

    "## File Conversion
    Plugin 'https://github.com/vim-pandoc/vim-pandoc'
    Plugin 'https://github.com/vim-pandoc/vim-pandoc-syntax'

    "## Themes
    Plugin 'luochen1990/rainbow'                                  
    Plugin 'https://github.com/lu-ren/SerialExperimentsLain'

    "##Status Line
    Plugin 'https://github.com/itchyny/lightline.vim'
     
    "## Writing and note taking
    Plugin 'https://github.com/beloglazov/vim-online-thesaurus'   
    Plugin 'https://github.com/vimwiki/vimwiki'                   

    "## Multiple languages on demand
    Plugin 'https://github.com/sheerun/vim-polyglot'

    "## Highlighting when overlength
    Plugin 'https://github.com/tjdevries/overlength.vim'

    "## Autocomplete
    Plugin 'https://github.com/Valloric/YouCompleteMe'
    
     "  All of your Plugins must be added before the following line
     call vundle#end()           " required
     filetype plugin indent on
     "  To ignore plugin indent changes, instead use:
     " filetype plugin on
     " 
     " Brief help
     " :PluginList       - lists configured plugins
     " :PluginInstall    - installs plugins; append `!` to update or 
     " just
     " :PluginUpdate
     " :PluginSearch foo - searches for foo; append `!` to refresh local
     " cache
     " :PluginClean      - confirms removal of unused plugins;
     " append `!` to  auto-approve removal
     "
     " see :h vundle for more details or wiki for FAQ
     " Put your non-Plugin stuff after this line
 "


"# Individual Plugin Options
    
    "## vim-polyglot
    let g:polyglot_disabled = ['python']

    "## vim-session
    let g:session_autoload='no'
    let g:session_autosave='no'
    " let g:session_autosave_periodic = 5
    " let g:session_default_to_last = 1

    "## Nvim-R
        "Autostart R
        autocmd FileType r if string(g:SendCmdToR) == 
        \"function('SendCmdToR_fake')" | call StartR("R") | endif
        autocmd FileType rmd if string(g:SendCmdToR) == 
        \"function('SendCmdToR_fake')" | call StartR("R") | endif

        "Evaluate line or selection with spacebar
        vmap <Space> <Plug>RDSendSelection
        nmap <Space> <Plug>RDSendLine

        " Use Ctrl+Space to do omnicompletion:
        if has("gui_running")
            inoremap <C-Space> <C-x><C-o>
        else
            inoremap <Nul> <C-x><C-o>
        endif

    "## Markdown-Preview
    let vim_markdown_preview_toggle=1
    let vim_markdown_preview_temp_file=0
    let vim_markdown_preview_browser='firefox'

    "## HighlightOverlength
    let overlength_default_overlength = 74 
    let overlength_default_to_textwidth = 0
    call overlength#set_overlength('markdown', 0)
    call overlength#set_overlength('wiki', 0)
    autocmd BufRead,BufEnter,BufNewFile
                \ *.wiki,*.md call overlength#disable()

    "## Vim-Latex
    set grepprg=grep\ -nH\ $
    let g:tex_flavor='latex'

    "## PythonMode
    let g:pymode_python = 'python3'
    let g:pymode_options_colorcolumn = 0
    let g:pymode_rope_completion = 0
    let g:pymode_rope_complete_on_dot = 0
    let g:pymode_syntax_slow_sync = 0

    "## Sage settings
     autocmd BufRead,BufNewFile *.sage,*.pyx,*.spyx set filetype=python
     autocmd FileType python set makeprg=sage\ -b\ &&\ sage\ -t\ %

    "## Wiki
        "### Wiki for the desiderata book
        let wiki_desiderata = {}
        let wiki_desiderata.path ='~/Documents/Writing/Desiderata/'
        let wiki_desiderata.path_html ='~/Documents/Writing/Desiderata/'
                    \ + 'desiderata_wiki_html'

        "### Wiki for the OpenHuman project
        let wiki_openhuman = {}
        let wiki_openhuman.path='~/Documents/Writing/OpenHuman'
        let wiki_openhuman.path_html='~/Documents/Writing/OpenHuman/'
                    \ + 'OpenHuman_wiki_html'

    let g:vimwiki_list = [wiki_desiderata, wiki_openhuman] 

    "## YCM
    let g:ycm_server_python_interpreter = '/usr/bin/python'

    "## TODO - Lightline

    "## Rainbow
    let g:rainbow_conf = {
	\	'guifgs': ['#759fad','#66789C', '#02868B', '#C0B1C2'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan',
    \'lightmagenta'],
    \   'operators': '',
	\	'parentheses': ['start=/(/ end=/)/ fold', 
    \'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 
    \'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs':['#C0B1C2','#556a92', '#876bd6', '#4499c7', 
    \'#759fad'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 
    \'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold',
    \'start=/(/ end=/)/ containedin=vimFuncBody',
    \'start=/\[/ end=/\]/ containedin=vimFuncBody',
    \'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
    \       'html': {
    \			'parentheses': ['start=/\v\<((area|base|br|col|' +
    \           'embed|hr|img|input|keygen|link|menuitem|meta|param|'+
    \           'source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)'+
    \           '(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'['+
    \           '^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ '+
    \           'end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

    let g:rainbow_active = 1


"# Colorscheme
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.  If
"you're using tmux version 2.2 or later, you can remove the outermost
"$TMUX check and use tmux's 24-bit color support (see <
"http://sunaku.github.io/tmux-24bit-color.html#usage > for more
"information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/
    "2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 <
  "https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac1
  "75162
  "> Based on Vim patch 7.4.1770 (`guicolors` option) <
  "https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65
  "b25cd
  ">
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
colorscheme SerialExperimentsLain

"# General configuration
    set number   "Show line Numbers
    set hidden   "Allow Hidden Buffers
    set updatetime=1000 "Writes swap file to disk if nothing is typed

    "## Autoexpand filepath
    cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%' 

    "## Tabs and spacing
    set tabstop=4       "Size of a hard Tabstop
    set expandtab       "Always use spaces instead of tab characters
    set shiftwidth=4    "Size of an indent
    set softtabstop=4   "Columns per TAB
    
    "## To improve -- Windowsize on GUI
     call rpcnotify(0, 'Gui', 'WindowMaximized', 1)

    "## TODO -- Config statusline
    set laststatus=2
    "
    "## Text Wrapping and formatting
    set textwidth=72
    set wrapmargin=0
    set fo+=t
    set fo-=l
    set fo-=o
    set fo-=j
    set wrap
    set nolist
    autocmd BufRead,BufEnter,BufNewFile *.md,*.wiki set textwidth=0

    " "## A colored column to indicate wrapping limit
    " set colorcolumn=+6
    " highlight ColorColumn ctermbg=lightblue guibg=#556a92
 
"# Key Mappings
    "## Beginning and and of Line
    nnoremap ç ^
    vnoremap ç ^
    onoremap ç ^
    nnoremap Ç $
    vnoremap Ç $
    onoremap Ç $

    "## Unmapping arrows in normal and insert mode
    noremap <Up> <nop>
    noremap <Down> <nop>
    noremap <Left> <nop>
    noremap <Right> <nop>

    inoremap <Up> <nop>
    inoremap <Down> <nop>
    inoremap <Left> <nop>
    inoremap <Right> <nop>

    "## Makes navigation easier in wrapped lines
    noremap j gj
    noremap k gk
    noremap gj j 
    noremap gk k

    "## Disable mouse
    set mouse=

    "## Toggle Highlighting when beyond textwidth columns
    nnoremap <f4> :call overlength#toggle()<CR>

    "## Copy to clipboard
    vnoremap  <leader>y  "+y
    nnoremap  <leader>Y  "+yg_
    nnoremap  <leader>y  "+y
    
    "## Paste from clipboard
    nnoremap <leader>p "+p
    nnoremap <leader>P "+P
    vnoremap <leader>p "+p
    vnoremap <leader>P "+P

    "## Clear Search Highlighting
    nnoremap <CR> :noh<CR><CR>

    "## Toggle paste
    " set pastetoggle=<f5>
    
    "Fix marks for Brazilian keyboard
    nnoremap ' ` 

"# Filtype options
    "## C
    autocmd Filetype c nnoremap <F9> :w<CR>:make %<<CR>:!./%<<CR>
