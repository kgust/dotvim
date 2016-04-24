" FileType settings for PHP

" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:

setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
setlocal colorcolumn=80,120

set commentstring=//\ %s

let g:phpcomplete_index_composer_command="composer"
"let NERD_php_alt_style=1

" Automatically strip trailing spaces in PHP files when reading/writing
augroup whitespace
    autocmd BufWritePre *.php call util#strip_trailing()
augroup END

" runtimepath loads plugins after .vim {
    syntax match phpNiceOperator "::" conceal cchar=∷ contained containedin=phpRegion
    syntax match phpNiceOperator "=>" conceal cchar=⇛ contained containedin=phpRegion
    syntax match phpNiceRelation "=>" conceal cchar=➮ contained containedin=phpRegion
    syntax match phpNiceMemberSelector "\->" conceal cchar=→ contained containedin=phpRegion
    syntax match phpNiceMethodsVar "\->" conceal cchar=→ contained containedin=phpRegion
" }


"let b:match_words = b:match_words . ',{:},(:),[:]'
nnoremap <LocalLeader>ff :EnableFastPHPFolds<CR>
vnoremap <LocalLeader>ff :EnableFastPHPFolds<CR>

" PDV 2 PHPDoc Support {
    "let g:pdv_template_dir = $HOME."/.vim/bundle/pdv/templates"
    let g:PHP_removeCRwhenUnix = 1             " 0 is default
    let g:PHP_BracesAtCodeLevel = 0            " 0 is default
    let g:PHP_vintage_case_default_indent = 0  " 0 is default
    nnoremap <LocalLeader>d :call pdv#DocumentWithSnip()<CR>
    nnoremap <buffer> <LocalLeader>pd :call pdv#DocumentWithSnip()<CR>
" }

" PHP Namespace {
    inoremap <buffer><LocalLeader>ns <C-O>:call PhpInsertUse()><CR>
    noremap <buffer><LocalLeader>ns :call PhpInsertUse()><CR>

    inoremap <LocalLeader>u <C-O>:call PhpInsertUse()<CR>
    nnoremap <LocalLeader>u :call PhpInsertUse()<CR>

    inoremap <LocalLeader>e <C-O>:call PhpExpandClass()<CR>
    nnoremap <LocalLeader>e :call PhpExpandClass()<CR>

    noremap <silent> <F1> :call util#OnlineDoc()<CR>
    inoremap <silent> <F1> <ESC>:call util#OnlineDoc()<CR>
" }

" PhpQA {
    " let g:phpqa_messdetector_ruleset = $HOME."/workspace/symfony2/phpmd.xml"
    let g:phpqa_codesniffer_args = "--standard=psr2"

    " All of these are default = 1
    let g:phpqa_messdetector_autorun = 0
    let g:phpqa_codesniffer_autorun = 0
    let g:phpqa_codecoverage_autorun = 0

    " Stop the location list opening automatically
    "let g:phpqa_open_loc = 0

    " Clover code coverage XML file
    " let g:phpqa_codecoverage_file = $HOME."/workspace/symfony2/build/logs/clover.xml"
    " Show markers for lines that ARE covered by tests (default = 1)
    "let g:phpqa_codecoverage_showcovered = 0

    " Additional Mappings
    nnoremap <LocalLeader>pmd :Phpmd<cr>
    nnoremap <LocalLeader>pcs :Phpcs<cr>
    nnoremap <LocalLeader>pcc :Phpcc<cr>

    "nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
    "nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
    let g:php_cs_fixer_path = "php-cs-fixer" " define the path to the php-cs-fixer.phar
    let g:php_cs_fixer_level = "all"               " which level ?
    let g:php_cs_fixer_config = "default"          " configuration
    let g:php_cs_fixer_php_path = "php"            " Path to PHP
    "let g:php_cs_fixer_fixers_list = ""            " List of fixers
    let g:php_cs_fixer_enable_default_mapping = 1  " Enable the mapping by default (<leader>pcd)
    let g:php_cs_fixer_dry_run = 0                 " Call command with dry-run option
    let g:php_cs_fixer_verbose = 0                 " Return the output of command if 1, else an inline information.
" }

" Syntax Checking {
    let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
    let g:syntastic_check_on_open = 1
    let g:syntastic_php_phpcs_args = "--report=csv --standard=psr2"
" }

" Testing {
    " http://knplabs.com/blog/boost-your-productivity-with-sf2-and-vim
    " phpunit compilation
    "com! -nargs=* Phpunit make -c app <q-args> | cw
    "nnoremap <Leader>pu :Phpunit %<CR>
    "nnoremap <Leader>pua :Phpunit<CR>

    " Test a method
    nnoremap <LocalLeader>m yiw:!phpunit --filter <c-r>"<CR>
    nnoremap <LocalLeader>t :call php#run_tests()<cr>
    nnoremap test :call php#run_tests()<cr>
" }

" Laravel - Jeffery Way {

    iabbrev <buffer> pft PHPUnit_Framework_TestCase

    " cabbrev <buffer> gm !./artisan generate:model
    " cabbrev <buffer> gc !./artisan generate:controller
    " cabbrev <buffer> gmig !./artisan generate:migration

    " Laravel framework commons
    " nnoremap <leader>lr :e app/routes.php<cr>
    " nnoremap <leader>lca :e app/config/app.php<cr>81Gf(%0
    " nnoremap <leader>lcd :e app/config/database.php<cr>
    " nnoremap <leader>lc :e composer.json<cr>

    " nmap <LocalLeader>fl :call php#FacadeLookup()<cr>
    " nmap <LocalLeader>1 :call php#Class()<cr>
    " nmap <LocalLeader>2 :call php#AddDependency()<cr>

    " set wildignore+=*/vendor/**
    set wildignore+=*/public/forum/**

    " Extract variable for PHP
    nnoremap <LocalLeader>ev O<c-a> = <ESC>pa;

    " Extract method for PHP
    noremap <LocalLeader>em <ESC>F>lviw"ay/}<CR>o<ESC>protected function <ESC>"apa()<cr>return <ESC>"-pa;<CR>}<ESC>

    " var dump currently selected var
    nnoremap <LocalLeader>vd Bv2iwyodie(var_dump(<ESC>pa));<ESC>
" }

# Start the Padawan Server
call padawan#RestartServer()
