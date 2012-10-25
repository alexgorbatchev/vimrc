" Use unix encoding
" http://vim.wikia.com/wiki/File_format
set ffs=unix,dos,mac

if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END

  " actioscript/flex
  autocmd BufNewFile,BufRead *.as set filetype=actionscript
  autocmd BufNewFile,BufRead *.mxml set filetype=mxml

  autocmd FileType actionscript setlocal shiftwidth=4 softtabstop=4 expandtab
  autocmd FileType python       setlocal shiftwidth=4 softtabstop=4 expandtab
  autocmd FileType ruby         setlocal shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType php          setlocal shiftwidth=2 softtabstop=2 expandtab
endif


