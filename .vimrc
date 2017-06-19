set nocompatible              " be iMproved, required
filetype off                  " required
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

    "## Markdown
     Plugin 'https://github.com/tpope/vim-markdown'
     Plugin 'https://github.com/nelstrom/vim-markdown-folding'

    "## Themes
     " Plugin 'luochen1990/rainbow'                                  
     Plugin 'https://github.com/lu-ren/SerialExperimentsLain'
     
    "## Writing and note taking
     Plugin 'https://github.com/beloglazov/vim-online-thesaurus'   
     Plugin 'https://github.com/vimwiki/vimwiki'                   

    
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


"# Individual Plugin Options
    "## vim-session
    let g:session_autoload='yes'
    let g:session_autosave='no'
    let g:session_autosave_periodic = 5

    "## Nvim-R
        "Autostart R
        autocmd FileType r if string(g:SendCmdToR) == 
        \"function('SendCmdToR_fake')" | call StartR("R") | endif
        autocmd FileType rmd if string(g:SendCmdToR) == 
        \"function('SendCmdToR_fake')" | call StartR("R") | endif

        "Evaluate line or selection with spacebar
        vmap <Space> <Plug>RDSendSelection
        nmap <Space> <Plug>RDSendLine




"# Colorscheme
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.  If
"you're using tmux version 2.2 or later, you can remove the outermost
"$TMUX check and use tmux's 24-bit color support (see <
"http://sunaku.github.io/tmux-24bit-color.html#usage > for more
"information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 <
  "https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
  "> Based on Vim patch 7.4.1770 (`guicolors` option) <
  "https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
  ">
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
syntax enable
colorscheme SerialExperimentsLain


"# General configuration
    set number   "Show line Numbers
    set hidden   "Allow Hidden Buffers

    "## Autoexpand filepath
    cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%' 

    "## Tabs and spacing
    set tabstop=4       "Size of a hard Tabstop
    set expandtab       "Always use spaces instead of tab characters
    set shiftwidth=4    "Size of an indent
    set softtabstop=4   "Columns per TAB
    
    "## Windowsize on GUI
    if has("gui_running")
        set geometry 500x320 
    endif

    "## Todo -- Config statusline
 
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

    "## Copy to clipboard
    vnoremap  <leader>y  "+y
    nnoremap  <leader>Y  "+yg_
    nnoremap  <leader>y  "+y
    
    "## Paste from clipboard
    nnoremap <leader>p "+p
    nnoremap <leader>P "+P
    vnoremap <leader>p "+p
    vnoremap <leader>P "+P
    
    "## Text Wrapping
    set textwidth=72
    set wrapmargin=2
    set fo+=t
    set fo-=l
    set wrap
    set nolist
    
    "## A colored column to indicate wrapping limit
    set colorcolumn=+6
    highlight ColorColumn ctermbg=lightblue guibg=#556a92
