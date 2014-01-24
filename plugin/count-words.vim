" Count Words - Kevin Gustavson
" Inspired by...
" http://learnvimscriptthehardway.stevelosh.com/chapters/33.html

nnoremap <Leader>c :set operatorfunc=<SID>CountWords<cr>g@
vnoremap <Leader>c :<c-u>call <SID>CountWords(visualmode())<cr>

function! s:CountWords(type)
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif

    " TODO How do I echo the word count?
    "silent execute "grep! -R " . shellescape(@@) . " ."
    "copen
    echom @@
endfunction
