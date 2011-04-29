nmap <leader>/ :TComment<CR>
vmap <leader>/ :TComment<CR>

autocmd BufNewFile,BufRead *.as call ConfigureActionScript()

function! ConfigureActionScript()
  nmap <leader>/ :TComment //\ <CR>
  vmap <leader>/ :TComment //\ <CR>
endfunction

