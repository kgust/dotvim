" FileType settings for HTML
setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" Tool Sharpening - This should fix the <? problem I have with html files.
inoremap <buffer> <? </

augroup whitespace
    autocmd BufWritePre *.html call util#strip_trailing()
augroup END
