" setup integrated help
function! OnlineDoc()
let s:wordUnderCursor = expand("<cword>")

if &ft =~ "cs"
    let s:url = "http://social.msdn.microsoft.com/Search/en-US/?Refinement=26&Query=" . s:wordUnderCursor
else
    execute "help " . s:wordUnderCursor
    return
endif

let s:browser = "\"C:\\Program Files\\Mozilla Firefox\\firefox.exe\""
let s:cmd = "silent !start " . s:browser . " " . s:url

execute s:cmd
endfunction

map <silent> <F1> :call OnlineDoc()<CR>
imap <silent> <F1> <ESC>:call OnlineDoc()<CR>
