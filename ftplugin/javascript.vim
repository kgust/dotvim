" FileType settings for Javascript
setlocal expandtab
setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
setlocal foldmethod=syntax
setlocal foldlevelstart=1
let javaScript_fold=1

augroup whitespace
  autocmd BufWritePre *.js call whitespace#strip_trailing()
augroup END

" Syntax Checking {
  let g:syntastic_javascript_checkers = ['eslint', 'jshint']
  let g:syntastic_check_on_open = 1
  " let g:syntastic_php_phpcs_args = "--report=csv --standard=psr2"
" }
