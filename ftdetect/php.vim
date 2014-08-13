autocmd BufNewFile,BufRead *.php set tags+=vendor.tags
autocmd BufNewFile,BufRead *Test.php set filetype=php.phpunit | UltiSnipsAddFiletypes phpunit.php<CR>
autocmd BufNewFile,BufRead *Cest.php set filetype=php.codeception | UltiSnipsAddFiletypes codeception.php<CR>
"autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
