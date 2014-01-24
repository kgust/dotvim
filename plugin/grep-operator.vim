" Grep Operator - Steve Losh
" http://learnvimscriptthehardway.stevelosh.com/chapters/33.html

nnoremap <Leader>r :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <Leader>r :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
    " Save the existing contents
    let saved_unnamed_register = @@
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " ."
    copen

    let @@ = saved_unnamed_register
endfunction
