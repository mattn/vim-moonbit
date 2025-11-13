if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "moonbit"

" Keywords (core MoonBit language keywords)
syn keyword moonbitKeyword as else extern fn if let const match mut type struct enum trait derive while break continue import return try catch pub priv test loop for in impl guard async derive

" Additional keywords and soft keywords
syn keyword moonbitSoftKeyword module where self Self package interface mutable

" Booleans
syn keyword moonbitBoolean true false

" Special identifiers
syn keyword moonbitSpecial _ Self

" Comments: // for single-line, /// for doc comments
syn match moonbitComment "//.*$" contains=@Spell
syn match moonbitDocComment /\/\/\/.*/ contains=@Spell

" Strings: "..." with escapes, also support raw strings
syn region moonbitString start=+"+ skip=+\\\\\|\\\"+ end=+"+ contains=@Spell
syn region moonbitRawString start=+#"+ end=+"#+ contains=@Spell

" Characters: 'c' with escapes
syn match moonbitCharacter /'[^\\]'/
syn match moonbitCharacter /'\\.'/

" Numbers: integers, floats, hex, binary, octal
syn match moonbitNumber /\<0[xX][0-9a-fA-F_]\+[UuLl]\?\>/
syn match moonbitNumber /\<0[bB][01_]\+[UuLl]\?\>/
syn match moonbitNumber /\<0[oO][0-7_]\+[UuLl]\?\>/
syn match moonbitNumber /\<[0-9][0-9_]*[UuLl]\?\>/
syn match moonbitFloat /\<[0-9][0-9_]*\.[0-9_]*\([eE][-+]\?[0-9_]\+\)\?\>/
syn match moonbitFloat /\<[0-9][0-9_]*[eE][-+]\?[0-9_]\+\>/

" Operators
syn match moonbitOperator /->/
syn match moonbitOperator /<-/
syn match moonbitOperator /=>/
syn match moonbitOperator /::/
syn match moonbitOperator /\.\.\./
syn match moonbitOperator /\.\./
syn match moonbitOperator /==/
syn match moonbitOperator /!=/
syn match moonbitOperator />=/
syn match moonbitOperator /<=/
syn match moonbitOperator /&&/
syn match moonbitOperator /\|\|/
syn match moonbitOperator /[+\-*/%<>=!&|^~]/

" Delimiters (not highlighted specially, but contained)
syn match moonbitDelimiter /[[\]{}(),;.]/

" Attributes (like #attribute(...))
syn match moonbitAttribute /#[a-zA-Z_][a-zA-Z0-9_]*(\([^)]*\))/ contains=moonbitString,moonbitNumber

" Regions for blocks, but Vim handles {} () [] well

" Highlight links
hi def link moonbitKeyword Keyword
hi def link moonbitSoftKeyword Type
hi def link moonbitBoolean Boolean
hi def link moonbitSpecial Special
hi def link moonbitComment Comment
hi def link moonbitDocComment SpecialComment
hi def link moonbitString String
hi def link moonbitRawString String
hi def link moonbitCharacter Character
hi def link moonbitNumber Number
hi def link moonbitFloat Float
hi def link moonbitOperator Operator
hi def link moonbitDelimiter Delimiter
hi def link moonbitAttribute PreProc

" Sync (for large files)
syn sync minlines=200
syn sync fromstart
