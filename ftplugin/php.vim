" FileType settings for PHP
"setlocal kg=:help
setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
setlocal colorcolumn=85
silent! EnableFastPHPFolds

" Automatically strip trailing spaces in PHP files when 
"autocmd File_Type BufRead,BufWrite *.php %s/\s\+$//e

