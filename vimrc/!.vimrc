" Pathogen hookup
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin on



" colorscheme vividchalk 
colorscheme zenburn 
syntax on

"
" ActioScript settings
"
" Use .as for ActionScript files, not Atlas files
au BufNewFile,BufRead *.as set filetype=actionscript
" Put these in an autocmd group, so that we can delete them easily.
augroup vimrc
au!
autocmd FileType actionscript setlocal sw=4 sts=4 et
autocmd FileType python       setlocal sw=4 sts=4 et 
autocmd FileType ruby         setlocal sw=2 sts=2 et
augroup END
"
" end of ActionScript support
"

"set exrc " Enables the reading of .vimrc, .exrc and .gvimrc in the current directory. 
"set secure


set guifont=Bitstream\ Vera\ Sans\ Mono:h14	" My font!
set number									" Show line numbers
set cursorline								" Highlight current line
set lines=999 columns=999					" Maximize window size
set ignorecase								" Search is case insensitive


set incsearch         " find the next match as we type the search
set hlsearch          " hilight searches by default
set nowrap            " by default, dont wrap lines (see <leader>w)
set showmatch         " briefly jump to matching }] when typing
set nostartofline     " don't jump to start of line as a side effect (i.e. <<)


set laststatus=2      " always display status line even if only one window is visible.
set updatetime=1000   " reduce updatetime so current tag in taglist is highlighted faster
set autoread          " suppress warnings when git,etc. changes files on disk.
set nrformats=alpha,hex " C-A/C-X works on dec, hex, and chars (not octal so no leading 0 ambiguity)


set wildmode=list:longest   " make cmdline tab completion similar to bash
set wildmenu                " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ " stuff to ignore when tab completing


set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=1000               " store lots of :cmdline history


set hidden          " allow buffers to go into the background without needing to save


set visualbell      " don't beep constantly, it's annoying.
set t_vb=           " and don't flash the screen either (terminal anyway...
set guioptions-=T   " hide gvim's toolbar by default


" search for a tags file recursively from cwd to /
set tags=.tags,tags;/


" Store swapfiles in a single directory.
set directory=~/.vim/swap,~/tmp,/var/tmp/,tmp


"set smarttab          " use shiftwidth when hitting tab instead of sts (?)
"set autoindent        " try to put the right amount of space at the beginning of a new line
set tabstop=4		  " tab is 4 spaces
set noexpandtab       " use tabs

" toggle wrap
nmap <leader>w :set wrap<CR>
nmap <leader>W :set nowrap<CR>



"
" Bundle/Plugin configurations
"

" BUNDLE: git://github.com/scrooloose/nerdtree.git
source $HOME/.vim/vimrc/nerdtree.vimrc 

" BUNDLE: git://github.com/scrooloose/nerdcommenter.git
source $HOME/.vim/vimrc/nerdcommenter.vimrc 

" BUNDLE: git://github.com/sjbach/lusty.git
source $HOME/.vim/vimrc/lusty.vimrc 

source $HOME/.vim/vimrc/fuzzyfinder.vimrc 

" BUNDLE: git://github.com/rson/vim-conque.git
source $HOME/.vim/vimrc/conque.vimrc 

"
" VIM extensions
"
source $HOME/.vim/vimrc/file.vimrc 
source $HOME/.vim/vimrc/windows.vimrc 
source $HOME/.vim/vimrc/search.vimrc 
source $HOME/.vim/vimrc/statusline.vimrc 
source $HOME/.vim/vimrc/visual.vimrc 

"
" Project Specific
"
source $HOME/.vim/vimrc/_typepad.vimrc 


