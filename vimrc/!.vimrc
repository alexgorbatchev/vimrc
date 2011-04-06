" Pathogen hookup
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin on

if &t_Co >= 256 || has("gui_running")
   colorscheme blackboard
endif

" switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
   syntax on
endif

set go+=c 													" disable visual dialogs
set guifont=Bitstream\ Vera\ Sans\ Mono:h14 				" My font!
set number 													" Show line numbers
set cursorline 												" Highlight current line
set lines=999 columns=999 									" Maximize window size
set ignorecase 												" Search is case insensitive
set list listchars=tab:»\ ,eol:¶
set incsearch 												" find the next match as we type the search
set hlsearch 												" hilight searches by default
set nowrap 													" by default, dont wrap lines (see <leader>w)
set showmatch 												" briefly jump to matching }] when typing
"set nostartofline 											" don't jump to start of line as a side effect (i.e. <<)
set laststatus=2 											" always display status line even if only one window is visible.
set updatetime=1000 										" reduce updatetime so current tag in taglist is highlighted faster
set autoread 												" suppress warnings when git,etc. changes files on disk.
set nrformats=alpha,hex 									" C-A/C-X works on dec, hex, and chars (not octal so no leading 0 ambiguity)
set undolevels=1000											" use many muchos levels of undo
set wildmode=list:longest 									" make cmdline tab completion similar to bash
set wildmenu												" enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,*.swf,*.fla,*.jpg,*.png,*.jar	" stuff to ignore when tab completing
set backspace=indent,eol,start								" allow backspacing over everything in insert mode
set history=1000											" store lots of :cmdline history
set nobackup
set noswapfile
set nohidden												" allow buffers to go into the background without needing to save
set visualbell 												" don't beep constantly, it's annoying.
set t_vb= 													" and don't flash the screen either (terminal anyway...)
set guioptions-=T 											" hide gvim's toolbar by default
set tags=.tags,tags;/ 										" search for a tags file recursively from cwd to /
set directory=~/.vim/swap,~/tmp,/var/tmp/,tmp 				" Store swapfiles in a single directory.
set nofoldenable 											" I don't like folding...

"set smarttab          " use shiftwidth when hitting tab instead of sts (?)
"set autoindent        " try to put the right amount of space at the beginning of a new line
set smartindent
set shiftwidth=4
set tabstop=4		  " tab is 4 spaces
set noexpandtab       " use tabs

source $HOME/.vim/vimrc/nerdtree.vimrc 
source $HOME/.vim/vimrc/nerdcommenter.vimrc 
source $HOME/.vim/vimrc/fuzzyfinder.vimrc 
source $HOME/.vim/vimrc/conque.vimrc 
source $HOME/.vim/vimrc/snipmate.vimrc 

"
" VIM extensions
"
source $HOME/.vim/vimrc/keyboard.vimrc 
source $HOME/.vim/vimrc/file.vimrc 
source $HOME/.vim/vimrc/windows.vimrc 
source $HOME/.vim/vimrc/statusline.vimrc 


"
" Project Specific
"
source $HOME/.vim/vimrc/_typepad.vimrc 


