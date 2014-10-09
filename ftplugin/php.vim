" FileType settings for PHP
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:

setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
setlocal colorcolumn=85

" Automatically strip trailing spaces in PHP files when reading/writing
"autocmd File_Type BufRead,BufWrite *.php %s/\s\+$//e

" PDV PHPDoc Support {
    if 1
        let g:DisableAutoPHPFolding = 0

        let g:pdv_cfg_Package = "StraightNorth"
        "let g:pdv_cfg_Version = "2.0.4"
        let g:pdv_cfg_Author = "K. Gustavson <kgustavson@straightnorth.com>"
        let g:pdv_cfg_Copyright = "Copyright 2014 Straight North, LLC. All Rights reserved."
        let g:pdv_cfg_License = "Straight North All Rights Reserved {@link http://www.straightnorth.com/}"
        let g:pdv_cfg_CommentEnd = ""

        " PHP Syntax
        let php_sql_query = 1
        let php_baselib = 1
        let php_htmlInStrings = 1
        " let php_parent_error_close = 1


        "inoremap <LocalLeader>pd <Esc>:call PhpDocSingle()<CR>
        nnoremap <LocalLeader>d :call PhpDocSingle()<CR>
        vnoremap <LocalLeader>d :call PhpDocRange()<CR>

        ""let b:match_words = b:match_words . ',{:},(:),[:]'
        nnoremap <LocalLeader>ff :EnableFastPHPFolds<CR>
        vnoremap <LocalLeader>ff :EnableFastPHPFolds<CR>
    endif
" }

" PDV 2 PHPDoc Support {
    let g:pdv_template_dir = $HOME."/.vim/flavors/tobyS_pdv/templates"
    let g:PHP_removeCRwhenUnix = 1             " 0 is default
    let g:PHP_BracesAtCodeLevel = 0            " 0 is default
    let g:PHP_vintage_case_default_indent = 0  " 0 is default
    nnoremap <buffer> <LocalLeader>pd :call pdv#DocumentCurrentLine()<CR>
" }

" PHP Namespace {
    inoremap <buffer><LocalLeader>ns <C-O>:call PhpInsertUse()><CR>
    noremap <buffer><LocalLeader>ns :call PhpInsertUse()><CR>
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
    nnoremap <LocalLeader>pmd :Phpmd<cr>
    nnoremap <LocalLeader>pcs :Phpcs<cr>
    nnoremap <LocalLeader>pcc :Phpcc<cr>

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

" Syntax Checking {
    let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
    let g:syntastic_check_on_open = 1
    let g:syntastic_php_phpcs_args = "--report=csv --standard=phpcs.xml"
" }

" Testing {
    " http://knplabs.com/blog/boost-your-productivity-with-sf2-and-vim
    " phpunit compilation
    "com! -nargs=* Phpunit make -c app <q-args> | cw
    "nnoremap <Leader>pu :Phpunit %<CR>
    "nnoremap <Leader>pua :Phpunit<CR>

    " Test a method
    nnoremap <LocalLeader>m yiw:!phpunit --filter <c-r>"<CR>
    nnoremap <LocalLeader>t :call RunPhpTests()<cr>

    "nnoremap pu :!clear && vendor/bin/phpunit %:.<cr>

" }

" function! RunPhpTests() {
function! RunPhpTests()
    if &ft =~ "codeception"
        silent !clear
        echom "Start codeception tests..."
        "execute '!/usr/local/bin/php vendor/bin/codecept run % --no-colors --group active'
        execute '!vagrant ssh -c "cd vhosts/gonorthwebsites && php vendor/bin/codecept run functional --debug --group active"'
    elseif &ft =~ "phpunit"
        silent !clear
        echom "Start phpunit tests..."
        execute '!phpunit --groups active %:.'
    else
        echom "Sorry, I can't test this file."
    endif
endfunction
" }

" Laravel - Jeffery Way {
    " Concept - load underlying class for Laravel
    function! FacadeLookup()
        let facade = input('Facade Name: ')
        let classes = {
\           'Form': 'Html/FormBuilder.php',
\           'Html': 'Html/HtmlBuilder.php',
\           'File': 'Filesystem/Filesystem.php',
\           'Eloquent': 'Database/Eloquent/Model.php'
\       }

        execute ":edit vendor/laravel/framework/src/Illuminate/" .  classes[facade]
    endfunction


    " Prepare a new PHP class
    function! Class()
        let name = input('Class name? ')
        let namespace = input('Any Namespace? ')

        if strlen(namespace)
            exec 'normal i<?php namespace ' . namespace . ';
        else
            exec 'normal i<?php
        endif

        " Open class
        exec 'normal iclass ' . name . ' {}^[O^['

        exec 'normal i    public function __construct(){ }^['
    endfunction

    " Add a new dependency to a PHP class
    function! AddDependency()
        let dependency = input('Var Name: ')
        let namespace = input('Class Path: ')

        let segments = split(namespace, '\')
        let typehint = segments[-1]

        exec 'normal gg/construct:Hf)i, ' . typehint . ' $' . dependency . '^[/}^>O$this->^[a' . dependency . ' = $' . dependency . ';^[?{kOprotected $' . dependency . ';^[?{Ouse ' . namespace . ';^['

        " Remove opening comma if there is only one dependency
        exec 'normal :%s/(, /(/g
    '
    endfunction


    iabbrev <buffer> pft PHPUnit_Framework_TestCase

    cabbrev <buffer> gm !./artisan generate:model
    cabbrev <buffer> gc !./artisan generate:controller
    cabbrev <buffer> gmig !./artisan generate:migration

    " Laravel framework commons
    nnoremap <leader>lr :e app/routes.php<cr>
    nnoremap <leader>lca :e app/config/app.php<cr>81Gf(%0
    nnoremap <leader>lcd :e app/config/database.php<cr>
    nnoremap <leader>lc :e composer.json<cr>

    nmap <LocalLeader>fl :call FacadeLookup()<cr>
    nmap <LocalLeader>1 :call Class()<cr>
    nmap <LocalLeader>2 :call AddDependency()<cr>


    set wildignore+=*/vendor/**
    set wildignore+=*/public/forum/**

    " Testing
    " Extract variable for PHP
    nnoremap <LocalLeader>ev O<c-a> = <ESC>pa;

    " Extract method for PHP
    noremap <LocalLeader>em <ESC>F>lviw"ay/}<CR>o<ESC>protected function <ESC>"apa()<cr>return <ESC>"-pa;<CR>}<ESC>

    " var dump currently selected var
    nnoremap <LocalLeader>vd Bv2iwyodie(var_dump(<ESC>pa));<ESC>

    " vim-php-namespace
    inoremap <LocalLeader>u <C-O>:call PhpInsertUse()<CR>
    nnoremap <LocalLeader>u :call PhpInsertUse()<CR>

    inoremap <LocalLeader>e <C-O>:call PhpExpandClass()<CR>
    nnoremap <LocalLeader>e :call PhpExpandClass()<CR>
" }
let NERD_php_alt_style=1
