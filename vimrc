" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
" }

" Required {
    set nocompatible               " be iMproved
    filetype off                   " required!

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " Vundle Bundles
    source ~/.vim/repos.vim
" }
" General {
    filetype plugin on            " required!
    filetype plugin indent on     " required!
    scriptencoding utf-8
    set autowrite
    set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
    set hidden                      " Turn on hidden mode
    set undofile                    " Turn on undofile functionality
    " Setting up the directories {
        set backup                         " backups are nice ...
        set backupdir=$HOME/.vimbackup     " but not when they clog .
        set directory=$HOME/.vimswap       " Same for swap files
        set viewdir=$HOME/.vimviews        " same for view files
        set undodir=$HOME/.vimundo         " same for undo files

        " Creating directories if they don't exist
        silent execute '!mkdir -p $HOME/.vimbackup'
        silent execute '!mkdir -p $HOME/.vimswap'
        silent execute '!mkdir -p $HOME/.vimviews'
        silent execute '!mkdir -p $HOME/.vimundo'
        "au BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
        "au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)
    " }
" }

" UI Settings {
    "color desert256
    set tabpagemax=15               " only show 15 tabs
    set showmode                    " display the current mode

    set cursorline                  " highlight current line
    hi cursorline guibg=#333333     " highlight bg color of current line
    hi CursorColumn guibg=#333333   " highlight cursor

    set splitright                  " I want vertical windows to open on the right
    "set splitbelow                  " I want horizontal windows to open on the bottom

    if has('cmdline_info')
        set ruler                   " show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
        set showcmd                 " show partial commands in status line and
                                    " selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2             " show statusline always
        " Use the commented line if fugitive isn't installed
        "set statusline=%<%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P " a statusline, also on steroids
    endif

    set backspace=indent,eol,start   " backspace for dummys
    set linespace=0                  " No extra spaces between rows
    set number                       " Line numbers on
    "set relativenumber              " Turn on relative number mode
    set showmatch                    " show matching brackets/parenthesis
    set incsearch                    " find as you type search
    set hlsearch                     " highlight search terms
    set winminheight=0               " windows can be 0 line high
    set ignorecase                   " case insensitive search
    set smartcase                    " case sensitive when uc present
    set wildmenu                     " show list instead of just completing
    set wildmode=list:longest,full   " comand <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]    " backspace and cursor keys wrap to
    set scrolljump=5                 " lines to scroll when cursor leaves screen
    set scrolloff=3                  " minimum lines to keep above and below cursor
    set foldenable                   " auto fold code
    set gdefault                     " the /g flag on :s substitutions by default
    set switchbuf=usetab             " when opening a buffer from the list, use existing window first
    set colorcolumn=80               " visible wrap here/long line indicator
    hi ColorColumn ctermbg=darkgray guibg=darkgray " Change the ColorColumn to lightgray

    " u+2294 ⊔  u+231f ⌟  u+00bb »  u+2422 ␢  u+27ab ➫  u+2022 •  u+2027 ‧
    " u+2056 ⁖
    set list
    set listchars=trail:⁖,nbsp:⊔,tab:➫•

    if has('gui_running')
    " GVIM (here instead of .gvimrc) {
        "set guifont=Inconsolata\ 12
        set guifont=Inconsolata-dz\ for\ Powerline
        let g:Powerline_symbols = 'fancy'
        set background=light              " Assume a light background
        colorscheme solarized
        set guioptions-=T                  " remove the toolbar
        highlight Pmenu guibg=brown gui=bold
    " }
    else
    " Console Only VIM Settings {
        " Fix console Vim, which was giving A B C D when using arrow keys in
        " insert mode.
        set term=linux
    " }
    endif
    " Formatting {
        set wrap                         " wrap long lines
        set autoindent                   " indent at the same level of the previous line
        set shiftwidth=4                 " use indents of 4 spaces
        set expandtab                    " tabs are tabs, not spaces
        set tabstop=4                    " an indentation every four columns
        set matchpairs+=<:>              " match, to be used with %
        set pastetoggle=<F12>            " pastetoggle (sane indentation on pastes)
        "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
        "set foldmethod=syntax
    " }
    " Key Mappings {

        " Easier moving in tabs and windows
        map <C-H> <C-W>h
        map <C-J> <C-W>j
        map <C-K> <C-W>k
        map <C-L> <C-W>l
        map <S-H> gT
        map <S-L> gt

        " Yank from the cursor to the end of the line, to be consistent with C and D.
        nnoremap Y y$

        " clear highlighted seaches
        nnoremap <CR> :noh<CR><CR>

        " Buffers and Tabs
        map <C-Up> :bprev<CR>
        map <C-Down> :bnext<CR>
        "map <Left> :tabprev<CR>
        "map <Right> :tabnext<CR>

        " Shortcut mappings
        vmap Q gq
        nmap Q gqap

        " Shortcuts
        " Change Working Directory to that of the current file
        cmap cwd lcd %:p:h

        " Quickly enter paste mode
        set pastetoggle=<F2>

        " Save a write protected file when you forgot sudo
        cmap w!! w !sudo tee % >/dev/null

        " Map Esc alternatives
        imap ;; <Esc>
        "imap jj <Esc>

        " Use regular regexp for searches
        "nnoremap / /\v
        "vnoremap / /\v

        " Make tab key bounce between matches like '%'
        nnoremap <tab> %
        vnoremap <tab> %

        nmap S  :%s//<Left>
        vmap S  :%s//<Left>

        nnoremap ;; :s/\([^;]\)$/\1;/<CR>

        " Leader Key Mappings {
            " Firstly, define the <leader> key
            let mapleader = ","

            " This should be moved to a Textile specific config file
            nnoremap <leader>1 yypVr=

            " Strip all trailing whitespace in the current file
            nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

            " fold HMTL tag
            nnoremap <leader>ft Vatzf

            " sort CSS properties
            "nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
            nnoremap <leader>S Vi{:sort<CR>:noh<CR> "}

            " re-highlight text just pasted
            nnoremap <leader>v V`]

            " edit .vimrc in a vertical window
            nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

            " switch to alternate buffer
            nmap <silent><leader>, :buffer#<CR>

        " }
    " }
" }

" Vim Plugins {

    " AlignMaps {
        let g:DrChipTopLvlMenu= "&Plugin."
    " }
    " CoffeeScript {
        let coffee_compile_vert = 1
        au BufWritePost *.coffee silent CoffeeMake! | cwindow | redraw!
        au BufNewFile,BufReadPost *.coffee setl foldmethod=indent sw=2 et
    " }
    " Ctags {
        set tags=./tags;/,~/.vimtags
    " }
    " CtrlP {
        let g:ctrlp_map = '<C-p>'
        let g:ctrlp_working_path_mode = 2
        let g:ctrlp_clear_cache_on_exit = 1
        let g:ctrlp_max_files = 10000
        let g:ctrlp_max_depth = 30

        let g:ctrlp_user_command = {
            \ 'types': {
                \ 1: ['.git/', 'cd %s && git ls-files'],
                \ },
            \ 'fallback': 'find %s -type f'
        \ }

        let g:ctrlp_custom_ignore = {
          \ 'dir':  '\.git$\|\.svn$\|cache$\|log$\|vendor$\|build$',
          \ 'file': '\.sw?$\|\.exe$\|\.so$\|\.dll$',
          \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
          \ }

        let g:ctrlp_extensions = [
        \    'tag',
        \ ]
    " }
    " dbext {
        source ~/.vim/dbext.vim
    " }
    " dbgPavim {
        let g:dbgPavimPort = 9009
        let g:dbgPavimBreakAtEntry = 0
    " }
    " fontzoom {
        let g:fontzoom_no_default_key_mappings = 1
        silent! nmap <unique> <silent> = <Plug>(fontzoom-larger)
        silent! nmap <unique> <silent> - <Plug>(fontzoom-smaller)
        silent! nmap <unique> <silent> <C-ScrollWheelUp> <Plug>(fontzoom-larger)
        silent! nmap <unique> <silent> <C-ScrollWheelDown> <Plug>(fontzoom-smaller)
    " }
    " Fugitive {
        "let g:fugitive_git_executable = 'myGit'

        if has('statusline')
            set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
        endif

        autocmd BufReadPost fugitive://* set bufhidden=delete

        autocmd User fugitive
          \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
          \   nnoremap <buffer> .. :edit %:h<CR> |
          \ endif
    " }
    " Gundo {
        nnoremap <Leader>g :GundoToggle<CR>
        "let g:gundo_width = 60
        "let g:gundo_preview_height = 40
        let g:gundo_right = 1
    " }
    " Misc {
        let g:checksyntax_auto = 0

        "comment out line(s) in visual mode
        vmap  o  :call NERDComment(1, 'toggle')<CR>
        let g:NERDShutUp=1

        let b:match_ignorecase = 1

        let g:solarized_contrast='normal'
        let g:solarized_visibility='low'

        " Detect jQuery plugins
        autocmd BufNewFile,BufRead *.plugin.js set filetype=javascript syntax=jquery
        autocmd BufNewFile,BufRead jquery.*.js set filetype=javascript syntax=jquery

        " Detect twig filetype
        autocmd BufNewFile,BufRead *.twig set filetype=jinja2 sw=4 ts=4 sts=4 et

        " Set defaults for PHP files
        autocmd BufNewFile,BufRead *.php set sw=4 ts=4 sts=4 et

        " Make sure help set properly for PHP files
        autocmd FileType php set kp=:help
    " }
    " NerdCommenter {
        let g:NERDCustomDelimiters = {
                \ 'rubyX': { 'left': '#', 'leftAlt': 'FOO', 'rightAlt': 'BAR' },
                \ 'grondle': { 'left': '{{', 'right': '}}' },
                \ 'sql': { 'left': '-- ' },
                \ 'jinja2': { 'left': '<!--', 'right': '-->' }
            \ }

    " }
    " OmniComplete {
        "if has("autocmd") && exists("+omnifunc")
            "autocmd Filetype *
                "\if &omnifunc == "" |
                "\setlocal omnifunc=syntaxcomplete#Complete |
                "\endif
        "endif

        " Popup menu hightLight Group
        "highlight Pmenu     ctermbg=13     guibg=DarkBlue
        highlight PmenuSel     ctermbg=7     guibg=DarkBlue         guifg=LightBlue
        "highlight PmenuSbar ctermbg=7     guibg=DarkGray
        "highlight PmenuThumb             guibg=Black

        hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
        hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
        hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

        " some convenient mappings
        inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
        inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
        inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        inoremap <expr> <C-d>        pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
        inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

        " automatically open and close the popup menu / preview window
        au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        set completeopt=menu,longest,preview
    " }
    " PDV PHPDoc Support {
        let g:DisableAutoPHPFolding = 0

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

        inoremap <Leader>pd <ESC>:call PhpDocSingle()<CR>i
        nnoremap <Leader>pd :call PhpDocSingle()<CR>
        vnoremap <Leader>pd :call PhpDocRange()<CR>

        ""let b:match_words = b:match_words . ',{:},(:),[:]'
        map <Leader>ff :EnableFastPHPFolds<CR>
    " }
    " PHP Namespace {
    " TODO This should be effective for PHP files only!
        imap <buffer><leader>ns <C-O>:call PhpInsertUse()><CR>
        "imap <Leader>ns <C-O>:call PhpInsertUse()><CR>
        map <buffer><leader>ns :call PhpInsertUse()><CR>
        "map <Leader>ns :call PhpInsertUse()><CR>
    " }
    " PhpQA {
        let g:phpqa_messdetector_ruleset = "/home/kgustavson/workspace/symfony2/phpmd.xml"
        let g:phpqa_codesniffer_args = "--standard=Symfony2"

        " All of these are default = 1
        "let g:phpqa_messdetector_autorun = 0
        "let g:phpqa_codesniffer_autorun = 0
        "let g:phpqa_codecoverage_autorun = 0

        " Stop the location list opening automatically
        let g:phpqa_open_loc = 0

        " Clover code coverage XML file
        let g:phpqa_codecoverage_file = "/home/kgustavson/workspace/symfony2/build/logs/clover.xml"
        " Show markers for lines that ARE covered by tests (default = 1)
        "let g:phpqa_codecoverage_showcovered = 0
    " }
    " PHPUnit {
        " http://knplabs.com/blog/boost-your-productivity-with-sf2-and-vim
        " phpunit compilation
        com! -nargs=* Phpunit make -c app <q-args> | cw
        nnoremap <Leader>pu :Phpunit %<CR>
        nnoremap <Leader>pua :Phpunit<CR>
    " }
    " Scratch {
        function! ToggleScratch()
          if expand('%') == g:ScratchBufferName
            quit
          else
            Sscratch
          endif
        endfunction

        nnoremap <Leader>sc :call ToggleScratch()<CR>
        nnoremap <Leader>ss :Sscratch<CR>
        nnoremap <Leader>as :AddtoScratch<CR>
    " }
    " SnipMate {
        "let loaded_snips = 1 " Disable the plugin

        " Setting the author var
        let g:snips_author = 'Kevin Gustavson <kgust@pobox.com>'
        " Shortcut for reloading snippets, useful when developing
        nnoremap ,smr <esc>:exec ReloadAllSnippets()<cr>
    " }
    " SQLUtilities {
        let g:sqlutil_align_comma = 1
        let g:sqlutil_align_first_word = 1
        let g:sqlutil_align_keyword_right = 1
        let g:sqlutil_keyword_case = '\U'

        " Set the DB type
        let g:sql_type_default = 'mysql'
    " }
    " Supertab {
        let g:SuperTabDefaultCompletionType = "context"
        let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
    " }
    " Symfony {
        " disable the mapping of Symfony's console
        let g:symfony_enable_shell_mapping = 0
        " remap it (default is <C-F>)
        "map <Leader>sfc :execute ":!"g:symfony_enable_shell_cmd<CR>

        " first set path
        set path+=**

        " jump to a twig view in symfony
        function! s:SfJumpToView()
            mark C
            normal! ]M
            let end = line(".")
            normal! [m
            try
                call search('\v[^.:]+\.html\.twig', '', end)
                normal! gf
            catch
                normal! g`C
                echohl WarningMsg | echomsg "Template file not found" | echohl None
            endtry
        endfunction
        com! SfJumpToView call s:SfJumpToView()

        " create a mapping only in a Controller file
        autocmd BufEnter *Controller.php nmap <buffer><leader>v :SfJumpToView<CR>

        nmap <leader>ve :call PhpStackTrace()<CR>
    " }
    " Syntax -- Move this out? {
        let conceallevel=2
        let concealcursor=""

        let g:syntax_js=['function', 'return', 'solarized']
    " }
    " UltiSnips {
        let g:UltiSnipsSnippetsDir="~/.vim/bundle/kgust-ultisnips/UltiSnips"
    " }
    " VimOrganizer {
        au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
        au BufEnter *.org call org#SetOrgFileType()

        let g:org_tags_alist='@home(h) @celltrak(c) @dtedesigns(d) easy(e) hard(r)'
        let g:org_todo_setup='TODO NEXT STARTED | DONE CANCEL'
        let g:agenda_select_dirs=["~/Dropbox/Documents/VimOrg"]
        "let g:agenda_files = split(glob("~/Dropbox/Documents/VimOrg/*.org"),"\n")

        " open VimOrganizerNotes.org in a vertical window
        nnoremap <leader>vo <C-w><C-v><C-l>:e ~/Dropbox/Documents/VimOrg/<cr>
    " }
    " ZenCoding {
        let g:user_zen_settings = {
        \    'php' : {
        \        'extends' : 'html',
        \        'filters' : 'c',
        \    },
        \    'xml' : {
        \        'extends' : 'html',
        \    },
        \    'haml' : {
        \        'extends' : 'html',
        \    },
        \}
    " }

" }
" Windows Compatible -- Keeping for the fun of it {
    " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
    " across (heterogeneous) systems easier.
    if has('win32') || has('win64')
        set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    endif
" }

