"-------------------------------------------------------------------------------- 
" NerdCommenter
"-------------------------------------------------------------------------------- 
nmap <leader>/ :TComment<CR>
vmap <leader>/ :TComment<CR>

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
nmap <leader>t= :Tabularize /^[^=]*\zs=<CR>
vmap <leader>t= :Tabularize /^[^=]*\zs=<CR>
nmap <leader>t: :Tabularize /^[^:]*\zs:<CR>
vmap <leader>t: :Tabularize /^[^:]*\zs:<CR>
nmap <leader>t, :Tabularize /^[^,]*\zs,<CR>
vmap <leader>t, :Tabularize /^[^,]*\zs,<CR>

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
    execute('cd '.curdir)
    " agorbatchev: augment curdir with ~/ if we are somewhere inside user's home directory
    let prompt = substitute(substitute(curdir.'/', $HOME, '~/', 'g'), '//', '/', 'g')
    call fuf#givenfile#launch('', 0, prompt, files)
  else
    execute('cd '.origcurdir)
    " agorbatchev: if no .fuzzyfinder file found, simply run :FufFile
    :FufFileWithCurrentBufferDir 
  endif
endfunction



"-------------------------------------------------------------------------------- 
" ShowMarks
"-------------------------------------------------------------------------------- 
let g:showmarks_ignore_type = "hprqm"
let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.'`^<>[]{}\""
let g:showmarks_textlower = "`\t"
let g:showmarks_textupper = "`\t"
let g:showmarks_textother = "`\t"
" If +signs is not in VIM, fake Showmark being loaded so it doesn't whine
if has("signs") == 0
	let loaded_showmarks = 1
endif



"-------------------------------------------------------------------------------- 
" NERD Tree
"-------------------------------------------------------------------------------- 
autocmd VimEnter * NERDTree " open it by default
autocmd VimEnter * wincmd p " cursor to right panel instead of NERDTree

map <leader>ncd :cd %:p:h<CR>:NERDTree %:p:h<CR>:wincmd p<CR>:pwd<CR>
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

