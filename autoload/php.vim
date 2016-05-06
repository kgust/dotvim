function! php#run_tests()
    if exists('$VENDORBIN')
        let s:vendorbin = $VENDORBIN
    else
        let s:vendorbin = "./bin"
    endif

    if &ft =~ "codeception"
        let g:php_last_test = "\nclear && ".s:vendorbin."/codecept run ".expand("%:.")."\n"
        call SendToTmux(g:php_last_test)
        redraw!
        echom "Start codeception tests..."
    elseif &ft =~ "phpunit"
        " execute '!phpunit --groups active %:.'
        let g:php_last_test = "\nclear && ".s:vendorbin."/phpunit --debug -c app **/".expand("%:.")."\n"
        " let g:php_last_test = "\nclear && ".s:vendorbin."/codecept run ".expand("%:.")."\n"
        call SendToTmux(g:php_last_test)
        redraw!
        echom "Start phpunit tests..."
    else
        " Fall back to last test run
        if exists('g:php_last_test')
            call SendToTmux(g:php_last_test)
            redraw!
            echom "Running last test..."
        else
            call SendToTmux("\nclear && ".s:vendorbin."/codecept run functional\n")
            redraw!
            echom "Running codeception functional tests (default)..."
        endif
    endif
endfunction

function php#OnlineDoc()
    let s:wordUnderCursor = expand("<cword>")

    if &ft =~ "php"
        let s:url = "http://php.net/" . s:wordUnderCursor
    else
        execute "help " . s:wordUnderCursor
        return
    endif

    let s:command = "silent !open " . s:url
    execute s:command
endfunction


" Laravel - Jeffery Way {

    " Concept - load underlying class for Laravel
    function! php#FacadeLookup()
        let facade = input('Facade Name: ')
        let classes = {
    \       'Form': 'Html/FormBuilder.php',
    \       'Html': 'Html/HtmlBuilder.php',
    \       'File': 'Filesystem/Filesystem.php',
    \       'Eloquent': 'Database/Eloquent/Model.php'
    \   }

        execute ":edit vendor/laravel/framework/src/Illuminate/" .  classes[facade]
    endfunction


    " Prepare a new PHP class
    function! php#Class()
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
    function! php#AddDependency()
        let dependency = input('Var Name: ')
        let namespace = input('Class Path: ')

        let segments = split(namespace, '\')
        let typehint = segments[-1]

        exec 'normal gg/construct:Hf)i, ' . typehint . ' $' . dependency . '^[/}^>O$this->^[a' . dependency . ' = $' . dependency . ';^[?{kOprotected $' . dependency . ';^[?{Ouse ' . namespace . ';^['

        " Remove opening comma if there is only one dependency
        exec 'normal :%s/(, /(/g
    '
    endfunction
" }
