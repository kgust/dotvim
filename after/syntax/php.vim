" we need the conceal feature (vim ≥ 7.3)
if exists('g:no_php_conceal') "|| !has('conceal') || &enc != 'utf-8'
    finish
endif

"syntax clear phpOperator

"syntax keyword phpOperator is

syntax match phpOperator "\<or\>" conceal cchar=∪ contained containedin=phpRegion
syntax match phpOperator "||" conceal cchar=∨ contained containedin=phpRegion
syntax match phpOperator "\<and\>" conceal cchar=∩ contained containedin=phpRegion
syntax match phpOperator "&&" conceal cchar=∧ contained containedin=phpRegion
syntax match phpOperator "!" conceal cchar=¬ contained containedin=phpRegion
syntax match phpOperator "<=" conceal cchar=≤ contained containedin=phpRegion
syntax match phpOperator ">=" conceal cchar=≥ contained containedin=phpRegion
syntax match phpOperator "==" conceal cchar=≈ contained containedin=phpRegion
syntax match phpOperator "===" conceal cchar=≡ contained containedin=phpRegion
syntax match phpOperator "::" conceal cchar=⁝ contained containedin=phpRegion
syntax match phpOperator "!=" conceal cchar=≉ contained containedin=phpRegion
"syntax match phpOperator "!==" conceal cchar=≠ contained containedin=phpRegion
syntax match phpOperator "!==" conceal cchar=≢ contained containedin=phpRegion
syntax match phpOperator "=>" conceal cchar=➮ contained containedin=phpRegion
syntax match phpRelation "=>" conceal cchar=➯ contained containedin=phpRegion
syntax match phpMemberSelector "\->" conceal cchar=➔ contained containedin=phpRegion

syntax region myArray matchgroup=None concealends start="array(" end=")" cchar=|

"→a →a ↣a ➡a ➜a ‣a
"syntax match phpMemberSelector "->" conceal cchar=→

"syntax match phpOperator "<=" conceal cchar=≤
"syntax match phpOperator ">=" conceal cchar=≥
" ⥤a ⇨b ⇒c ➭d ⇉e
"syntax match phpOperator "\<=>\>" conceal cchar=➭
"syntax match phpOperator "!=" conceal cchar=≠

"hi link phpOperator Operator
"hi link phpStatement Statement
"hi link phpKeyword Keyword
"hi link phpMemberSelector MemberSelector
"hi link phpBuiltin Builtin
"hi! link Conceal Operator


hi link phpOperator phpOperator
hi link phpStatement phpStatement
hi link phpKeyword phpKeyword
hi link phpRelation phpRelation
hi link phpMemberSelector phpMemberSelector
hi! link Conceal phpOperator

setlocal conceallevel=2
