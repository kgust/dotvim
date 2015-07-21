" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
set nocompatible
filetype off

" NeoBundle Auto-install {
    " Setting up Vundle - the vim plugin bundler
    " Credit: http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
    let iCanHazVundle=1
    let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
    if !filereadable(neobundle_readme)
        echo "Installing neobundle.vim."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
        let iCanHazVundle=0
    endif
" }

" NeoBundle Required Section {
    " Note: Skip initialization for vim-tiny or vim-small
    if !1 | finish | endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    " Required:
    call neobundle#begin(expand('~/.vim/bundle/'))

    " Let NeoBundle manage NeoBundle
    " Required:
    NeoBundleFetch 'Shougo/neobundle.vim'

    call neobundle#end()

    " Required:
    filetype plugin indent on

    " If there are uninstalled bundles found on startup,
    " this will conveniently prompt you to install them.
    NeoBundleCheck
" }


""""""""""""
" EXAMPLES "
""""""""""""


"""""""""""
" KG Mine "
"""""""""""
NeoBundle 'kgust/snippet-templates'

""""""""""""""""""""""
" $VIMRUNTIME        "
" - Replace Defaults "
""""""""""""""""""""""
NeoBundle 'vim-scripts/matchit.zip'
"NeoBundle 'tpope/vim-projectionist'
NeoBundle 'tobyS/vmustache'

"""""""""""
" GENERAL "
"""""""""""

" Colors
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'chriskempson/base16-vim'

" Polyglot
NeoBundle 'sheerun/vim-polyglot'

NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'edkolev/tmuxline.vim'

"""""""""""""
" FILETYPES "
"""""""""""""

" PHP
NeoBundleLazy 'joonty/vim-phpqa'
NeoBundleLazy 'arnaud-lb/vim-php-namespace'
NeoBundleLazy 'afternoon/vim-phpunit'
NeoBundleLazy 'docteurklein/vim-symfony'
NeoBundleLazy 'rayburgemeestre/phpfolding.vim'
NeoBundleLazy 'veloce/vim-behat'
NeoBundleLazy 'tobyS/pdv'
NeoBundleLazy 'brookhong/DBGPavim'
NeoBundleLazy 'stephpy/vim-php-cs-fixer'
NeoBundleLazy 'dtedesigns/vim-cute-php'
NeoBundleLazy 'joshtronic/php.vim'
NeoBundleLazy 'xsbeats/vim-blade'
"NeoBundleLazy 'shawncplus/phpcomplete.vim'
"NeoBundleLazy 'm2mdas/phpcomplete-extended'
"NeoBundleLazy 'm2mdas/phpcomplete-extended-laravel'
"NeoBundleLazy 'm2mdas/phpcomplete-extended-symfony'
"NeoBundleLazy '2072/PHP-Indenting-for-VIm'

" Coffeescript
NeoBundleLazy 'kchmck/vim-coffee-script'

" HTML
"NeoBundle 'mattn/emmet-vim'
NeoBundle 'tristen/vim-sparkup'
"NeoBundle 'rstacruz/sparkup'
"NeoBundle 'othree/html5.vim'

" Javascript
NeoBundleLazy 'pangloss/vim-javascript'
NeoBundleLazy 'dtedesigns/vim-cute-javascript'
NeoBundleLazy 'drslump/vim-syntax-js'

" LESS
NeoBundleLazy 'groenewege/vim-less'

" Markdown
"NeoBundleLazy 'tpope/vim-markdown'
"NeoBundleLazy 'suan/vim-instant-markdown'

" Potion
NeoBundleLazy 'kgust/vim-potion'

" SQL
NeoBundleLazy 'vim-scripts/SQLUtilities'
NeoBundleLazy 'vim-scripts/dbext.vim'
NeoBundleLazy 'kgust/sql.vim'

" Vimscript
NeoBundleLazy 'kana/vim-vspec'
NeoBundleLazy 'tpope/vim-scriptease'


""""""""""
" SOCIAL "
""""""""""
" NeoBundle 'ironcamel/vimchat'
NeoBundle 'ryanss/vim-hackernews'


"""""""""""""
" UTILITIES "
"""""""""""""

" Usage
" NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'zimbatm/direnv'
NeoBundle 'vim-scripts/toggle_word.vim'
"NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'vim-scripts/camelcasemotion'
NeoBundle 'vim-scripts/mru.vim'
NeoBundle 'vim-scripts/scratch.vim'
NeoBundle 'ervandew/supertab'
" NeoBundle 'Valloric/YouCompleteMe', {
" \ 'build' : {
" \     'linux' : './install.sh',
" \     'mac' : './install.sh',
" \    },
" \ }
NeoBundle 'tsaleh/vim-align'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'vim-scripts/renamer.vim'
NeoBundle 'junegunn/vim-emoji'
NeoBundle 'powerman/vim-plugin-AnsiEsc'
NeoBundleLazy 'bling/vim-airline'
NeoBundleLazy 'itchyny/lightline.vim'

" External Programs
NeoBundle 'trammell/vim-conque'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'zweifisch/pipe2eval'
NeoBundle 'jgdavey/tslime.vim'
"NeoBundle 'junegunn/vim-github-dashboard'
"NeoBundle 'jaxbot/github-issues.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'neilagabriel/vim-geeknote'
" - Android
"NeoBundle 'vim-scripts/adt.vim'

" Development
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
" NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tomtom/tcomment_vim'
" NeoBundle 'tpope/vim-commentary'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'

"easytags requires vim-misc and vim-shell
" NeoBundle 'xolox/vim-misc'
" NeoBundle 'xolox/vim-shell'
" NeoBundle 'xolox/vim-easytags'

NeoBundle 'mhinz/vim-startify'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'sickill/vim-pasta'

"NeoBundle 'tpope/vim-sensible'
NeoBundle 'majutsushi/tagbar'
"NeoBundle 'tpope/vim-speeddating'

NeoBundleLazy 'sjl/splice.vim'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/unite.vim'
