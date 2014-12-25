set foldmethod=syntax

augroup whitespace
    autocmd BufWritePre *.rb call whitespace#strip_trailing()
augroup END
