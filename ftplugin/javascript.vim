" FileType settings for Javascript

"NeoBundleSource vim-javascript
"NeoBundleSource vim-cute-javascript
"NeoBundleSource vim-syntax-js

setlocal expandtab
setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
"setlocal foldmethod=syntax
"setlocal foldlevelstart=1
"let javaScript_fold=1
setlocal colorcolumn=80,120

let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"

let b:javascript_fold = 1
let b:javascript_enable_domhtmlcss = 1

augroup whitespace
  autocmd BufWritePre *.js call util#strip_trailing()
augroup END

" Syntax Checking {
  "let g:syntastic_javascript_checkers = ['eslint', 'jshint']
  let g:syntastic_javascript_checkers = ['jshint']
  let g:syntastic_check_on_open = 1
" }
