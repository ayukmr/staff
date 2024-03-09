if exists('b:current_syntax')
  finish
endif

" staff syntax
let b:current_syntax = 'staff'

" headers
syn region staffHeader start='\v^\={1,3} ' end='$'
hi link staffHeader Title

" tasks
syn region staffTask start='\v^\s*[-/~?] ' end='$'
  \ contains=staffSymbol,staffPriority,staffDate,staffTag

" finished
syn region staffFinished start='\v^\s*x ' end='$' contains=staffSymbolFinished
hi link staffFinished Comment

" priorities
syn match staffPriority '\v(!\.\.|!!\.|!!!)' contained
hi link staffPriority Identifier

" dates
syn match staffDate '\v\@\d{2}\.\d{2}' contained
hi link staffDate Question

" tags
syn match staffTag '\v#[0-9a-zA-Z-]+' contained
hi link staffTag Constant

syn match staffSymbol '\v^\s*. ' contained
  \ contains=staffSymbolNew,staffSymbolStarted,staffSymbolBlocked,staffSymbolEventual

" symbols
syn match staffSymbolNew      '-'  contained
syn match staffSymbolStarted  '/'  contained
syn match staffSymbolBlocked  '\~' contained
syn match staffSymbolEventual '?'  contained

hi link staffSymbolNew      Include
hi link staffSymbolStarted  Question
hi link staffSymbolBlocked  Constant
hi link staffSymbolEventual Type
hi link staffSymbolFinished Comment
