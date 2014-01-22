" FileType settings for PHP
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"setlocal kg=:help
setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
setlocal colorcolumn=85
silent! EnableFastPHPFolds

" Automatically strip trailing spaces in PHP files when 
"autocmd File_Type BufRead,BufWrite *.php %s/\s\+$//e

" PDV PHPDoc Support {
    let g:DisableAutoPHPFolding = 1

    let g:pdv_cfg_Package = "CellTrak"
    let g:pdv_cfg_Version = "2.0.4"
    let g:pdv_cfg_Author = "K. Gustavson <kgustavson@celltrak.com>"
    let g:pdv_cfg_Copyright = "Copyright 2012 CellTrak Technologies, Inc. All Rights reserved."
    let g:pdv_cfg_License = "CellTrak Internal Source {@link http://www.celltrak.com/}"
    let g:pdv_cfg_CommentEnd = ""

    " PHP Syntax
    let php_sql_query = 1
    let php_baselib = 1
    let php_htmlInStrings = 1
    " let php_parent_error_close = 1

    "inoremap <Leader>pd <Esc>:call PhpDocSingle()<CR>
    nnoremap <Leader>pd :call PhpDocSingle()<CR>
    vnoremap <Leader>pd :call PhpDocRange()<CR>

    ""let b:match_words = b:match_words . ',{:},(:),[:]'
    nnoremap <Leader>ff :EnableFastPHPFolds<CR>
    vnoremap <Leader>ff :EnableFastPHPFolds<CR>
" }
" PHP Namespace {
    inoremap <buffer><Leader>ns <C-O>:call PhpInsertUse()><CR>
    noremap <buffer><Leader>ns :call PhpInsertUse()><CR>
" }
" PhpQA {
    let g:phpqa_messdetector_ruleset = "/home/kgustavson/workspace/symfony2/phpmd.xml"
    let g:phpqa_codesniffer_args = "--standard=/home/kgustavson/workspace/php/celltrak_coding_standard.xml"

    " All of these are default = 1
    let g:phpqa_messdetector_autorun = 0
    let g:phpqa_codesniffer_autorun = 0
    let g:phpqa_codecoverage_autorun = 0

    " Stop the location list opening automatically
    "let g:phpqa_open_loc = 0

    " Clover code coverage XML file
    let g:phpqa_codecoverage_file = "/home/kgustavson/workspace/symfony2/build/logs/clover.xml"
    " Show markers for lines that ARE covered by tests (default = 1)
    "let g:phpqa_codecoverage_showcovered = 0

    " Additional Mappings
    nnoremap <Leader>pmd :Phpmd<cr>
    nnoremap <Leader>pcs :Phpcs<cr>
    nnoremap <Leader>pcc :Phpcc<cr>

    "nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
    "nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
    let g:php_cs_fixer_path = "~/bin/php-cs-fixer" " define the path to the php-cs-fixer.phar
    let g:php_cs_fixer_level = "all"               " which level ?
    let g:php_cs_fixer_config = "default"          " configuration
    let g:php_cs_fixer_php_path = "php"            " Path to PHP
    let g:php_cs_fixer_fixers_list = ""            " List of fixers
    let g:php_cs_fixer_enable_default_mapping = 1  " Enable the mapping by default (<leader>pcd)
    let g:php_cs_fixer_dry_run = 0                 " Call command with dry-run option
    let g:php_cs_fixer_verbose = 0                 " Return the output of command if 1, else an inline information.
" }
" PHPUnit {
    " http://knplabs.com/blog/boost-your-productivity-with-sf2-and-vim
    " phpunit compilation
    com! -nargs=* Phpunit make -c app <q-args> | cw
    nnoremap <Leader>pu :Phpunit %<CR>
    nnoremap <Leader>pua :Phpunit<CR>
" }
