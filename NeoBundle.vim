""""""""""""
" EXAMPLES "
""""""""""""


"""""""""""
" KG Mine "
"""""""""""
NeoBundle 'kgust/snippet-templates'
NeoBundle 'kgust/vim-potion'

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
"NeoBundle 'shawncplus/phpcomplete.vim'
"NeoBundle 'm2mdas/phpcomplete-extended'
"NeoBundle 'm2mdas/phpcomplete-extended-laravel'
"NeoBundle 'm2mdas/phpcomplete-extended-symfony'
"NeoBundle '2072/PHP-Indenting-for-VIm'

" Coffeescript
NeoBundleLazy 'kchmck/vim-coffee-script'

" HTML
"NeoBundle 'mattn/emmet-vim'
NeoBundle 'tristen/vim-sparkup'
"NeoBundle 'othree/html5.vim'

" Javascript
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'drslump/vim-syntax-js'
NeoBundle 'dtedesigns/vim-cute-javascript'

" LESS
NeoBundle 'groenewege/vim-less'

" Markdown
"NeoBundle 'tpope/vim-markdown'
"NeoBundle 'suan/vim-instant-markdown'

" Polyglot
NeoBundle 'sheerun/vim-polyglot'

" SQL
NeoBundle 'vim-scripts/SQLUtilities'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'kgust/sql.vim'

" Vimscript
" NeoBundle 'kana/vim-vspec'
NeoBundle 'tpope/vim-scriptease'


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
NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'vim-scripts/camelcasemotion'
NeoBundle 'vim-scripts/mru.vim'
NeoBundle 'vim-scripts/scratch.vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'Valloric/YouCompleteMe', {
\ 'build' : {
\     'linux' : './install.sh',
\     'mac' : './install.sh',
\    },
\ }
NeoBundle 'tsaleh/vim-align'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'vim-scripts/renamer.vim'
NeoBundle 'junegunn/vim-emoji'
NeoBundle 'powerman/vim-plugin-AnsiEsc'

" External Programs
NeoBundle 'trammell/vim-conque'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'zweifisch/pipe2eval'
NeoBundle 'jgdavey/tslime.vim'
NeoBundle 'junegunn/vim-github-dashboard'
NeoBundle 'jaxbot/github-issues.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'neilagabriel/vim-geeknote'
"   - Android
"NeoBundle 'vim-scripts/adt.vim'

" Development
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
" NeoBundle 'scrooloose/nerdcommenter'
" NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-commentary'
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
NeoBundle 'tpope/vim-speeddating'

NeoBundle 'sjl/splice.vim'

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
