" Use unix encoding
" http://vim.wikia.com/wiki/File_format
set ffs=unix,dos,mac

" actioscript/flex
autocmd BufNewFile,BufRead *.as set filetype=actionscript
autocmd BufNewFile,BufRead *.mxml set filetype=mxml

autocmd FileType actionscript setlocal shiftwidth=4 softtabstop=4 noexpandtab
autocmd FileType python       setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType ruby         setlocal shiftwidth=2 softtabstop=2 expandtab

