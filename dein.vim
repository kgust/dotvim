" vim: set et ts=2 sw=2 sts=2 foldmarker={{{,}}} foldlevel=0 foldmethod=marker spell:

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/Users/gustavkd/.config/nvim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/Users/gustavkd/.config/nvim'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:

" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" My bundles {{{
  call dein#add('kgust/snippet-templates')
" My bundles end }}}

" Replace Defaults {{{
  call dein#add('vim-scripts/matchit.zip')
  " call dein#add('tpope/vim-projectionist')
" My bundles end }}}

" Themes {{{
  call dein#add('altercation/vim-colors-solarized')
  " call dein#add('chriskempson/base16-vim')
  " call dein#add('NLKNguyen/papercolor-theme')
" My bundles end }}}

" vim-polyglot: A solid language pack for Vim
call dein#add('sheerun/vim-polyglot')
call dein#add('terryma/vim-multiple-cursors')
" call dein#add('edkolev/tmuxline.vim')

" FileTypes {{{
  " PHP
  call dein#add('alvan/vim-php-manual', { 'lazy': 1, 'on_ft': 'php' })
  " call dein#add('joonty/vim-phpqa', { 'lazy': 1, 'on_ft': 'php' })
  call dein#add('arnaud-lb/vim-php-namespace', { 'lazy': 1, 'on_ft': 'php' })
  call dein#add('afternoon/vim-phpunit', { 'lazy': 1, 'on_ft': 'php' })
  call dein#add('docteurklein/vim-symfony', { 'lazy': 1, 'on_ft': 'php' })
  call dein#add('rayburgemeestre/phpfolding.vim', { 'lazy': 1, 'on_ft': 'php' })
  call dein#add('tobyS/pdv', { 'lazy': 1, 'on_ft': 'php' })
  call dein#add('tobyS/vmustache', { 'lazy': 1, 'on_ft': 'php' })
  call dein#add('brookhong/DBGPavim', { 'lazy': 1, 'on_ft': 'php' })
  call dein#add('stephpy/vim-php-cs-fixer', { 'lazy': 1, 'on_ft': 'php' })
  call dein#add('dtedesigns/vim-cute-php', { 'lazy': 1, 'on_ft': 'php' })
  call dein#add('joshtronic/php.vim', { 'lazy': 1, 'on_ft': 'php' })
  " call dein#add('shawncplus/phpcomplete.vim', { 'lazy': 1, 'on_ft': 'php' })
  call dein#add('2072/PHP-Indenting-for-VIm', { 'lazy': 1, 'on_ft': 'php' })
  call dein#add('mkusher/padawan.vim')

  " Coffeescript
  " call dein#add('kchmck/vim-coffee-script', { 'lazy': 1, 'on_ft': 'coffeescript' })

  " HTML
  " call dein#add('mattn/emmet-vim', { 'lazy': 1, 'on_ft': ['html','htmljinja','php'] })
  call dein#add('tristen/vim-sparkup', { 'lazy': 1, 'on_ft': ['html','htmljinja','php'] })
  " call dein#add('rstacruz/sparkup', { 'lazy': 1, 'on_ft': 'html' })
  " call dein#add('othree/html5.vim', { 'lazy': 1, 'on_ft': 'html' })

  " Javascript
  call dein#add('pangloss/vim-javascript', { 'lazy': 1, 'on_ft': 'javascript' })
  call dein#add('dtedesigns/vim-cute-javascript', { 'lazy': 1, 'on_ft': 'javascript' })
  call dein#add('drslump/vim-syntax-js', { 'lazy': 1, 'on_ft': 'javascript' })

  " LESS
  call dein#add('groenewege/vim-less', { 'lazy': 1, 'on_ft': 'less' })

  " Markdown
  call dein#add('tpope/vim-markdown', { 'lazy': 1, 'on_ft': 'markdown' })
  " call dein#add('suan/vim-instant-markdown', { 'lazy': 1, 'on_ft': 'markdown' })

  " Potion
  call dein#add('kgust/vim-potion', { 'lazy': 1, 'on_ft': 'potion' })

  " SQL
  call dein#add('vim-scripts/SQLUtilities', { 'lazy': 1, 'on_ft': 'sql' })
  call dein#add('vim-scripts/dbext.vim', { 'lazy': 1, 'on_ft': 'sql' })
  call dein#add('kgust/sql.vim', { 'lazy': 1, 'on_ft': 'sql' })

  " Vimscript
  call dein#add('kana/vim-vspec', { 'lazy': 1, 'on_ft': 'vim' })
  call dein#add('tpope/vim-scriptease', { 'lazy': 1, 'on_ft': 'vim' })

  " Social
  " call dein#add('ironcamel/vimchat')
  " call dein#add('ryanss/vim-hackernews')

  " Utilities
  call dein#add('scrooloose/nerdtree', {'on_cmd': 'NERDTreeToggle'})
  call dein#add('tpope/vim-vinegar')
  call dein#add('tommcdo/vim-exchange')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('sjl/gundo.vim')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('zimbatm/direnv')
  call dein#add('vim-scripts/toggle_word.vim')
  " call dein#add('thinca/vim-fontzoom')
  call dein#add('vim-scripts/camelcasemotion')
  call dein#add('vim-scripts/mru.vim')
  call dein#add('vim-scripts/scratch.vim')
  call dein#add('ervandew/supertab')
  call dein#add('tsaleh/vim-align')
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')
  call dein#add('vim-scripts/renamer.vim')
  call dein#add('junegunn/vim-emoji')
  call dein#add('powerman/vim-plugin-AnsiEsc')
  " call dein#add('bling/vim-airline')
  call dein#add('itchyny/lightline.vim')
  " call dein#add('KabbAmine/gulp-vim')

  " External Programs
  " call dein#add('trammel/vim-conque')
  call dein#add('tpope/vim-dispatch')
  " call dein#add('zweifisch/pipe2eval')
  call dein#add('jgdavey/tslime.vim')
  call dein#add('junegunn/vim-github-dashboard')
  call dein#add('jaxbot/github-issues.vim')
  call dein#add('mattn/webapi-vim')
  call dein#add('mattn/gist-vim')
  " call dein#add('neilagabriel/vim-geeknote')
  call dein#add('wakatime/vim-wakatime')

  " Development
  " call dein#add('vim-scripts/adt.vim')
  call dein#add('Raimondi/delimitMate')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  call dein#add('gregsexton/gitv')
  " call dein#add('tpope/nerdcommenter')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('scrooloose/syntastic')
  " call dein#add('jebberjeb/vim-pivotal-tracker')
  call dein#add('https://github.com/khadiwala/wundervim')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')

  " call dein#add('xolox/vim-misc')
  " call dein#add('xolox/vim-shell')
  " call dein#add('xolox/vim-easytags') " requires vim-misc and vim-shell

  call dein#add('mhinz/vim-startify')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('sickill/vim-pasta')
  " call dein#add('tpope/vim-sensible')
  call dein#add('majutsushi/tagbar')
  call dein#add('sjl/splice.vim')

  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('Shougo/unite.vim')

  call dein#add('ludovicchabant/vim-gutentags')

  call dein#add('Shougo/deoplete.nvim')

  " call dein#add('othree/eregex.vim', {'on_func': 'eregex#toggle'})


" My bundles end }}}

" My bundles {{{
  call dein#add('kgust/snippet-templates')
" My bundles end }}}

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
