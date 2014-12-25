" FileType settings for Coffeescript
setlocal foldmethod=expr
setlocal foldexpr=GetCoffeeScriptFold(v:lnum)
setlocal foldtext=GetCoffeeScriptFoldText()
setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
"setlocal fdm=expr fde=getline(v:lnum)=~'->$'&&indent(v:lnum)<indent(v:lnum+1)?'a1':'s1'

function! GetCoffeeScriptFoldText()
  let foldsize = v:foldend - v:foldstart
  return getline(v:foldstart) . " [" . foldsize . " lines] "
endfunction

function! GetCoffeeScriptFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif

    let this_indent = IndentLevel(a:lnum)
    let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

    if next_indent == this_indent
        return this_indent
    elseif next_indent < this_indent
        return this_indent
    elseif next_indent > this_indent
        return '>' . next_indent
    endif
endfunction

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

function! NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum + 1

    while current <= numlines
        if getline(current) =~? '\v\S'
            return current
        endif

        let current += 1
    endwhile

    return -2
endfunction

augroup whitespace
    autocmd BufWritePre *.coffee call whitespace#strip_trailing()
augroup END
