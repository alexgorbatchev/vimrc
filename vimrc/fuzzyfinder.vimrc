let g:fuf_maxMenuWidth = 150
"let g:fuf_keyOpenTabpage = '<CR>' " open files in tabs by default

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

