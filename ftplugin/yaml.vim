set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" data.yml: fill a register with this macro
let b:macro = 'mA'
let b:macro .= '/preacher:wwv$h"py'
let b:macro .= '/reader:wwv$h"ry'
let b:macro .= '`A'
let b:macro .= 'VGk'
let b:macro .= ':s/	/,/'
let b:macro .= 'gv'
let b:macro .= ':s/^/  - [/'
let b:macro .= 'gv'
let b:macro .= ':s/$/,=getreg("p")]/'
let b:macro .= '`A2f,lvf,hS"'
let b:macro .= 'f,lv$hhc=getreg("r")0'
let @z = b:macro
