let g:fuf_maxMenuWidth = 150
" open files in tabs by default
let g:fuf_keyOpenTabpage = '<CR>'

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
  	" agorbatchev: if no .fuzzyfinder file found, simply run :FufFile
	:FufFileWithCurrentBufferDir 
  endif
endfunction

