" ~/.vim/ftplugin/behat.vim

" b:behat_cmd_args let you add arguments to the behat command.
" This is useful if you use profiles, or/and a different config file.
"let b:behat_cmd_args = '-c path/to/behat.yml'
"let b:behat_cmd_args = '-p vim %'
"let b:behat_cmd_args = '-p vim'
"let b:behat_cmd_args = '-c behat.yml'

" This variable is bound to the current buffer, so it let you add custom logic
" to define it.
" For instance, you can set a profile according to features location:
if match(expand('%:h'), 'features\/foo') != -1
    let b:behat_cmd_args = '-p foo'
elseif match(expand('%:h'), 'features\/bar') != -1
    let b:behat_cmd_args = '-p bar'
endif

" add this to automatically set the behat compiler (slows down buffer loading)
compiler behat
