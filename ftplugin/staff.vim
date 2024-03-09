" fold expression
setlocal foldmethod=expr
setlocal foldexpr=s:staff_fold(v:lnum)

" define folding
func! s:staff_fold(lnum)
  let l:line = getline(a:lnum)

  if l:line =~? '\v^\={1,3}'
    " fold at header
    return '>' . matchend(l:line, '\v^\={1,3}')
  endif

  " current level
  return '='
endfunc
