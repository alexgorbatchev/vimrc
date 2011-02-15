" 
" Typepad Conversations
"

" inserts {% load i18n %} as the very first line
nmap <leader>1 gg^i{% load i18n %}<CR><ESC>
" surrounds selection with {% trans "..." %}
vmap <leader>2 :s/\%V\(.*\)\%V/{% trans \"\1\" %}/<CR>
vmap <leader>3 :s/\%V\(.*\)\%V/{% blocktrans %}\1{% endblocktrans %}/<CR>
vmap <leader>4 :s/\%V\(.*\)\%V/gettext(\1)/<CR>
autocmd BufNewFile,BufRead /Users/agorbatchev/videoegg/conversations/**/*.html set nowrap expandtab tabstop=4 shiftwidth=4 shiftwidth=4 
autocmd BufNewFile,BufRead /Users/agorbatchev/videoegg/conversations/**/*.py set nowrap expandtab tabstop=4 shiftwidth=4 shiftwidth=4 

nmap <leader>ai :%s/\(\W\)a\(\W\)/\1i\2/g<CR>
nmap <leader>ux :e ++ff=dos<CR>:setlocal ff=unix<CR>:w<CR>
nmap <leader>uu :setlocal ff=unix<CR>:w<CR>
nmap <leader>: :%s/\(\S\):\(\S\)/\1 : \2/g<CR>

