" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
vnoremap z' :norm wysiw'<CR>

function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" In editing mode Ctrl-d deletes word under cursor
imap <C-d> <C-[>diwi

" selects a whole function assuming the following format and expecting current
" line to be inside the function body
"
" function()
" {
"     {
"         other blocks
"     }
" ---> cursor here
"     {
"         other blocks
"     }
" }
"
nnoremap zfv vi{<DOWN>o<UP><UP>o

" surround word with ['']
nnoremap zsa' bi['<ESC>ea']<ESC>

" surround word with [""]
nnoremap zsa" bi["<ESC>ea"]<ESC>

" surround word with ''
nnoremap zs' bi'<ESC>ea'<ESC>

" surround word with ""
nnoremap zs" bi"<ESC>ea"<ESC>

" surround word with []
nnoremap zs[ bi[<ESC>ea]<ESC>
"
" surround word with ()
nnoremap zs( bi(<ESC>ea)<ESC>

" adds space between // and next word if there isn't one
nnoremap zc/ ma:%s#^\(\s*\)//\(\w\)#\1// \2#g<CR>`a

" deletes matching/balanced braces
nnoremap zdb %x``x

" replaced word with _word, good for making public variables private
nnoremap zc_ ma:%s/\<<C-r><C-w>\>/_<C-r><C-w>/g<CR>`a

" replaces function name() with name: function()
nnoremap zcf :s/function \(\w\+\)/\1: function/<CR>`a

