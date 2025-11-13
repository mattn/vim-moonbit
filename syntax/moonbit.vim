if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "moonbit"

" Keywords (reserved - must not be used as identifiers)
syn keyword moonbitKeyword as else extern fn fnalias if let const match using mut type typealias struct enum trait traitalias derive while break continue import return throw raise try catch pub priv readonly test loop for in impl with guard async is suberror and letrec enumview noraise defer

" Soft keywords (reserved, warning on use - highlight as keywords for now)
syn keyword moonbitSoftKeyword module move ref static super unsafe use where await dyn abstract do final macro override typeof virtual yield local method alias assert package recur enumview isnot define downcast inherit member namespace static upcast use void lazy include mixin protected sealed constructor atomic volatile anyframe anytype asm await comptime errdefer export opaque orelse resume threadlocal unreachable dynclass dynobj dynrec var finally noasync

" Booleans
syn keyword moonbitBoolean true false

" Special identifiers
syn keyword moonbitSpecial _ Self

" Comments: # for single-line, /// for doc comments (treat as special comment)
syn match moonbitComment /#.*/ contains=@Spell
syn region moonbitDocComment start="///" end="^" keepend contains=@Spell

" Strings: "..." with escapes
syn region moonbitString start=+"+ skip=+\\"+ end=+"+ contains=@Spell

" Characters: 'c' with escapes
syn match moonbitCharacter /'[^\\]'/
syn match moonbitCharacter /'\\.'/

" Numbers: integers, floats, hex
syn match moonbitNumber /\<0[xX][0-9a-fA-F]\+\>/
syn match moonbitNumber /\<[0-9]\+\>/
syn match moonbitNumber /\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\?\>/

" Operators: common ones
syn match moonbitOperator /->/
syn match moonbitOperator /::/
syn match moonbitOperator /:/
syn match moonbitOperator /==/
syn match moonbitOperator /!=/
syn match moonbitOperator />=/
syn match moonbitOperator /<=/
syn match moonbitOperator />/
syn match moonbitOperator /</
syn match moonbitOperator /+/
syn match moonbitOperator /-/
syn match moonbitOperator /\*/
syn match moonbitOperator /\/\//
syn match moonbitOperator /%/
syn match moonbitOperator /&&/
syn match moonbitOperator /\|\|/
syn match moonbitOperator /|/
syn match moonbitOperator /=>/

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
hi def link moonbitDocComment PreProc
hi def link moonbitString String
hi def link moonbitCharacter Character
hi def link moonbitNumber Number
hi def link moonbitOperator Operator
hi def link moonbitDelimiter Delimiter
hi def link moonbitAttribute PreProc

" Sync (for large files)
syn sync minlines=200
syn sync fromstart
