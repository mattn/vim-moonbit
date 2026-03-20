if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword moonbitKeyword fn let const mut if else match while break continue return
syn keyword moonbitKeyword try catch except raise for in loop guard async with as is
syn keyword moonbitKeyword type typealias enum struct trait traitalias derive test impl
syn keyword moonbitKeyword import fnalias extern pub priv readonly self

" Boolean
syn keyword moonbitBoolean true false

" Logical not
syn keyword moonbitOperator not

" Comments (doc comment defined after to take priority)
syn match moonbitComment "//.*$" contains=@Spell
syn match moonbitDocComment "///.*$" contains=@Spell

" Strings with interpolation and escape sequences
syn region moonbitString start=+"+ skip=+\\\\\|\\\"+ end=+"+ contains=moonbitEscape,moonbitStringInterp,@Spell
syn match moonbitEscape /\\[0\\tnrb"']/ contained
syn match moonbitEscape /\\x[0-9a-fA-F]\{2}/ contained
syn match moonbitEscape /\\o[0-7]\{3}/ contained
syn match moonbitEscape /\\u[0-9a-fA-F]\{4}/ contained
syn match moonbitEscape /\\u{[0-9a-fA-F]\+}/ contained
syn region moonbitStringInterp start=/\\{/ end=/}/ contained contains=TOP

" Line strings
syn match moonbitLineString /^\s*#|.*$/
syn match moonbitInterpLineString /^\s*\$|.*$/ contains=moonbitStringInterp

" Characters
syn match moonbitCharacter /'[^\\]'/
syn match moonbitCharacter /'\\[0\\tnrb"']'/
syn match moonbitCharacter /'\\x[0-9a-fA-F]\{2}'/
syn match moonbitCharacter /'\\u[0-9a-fA-F]\{4}'/
syn match moonbitCharacter /'\\u{[0-9a-fA-F]\+}'/

" Numbers
syn match moonbitNumber /\<0[xX][0-9a-fA-F_]\+[UuLl]\?\>/
syn match moonbitNumber /\<0[bB][01_]\+[UuLl]\?\>/
syn match moonbitNumber /\<0[oO][0-7_]\+[UuLl]\?\>/
syn match moonbitNumber /\<[0-9][0-9_]*[UuLl]\?\>/
syn match moonbitFloat /\<[0-9][0-9_]*\.[0-9_]*\([eE][-+]\?[0-9_]\+\)\?\>/
syn match moonbitFloat /\<[0-9][0-9_]*[eE][-+]\?[0-9_]\+\>/
syn match moonbitFloat /\<0[xX][0-9a-fA-F_]*\.[0-9a-fA-F_]*\([pP][-+]\?[0-9_]\+\)\?\>/

" Operators
syn match moonbitOperator /=>/
syn match moonbitOperator /->/
syn match moonbitOperator /|>/
syn match moonbitOperator /===/
syn match moonbitOperator /==/
syn match moonbitOperator /!=/
syn match moonbitOperator />=/
syn match moonbitOperator /<=/
syn match moonbitOperator /&&/
syn match moonbitOperator /||/
syn match moonbitOperator /<<\|>>/

" Attributes
syn region moonbitAttribute start=/#\[/ end=/\]/ contains=moonbitString,moonbitNumber

" Module reference
syn match moonbitModule /@[A-Za-z][A-Za-z0-9_]*/

" Delimiters
syn match moonbitDelimiter /[[\]{}(),;.]/

" Highlight links
hi def link moonbitKeyword Keyword
hi def link moonbitBoolean Boolean
hi def link moonbitComment Comment
hi def link moonbitDocComment SpecialComment
hi def link moonbitString String
hi def link moonbitLineString String
hi def link moonbitInterpLineString String
hi def link moonbitEscape SpecialChar
hi def link moonbitStringInterp Special
hi def link moonbitCharacter Character
hi def link moonbitNumber Number
hi def link moonbitFloat Float
hi def link moonbitOperator Operator
hi def link moonbitDelimiter Delimiter
hi def link moonbitAttribute PreProc
hi def link moonbitModule Include

let b:current_syntax = "moonbit"
