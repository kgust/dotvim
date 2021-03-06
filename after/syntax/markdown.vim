" Org-mode-like extensions to Markdown

" The keywords below are case-sensitive
syntax case match

syntax keyword markdownOrgTodo TODO
syntax keyword markdownOrgDone DONE
syntax keyword markdownOrgCanceled CANCELED
syntax keyword markdownOrgWaiting WAITING
syntax match markdownOrgTimestamp "\[\d\{4}-\d\{2}-\d\{2} .\{-}\]"

let s:concealends = has('conceal') ? ' concealends' : ''

if has('conceal')
  if &termencoding ==# "utf-8" || &encoding ==# "utf-8"
    " Checkboxes
    " let s:checkbox_unchecked = "\u2610"
    " let s:checkbox_checked = "\u2611"
    let s:checkbox_unchecked = "\u25a2"
    let s:checkbox_checked = "\u2713"
    " Bullets
    let s:bullet_unchecked = "\u25cb"
    let s:bullet_checked = "\u25cf"

    " ↓▼
    syntax keyword markdownDown DOWN conceal cchar=▼
  else
    let s:checkbox_unchecked = 'o'
    let s:checkbox_checked = 'x'
    let s:bullet_unchecked = 'o'
    let s:bullet_checked = 'x'
  endif
  syntax match markdownCheckbullet "^\s*\([-\*] \[[ xX]\]\|--\|++\) " contains=markdownCheckbulletChecked,markdownCheckbulletUnchecked
  execute 'syntax match markdownCheckbulletUnchecked "\([-\*] \[ \]\|--\)" contained conceal cchar='.s:bullet_unchecked
  execute 'syntax match markdownCheckbulletChecked "\([-\*] \[[xX]\]\|++\)" contained conceal cchar='.s:bullet_checked

  syntax match markdownCheckbox "^\s*\(\[[ xX]\]\|--\|++\) " contains=markdownCheckboxChecked,markdownCheckboxUnchecked
  execute 'syntax match markdownCheckboxUnchecked "\(\[ \]\|--\)" contained conceal cchar='.s:checkbox_unchecked
  execute 'syntax match markdownCheckboxChecked "\(\[[xX]\]\|++\)" contained conceal cchar='.s:checkbox_checked

  " syntax match newLine "<br>" conceal cchar=}
  execute 'syntax region markdownStrikeout matchgroup=markdownStrikeoutDelimiter start="\S\@<=\~\~\|\~\~\S\@=" end="\S\@<=\~\~\|\~\~\S\@=" keepend contains=markdownLineStart,markdownItalic' . s:concealends
endif

" Pandoc
syntax match markdownTitleBlock "%\%(\s\|$\)"

highlight default link markdownTitleBlock PreProc
highlight default link markdownOrgTodo Todo
highlight default link markdownOrgDone Comment
highlight default link markdownOrgCanceled markdownOrgDone
highlight default link markdownOrgWaiting markdownOrgTodo
highlight default link markdownOrgTimestamp Special
highlight default StrikeoutColor ctermfg=gray guifg=gray
highlight link markdownStrikeout StrikeoutColor
