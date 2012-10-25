""""""""""""""""""""""""""""""""""""
" vundle hookup
"
filetype off 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
source $HOME/.vim/vimrc/bundles.vimrc 
filetype plugin indent on
""""""""""""""""""""""""""""""""""""

set t_Co=256

if has("gui_running")
endif

if has("gui_macvim")
	" set go+=c 												" disable visual dialogs
	set guifont=Bitstream\ Vera\ Sans\ Mono:h10 			" My font! YES!
	set guioptions-=T 										" hide gvim's toolbar by default
endif

colorscheme sexy-railscasts
syntax on

set exrc													" enable per-directory .vimrc files
set secure													" disable unsafe commands in local .vimrc files
set grepprg=ack												" Using ACK for grep
set cursorline												" Highlight current line
set number 													" Show line numbers
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
set nohidden												" allow buffers to go into the background without needing to save
set visualbell 												" don't beep constantly, it's annoying.
set t_vb= 													" and don't flash the screen either (terminal anyway...)
set tags=.tags,tags;/ 										" search for a tags file recursively from cwd to /
set directory=~/.vim/swap,~/tmp,/var/tmp/,tmp 				" Store swapfiles in a single directory.
set nofoldenable 											" I don't like folding...
set magic
set nobackup
set noswapfile

"set smarttab          " use shiftwidth when hitting tab instead of sts (?)
"set autoindent        " try to put the right amount of space at the beginning of a new line
set smartindent
set shiftwidth=4
set tabstop=4		  " tab is 4 spaces
set expandtab         " use tabs

source $HOME/.vim/vimrc/keyboard.vimrc 
source $HOME/.vim/vimrc/file.vimrc 
source $HOME/.vim/vimrc/editing.vimrc 
source $HOME/.vim/vimrc/ui.vimrc 
source $HOME/.vim/vimrc/plugins.vimrc 

