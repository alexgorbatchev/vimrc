"-------------------------------------------------------------------------------- 
" NerdCommenter
"-------------------------------------------------------------------------------- 
map <leader>/ :TComment<CR>

autocmd BufNewFile,BufRead *.as call ConfigureActionScript()

function! ConfigureActionScript()
  nmap <leader>/ :TComment //\ <CR>
  vmap <leader>/ :TComment //\ <CR>
endfunction



"-------------------------------------------------------------------------------- 
" Snipmate
"-------------------------------------------------------------------------------- 
if !exists('g:snipMate')
  let g:snipMate = {}
endif

let g:snipMate['snippet_dirs'] = [ '~/.vim/snippets' ]
" reloads all snipmate snippets
map <leader>smr :call ReloadAllSnippets()<CR>



"-------------------------------------------------------------------------------- 
" Tabular
"-------------------------------------------------------------------------------- 
map <leader>t= :Tabularize /^[^=]*\zs=<CR>
map <leader>t: :Tabularize /^[^:]*\zs:<CR>
map <leader>t, :Tabularize /^[^,]*\zs,<CR>

" inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
" function! s:align()
  " let p = '^\s*|\s.*\s|\s*$'
  " if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    " let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    " let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    " Tabularize/|/l1
    " normal! 0
    " call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  " endif
" endfunction


"
"-------------------------------------------------------------------------------- 
" TComment
"-------------------------------------------------------------------------------- 
nmap <leader>/ :TComment<CR>
vmap <leader>/ :TComment<CR>

autocmd BufNewFile,BufRead *.as call ConfigureActionScript()

function! ConfigureActionScript()
	nmap <leader>/ :TComment //\ <CR>
	vmap <leader>/ :TComment //\ <CR>
endfunction



"-------------------------------------------------------------------------------- 
" Fuzzy Finder
"-------------------------------------------------------------------------------- 
let g:fuf_maxMenuWidth = 150
"let g:fuf_keyOpenTabpage = '<CR>' " open files in tabs by default

map <leader>ff :call ProjectFuzzyFind()<CR>
map <leader>fb :FufBuffer<CR>
map <leader>fq :FufQuickfix<CR>
map <leader>fl :FufLine<CR>

"
" With modifications from http://efiquest.org/2010-09-24/49/
"              
" Recursively looks for .fuzzyfile and uses lines from it
" to add to the search path. For example:
"
" folder/sub/**
" another/**
" *
"
function! ProjectFuzzyFind()
  let origcurdir = getcwd()
  let curdir = origcurdir
  let prevdir = ""
 
  while curdir != prevdir
    if filereadable(".fuzzyfinder")
      break
    endif
    cd ..
    let prevdir = curdir
    let curdir = getcwd()
  endwhile
 
  if filereadable(".fuzzyfinder")
    let items = readfile(".fuzzyfinder")
    let files = []
    for n in items
      let globlist = glob(curdir.'/'.n)
      let files += split(substitute(globlist, curdir.'/', '', 'g'), '\n')
    endfor
 
    " agorbatchev: cd into the dir
    :cd `=curdir`
    " agorbatchev: augment curdir with ~/ if we are somewhere inside user's home directory
    let prompt = substitute(substitute(curdir.'/', $HOME, '~/', 'g'), '//', '/', 'g')
    call fuf#givenfile#launch('', 0, prompt, files)
  else
    :cd `=curdir`
    " agorbatchev: if no .fuzzyfinder file found, simply run :FufFile
    :FufFileWithCurrentBufferDir 
  endif
endfunction


"-------------------------------------------------------------------------------- 
" NERD Tree
"-------------------------------------------------------------------------------- 
" autocmd VimEnter * NERDTree " open it by default
" autocmd VimEnter * wincmd p " cursor to right panel instead of NERDTree

map <leader>nf :NERDTreeFind<CR>:wincmd p<CR>
noremap <silent> <leader>n :NERDTreeToggle<CR>:wincmd p<CR>



"-------------------------------------------------------------------------------- 
" Tag Bar
"-------------------------------------------------------------------------------- 
map <leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin = "/usr/local/Cellar/ctags/5.8/bin/ctags"



"-------------------------------------------------------------------------------- 
" Fugitive
"-------------------------------------------------------------------------------- 
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gr :Gremove<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gm :Gmove 
nnoremap <leader>gp :Ggrep 
nnoremap <leader>gR :Gread<CR>
nnoremap <leader>gg :Git 
nnoremap <leader>gd :Gdiff<CR>



"-------------------------------------------------------------------------------- 
" YankRing
"-------------------------------------------------------------------------------- 
nnoremap <leader>y :YRShow<CR>



"-------------------------------------------------------------------------------- 
" neocomplcache
"-------------------------------------------------------------------------------- 
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" this option controls whether neocomplcache selects the first candidate automatically
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_cursor_hold_i_time = 2000

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
" inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
