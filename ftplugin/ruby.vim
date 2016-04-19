set foldmethod=syntax

augroup whitespace
    autocmd BufWritePre *.rb call util#strip_trailing()
augroup END
