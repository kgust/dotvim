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
