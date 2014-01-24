" FileType settings for Coffeescript
setlocal foldmethod=indent expandtab tabstop=2 shiftwidth=2 softtabstop=2

function! CoffeeScriptFolds()
  if getline(v:lnum) =~ '^\s*class$'
    return ">" . (indent(v:lnum) + 2) / 2
  "elseif getline(v:lnum) =~ '^\s*#'
    "return ">" . (indent(v:lnum) + 2) / 2
  elseif getline(v:lnum) =~ '^\s*$' && getline(v:lnum - 1) =~ '\w' && getline(v:lnum + 1) =~ '^\s*$'
    return "s1"
  elseif getline(v:lnum) =~ '[=-]>$'
    return ">" . (indent(v:lnum) + 2) / 2
  endif
  return "="
endfunction

function! CoffeeScriptFoldText()
  let foldsize = v:foldend - v:foldstart
  return getline(v:foldstart) . " [" . foldsize . " lines] "
endfunction

setlocal foldmethod=expr
setlocal foldexpr=CoffeeScriptFolds()
setlocal foldtext=CoffeeScriptFoldText()
"setlocal fdm=expr fde=getline(v:lnum)=~'->$'&&indent(v:lnum)<indent(v:lnum+1)?'a1':'s1'
