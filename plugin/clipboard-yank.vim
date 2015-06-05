let s:uname = system('uname')

function! ClipboardYank()
    if s:uname == "Linux\n"
        call system('xclip -i -selection clipboard', @@)
    endif

    if s:uname == "Darwin\n"
        call system('pbcopy', @@)
    endif
endfunction

function! ClipboardPaste()
    if s:uname == "Linux\n"
        let @@ = system('xclip -o -selection clipboard')
    endif

    if s:uname == "Darwin\n"
        let @@ = system('pbpaste')
    endif
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
onoremap <silent> y y:call ClipboardYank()<cr>
onoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p
