" let Vundle manage Vundle required! 
Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'

" snipMate.vim aims to be a concise vim script that implements some of 
" TextMate's snippets features in Vim (with dependencies).
Bundle 'garbas/vim-snipmate'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

" I'm not going to lie to you; fugitive.vim may very well be the best Git
" wrapper of all time. Check out these features:
"
" View any blob, tree, commit, or tag in the repository with :Gedit (and 
" :Gsplit, :Gvsplit, :Gtabedit, ...). Edit a file in the index and write
" to it to stage the changes. Use :Gdiff to bring up the staged version 
" of the file side by side with the working tree version and use Vim's 
" diff handling capabilities to stage a subset of the file's changes.
Bundle 'tpope/vim-fugitive'

" you've ever tried using the "." command after a plugin map you were likely 
" disappointed to discover it only repeated the last native command inside 
" that app, rather than the map as a whole.  That disappointment ends today.  
" Repeat.vim remaps "." in a way that plugins can tap into it. 
"
" Support is already present in the following plugins: 
"
" surround.vim (vimscript #1697) 
" speeddating.vim (vimscript #2120) 
" abolish.vim (vimscript #1545) 
" unimpaired.vim (vimscript #1590) 
Bundle 'tpope/vim-repeat'

" This plugin is a tool for dealing with pairs of "surroundings."  Examples
" of surroundings include parentheses, quotes, and HTML tags.  They are
" closely related to what Vim refers to as |text-objects|.  Provided
" are mappings to allow for removing, changing, and adding surroundings.
Bundle 'tpope/vim-surround'

" Sometimes, it's useful to line up text.  Naturally, it's nicer to have the
" computer do this for you, since aligning things by hand quickly becomes
" unpleasant.  While there are other plugins for aligning text, the ones I've
" tried are either impossibly difficult to understand and use, or too simplistic
" to handle complicated tasks.  This plugin aims to make the easy things easy
" and the hard things possible, without providing an unnecessarily obtuse
" interface.  It's still a work in progress, and criticisms are welcome.
Bundle 'godlygeek/tabular'

Bundle 'Shougo/neocomplcache'

" The ultimate vim statusline utility
Bundle 'Lokaltog/vim-powerline'

Bundle 'tComment'
Bundle 'YankRing.vim'
"Bundle 'FuzzyFinder'
Bundle 'JavaScript-Indent'

" This plugin redefines 6 search commands (/,?,n,N,*,#). At every
" search command, it automatically prints
"        "At match #N out of M matches".
" -- the total number of matches (M) and the number(index) of current
" match (N). This helps to get oriented when searching forward and
" backward.
Bundle 'IndexedSearch'

" l9 is a Vim-script library, which provides some utility functions and commands
" for programming in Vim.
Bundle 'L9'

" My fav colors
" Bundle 'jgdavey/vim-railscasts'
Bundle 'oguzbilgic/sexy-railscasts-theme'

Bundle 'groenewege/vim-less'
Bundle 'timcharper/textile.vim'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kchmck/vim-coffee-script'
Bundle 'wavded/vim-stylus'
Bundle 'statianzo/vim-jade'
Bundle 'othree/javascript-syntax.vim'
Bundle 'leafgarland/typescript-vim'
Bundle 'jQuery'
