" Use unix encoding
" http://vim.wikia.com/wiki/File_format
set ffs=unix,dos,mac

" actioscript
au BufNewFile,BufRead *.as set filetype=actionscript
autocmd FileType actionscript setlocal shiftwidth=4 softtabstop=4 noexpandtab

" python
autocmd FileType python       setlocal shiftwidth=4 softtabstop=4 expandtab

" ruby
autocmd FileType ruby         setlocal shiftwidth=2 softtabstop=2 expandtab

