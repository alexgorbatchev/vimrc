" Use unix encoding
" http://vim.wikia.com/wiki/File_format
set ffs=unix,dos,mac

autocmd BufNewFile,BufRead *.as set filetype=actionscript
autocmd BufNewFile,BufRead *.mxml set filetype=mxml

" javascript config
autocmd BufNewFile,BufReadPost *.js set filetype=javascript foldmethod=indent nofoldenable shiftwidth=4 softtabstop=4 expandtab

" coffeescript config
autocmd BufNewFile,BufReadPost *.coffee set filetype=coffee foldmethod=indent nofoldenable shiftwidth=2 softtabstop=2 expandtab

" stylus css markup
autocmd BufNewFile,BufReadPost *.styl set filetype=stylus shiftwidth=2 softtabstop=2 expandtab

