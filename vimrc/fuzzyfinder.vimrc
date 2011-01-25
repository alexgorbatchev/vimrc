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
let g:fuf_maxMenuWidth = 150
nmap <leader>ff :call ProjectFuzzyFind()<CR>
nmap <leader>fb :FufBuffer<CR>
nmap <leader>fq :FufQuickfix<CR>

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
      let files += split(glob(curdir . "/" . n), "\n")
    endfor
 
    call fuf#givenfile#launch('', 0, '>', files)
  else
  	" if no .fuzzyfinder file found, simply run :FufFile
	:FufFileWithCurrentBufferDir 
  endif
endfunction

