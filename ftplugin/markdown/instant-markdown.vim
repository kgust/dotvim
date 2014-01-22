" # Configuration
if !exists('g:instant_markdown_slow')
    let g:instant_markdown_slow = 0
endif

" # Utility Functions
" Simple system wrapper that ignores empty second args
function! s:system(cmd, stdin)
    if strlen(a:stdin) == 0
        call system(a:cmd)
    else
        call system(a:cmd, a:stdin)
    endif
endfunction

function! s:refreshView()
    let bufnr = expand('<bufnr>')
    call s:system("curl -X PUT -T - http://localhost:8090/ &>/dev/null &",
                \ s:bufGetContents(bufnr))
endfunction

function! s:startDaemon(initialMD)
    call s:system("/usr/local/bin/instant-markdown-d &>/dev/null &", a:initialMD)

endfunction

function! s:initDict()
    if !exists('s:buffers')
        let s:buffers = {}
    endif
endfunction

function! s:pushBuffer(bufnr)
    call s:initDict()
    let s:buffers[a:bufnr] = 1
endfunction

function! s:popBuffer(bufnr)
    call s:initDict()
    call remove(s:buffers, a:bufnr)
endfunction

function! s:killDaemon()
    call system("curl -s -X DELETE http://localhost:8090/ &>/dev/null &")
endfunction

function! s:bufGetContents(bufnr)
  return join(getbufline(a:bufnr, 1, "$"), "\n")
endfunction

" I really, really hope there's a better way to do this.
function! s:myBufNr()
    return str2nr(expand('<abuf>'))
endfunction

" # Functions called by autocmds
"
" ## push a new Markdown buffer into the system.
"
" 1. Track it so we know when to garbage collect the daemon
" 2. Start daemon if we're on the first MD buffer.
" 3. Initialize changedtickLast, possibly needlessly(?)
function! s:pushMarkdown()
    let bufnr = s:myBufNr()
    call s:initDict()
    if len(s:buffers) == 0
        call s:startDaemon(s:bufGetContents(bufnr))
    endif
    call s:pushBuffer(bufnr)
    let b:changedtickLast = b:changedtick
endfunction

" ## pop a Markdown buffer
"
" 1. Pop the buffer reference
" 2. Garbage collection
"     * daemon
"     * autocmds
function! s:popMarkdown()
    let bufnr = s:myBufNr()
    silent autocmd! instant-markdown * <buffer=abuf>
    call s:popBuffer(bufnr)
    if len(s:buffers) == 0
        call s:killDaemon()
    endif
endfunction

" ## Refresh if there's something new worth showing
"
" 'All things in moderation'
function! s:temperedRefresh()
    if !exists('b:changedtickLast')
        let b:changedtickLast = b:changedtick
    elseif b:changedtickLast != b:changedtick
        let b:changedtickLast = b:changedtick
        call s:refreshView()
    endif
endfunction

" # Define the autocmds "
augroup instant-markdown
    autocmd! * <buffer>
    autocmd BufEnter <buffer> call s:refreshView()
    if g:instant_markdown_slow
        autocmd CursorHold,BufWrite,InsertLeave <buffer> call s:temperedRefresh()
    else
        autocmd CursorHold,CursorHoldI,CursorMoved,CursorMovedI <buffer> call s:temperedRefresh()
    endif
    autocmd BufWinLeave <buffer> call s:popMarkdown()
    autocmd BufwinEnter <buffer> call s:pushMarkdown()
augroup END
