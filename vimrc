" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
" }

" Vim-Flavor {
    runtime flavors/bootstrap.vim
" }

" General Settings {
    let s:uname = system('uname') " What system am I using?

    set nrformats-=octal	      " Don't treat numbers with leading zeros as octal
    filetype plugin on            " required!
    filetype plugin indent on     " required!
    scriptencoding utf-8
    set encoding=utf-8
    syntax on
    set autowrite
    set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
    set hidden                      " Turn on hidden mode
    set undofile                    " Turn on undofile functionality
    set autoread                    " If an unedited file is changed on disk,
                                   "   automatically reload it
    set smarttab
    "set shell=bash\ -i              " Use bash as vim's default shell
    
    " 256 colors
    set t_Co=256
    let g:Powerline_symbols = 'fancy'
    set background=light
    colorscheme solarized

    " Set the autocommand group and remove existing mappings
    augroup Vimrc
        autocmd!

        " Testing autocmd statements
        "set verbose=9
    augroup END

    " Set up the directories {
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
        "autocmd Vimrc BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
        "autocmd Vimrc BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)
    " }
" }

" User Interface Settings {
    set tabpagemax=15               " only show 15 tabs
    set showmode                    " display the current mode

    set splitright                  " I want vertical windows to open on the right
    "set splitbelow                  " I want horizontal windows to open on the bottom

    " Make yank use the "+ register
    "set clipboard=unnamedplus

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
    set linespace=2                  " spaces between rows
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
    "set foldenable                   " auto fold code
    "set foldlevel=3                  " fold three or more lines
    set gdefault                     " the /g flag on :s substitutions by default
    set switchbuf=usetab             " when opening a buffer from the list, use existing window first
    set colorcolumn=80               " visible wrap here/long line indicator
    set visualbell                   " visible alerts
    set ttyfast                      " disable for slow terminals

    " Colors and Listchars {
    set cursorline                  " highlight current line
    highlight clear CursorLine
    "highlight cursorline guibg=#333333     " highlight bg color of current line
    highlight CursorLine gui=underline guisp=lightgray

    "highlight CursorColumn guibg=#333333   " highlight cursor
    highlight ColorColumn ctermbg=lightgray guibg=lightgray " Change the ColorColumn to lightgray

    " u+2294 ⊔  u+231f ⌟  u+00bb »  u+2422 ␢  u+27ab ➫  u+2022 •  u+2027 ‧
    " u+2056 ⁖
    " u+25c0 ◀  u+25b6 ▶  u+25c4 ◄  u+25ba ►
    "setlocal nolist
    "setlocal list
    set listchars=precedes:◀,extends:▶,trail:⁖,nbsp:⊔,tab:➫•
    " }

    " Equalize splits after a window resize
    autocmd Vimrc VimResized * wincmd =

    " MacVim Settings {
    if has("gui_macvim")
        set macmeta
    endif
    " }

    if has('gui_running')
    " GVIM (here instead of .gvimrc) {
        set lines=60 columns=140

        if s:uname == "Darwin\n"
            "set guifont=Inconsolata-dz\ for\ Powerline:h11
            set guifont=Meslo\ LG\ L\ DZ\ for\ Powerline:h11
        else
            "set guifont=Inconsolata\ 12
            set guifont=Inconsolata-dz\ for\ Powerline\ 9
        endif

        set guioptions-=T                  " remove the toolbar
        highlight Pmenu guibg=brown gui=bold
    " }
    else
    " Console Only VIM Settings {
        " Fix console Vim, which was giving A B C D when using arrow keys in
        " insert mode.
        "set term=xterm-256color
        set mouse=a
    " }
    endif
    " Formatting {
        set autoindent                   " indent at the same level of the previous line
        set comments=sl:/*,mb:*,elx:*/   " auto format comment blocks
        set matchpairs+=<:>              " match, to be used with %
        set expandtab                    " tabs are tabs, not spaces
        set shiftwidth=4                 " use indents of 4 spaces
        set tabstop=4                    " an indentation every four columns
        set softtabstop=4
        set nowrap                       " wrap long lines
    " }
    " Key Mappings {
        set pastetoggle=<F10>            " pastetoggle (sane indentation on pastes)
        nnoremap <F10> :set paste!<CR>

        " Easier moving in tabs and windows
        "nnoremap <C-H> <C-W>h
        "vnoremap <C-H> <C-W>h
        "nnoremap <C-J> <C-W>j
        "vnoremap <C-J> <C-W>j
        "nnoremap <C-K> <C-W>k
        "vnoremap <C-K> <C-W>k
        "nnoremap <C-L> <C-W>l
        "vnoremap <C-L> <C-W>l
        "nnoremap <S-H> gT
        "vnoremap <S-H> gT
        "nnoremap <S-L> gt
        "vnoremap <S-L> gt

        " disable line-wise moving
        nnoremap j gj
        nnoremap k gk

        " Yank from the cursor to the end of the line, to be consistent with C and D.
        nnoremap Y y$

        " allow ; to enter command mode
        nnoremap ; :

        " clear highlighted seaches
        nnoremap <CR> :noh<CR><CR>

        " Buffers and Tabs
        noremap <C-Up> :bprev<CR>
        noremap <C-Down> :bnext<CR>
        "noremap <Left> :tabprev<CR>
        "noremap <Right> :tabnext<CR>

        " Shortcuts
        " Change Working Directory to that of the current file
        cnoremap cwd lcd %:p:h

        " Save a write protected file when you forgot sudo
        cnoremap w!! write !sudo tee % >/dev/null

        " Make tab key bounce between matches like '%'
        nnoremap <tab> %
        vnoremap <tab> %

        " Add a semicolon
        nnoremap ;; mq:s/\([^;]\)$/\1;/<CR>:nohlsearch<CR>`q
        inoremap ;; <esc>mq:s/\([^;]\)$/\1;/<CR>:nohlsearch<CR>`qa
        vnoremap ;; :s/\([^;]\)$/\1;/e<CR>:nohlsearch<CR>gv

        " Leader Key Mappings {
            " Firstly, define the <Leader> key
            let mapleader = ","
            let maplocalleader = "\\"

            " fold HMTL tag - TODO move to HTML filetype?
            nnoremap <Leader>ft Vatzf

            " sort CSS properties - TODO move to CSS filetype?
            "nnoremap <Leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
            nnoremap <Leader>S Vi{:sort<CR>:noh<CR>

            " re-highlight text just pasted
            nnoremap <Leader>v V`]

            " edit .vimrc in a vertical window
            nnoremap <Leader>ev :vsplit $HOME/.vim/vimrc<cr>
            nnoremap <Leader>sv :source $MYVIMRC<cr>

            " switch to alternate buffer
            nnoremap <silent><Leader>, :buffer#<CR>

            " Edit Tool Sharpening
            nnoremap <Leader>et :vsplit $HOME/Google\ Drive/tool-sharpening.md<cr>

            " Most Recently Used Shortcut
            nnoremap <Leader>mr :MRU<cr>

            nmap <silent> <Leader>d <Plug>DashSearch

        " }
    " }
" }

" FileType Specific Settings {
    let g:checksyntax_auto = 0

    "comment out line(s) in visual mode
    vnoremap  o  :call NERDComment(1, 'toggle')<CR>
    let g:NERDShutUp=1

    let b:match_ignorecase = 1

    let g:solarized_contrast='normal'
    let g:solarized_visibility='low'

    " Automatically strip trailing spaces - TODO Q: Can these be combined?
    autocmd Vimrc BufRead,BufWrite *.php %s/\s\+$//e
    autocmd Vimrc BufRead,BufWrite *.js %s/\s\+$//e


    " http://vim.wikia.com/wiki/Use_eval_to_create_dynamic_templates {
        augroup templates
            " clear the augroup
            au!
            autocmd Vimrc BufNewFile *.* silent! execute '0r ~/.vim/templates/skeleton.'.expand("<afile>:e")

            autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
        augroup END
    " }
" }
" }

" Vim Plugins {

    " AlignMaps {
        let g:DrChipTopLvlMenu= "&Plugin."
    " }
    " Behat {
        let feature_filetype='behat'
        let g:behat_disable_omnicompl_cache = 1
    " }
    " CoffeeScript {
        let coffee_compile_vert = 1
        autocmd Vimrc BufWritePost *.coffee silent make!
    " }
    " Ctags {
        set tags=./tags;/,~/.vimtags
    " }
    " CtrlP {
        let g:ctrlp_map = '<C-p>'
        let g:ctrlp_working_path_mode = 'ra'
        let g:ctrlp_clear_cache_on_exit = 1
        let g:ctrlp_max_files = 3000
        let g:ctrlp_max_depth = 10
        "let g:ctrlp_cmd = 'CtrlP'

        let g:ctrlp_user_command = {
            \ 'types': {
                \ 1: ['.git/', 'cd %s && git ls-files'],
                \ },
        \ }
            "\ 'fallback': 'find %s -type f'

        let g:ctrlp_custom_ignore = {
          \ 'dir':  '\.git$\|\.svn$\|cache$\|log$\|vendor$\|build$',
          \ 'file': '\.sw?$\|\.exe$\|\.so$\|\.dll$',
          \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
          \ }

        let g:ctrlp_extensions = [
        \    'tag',
        \ ]
    " }
    " dbgPavim {
        let g:dbgPavimPort = 9000
        let g:dbgPavimBreakAtEntry = 0
    " }
    " Emmet-Vim {
        let g:user_emmet_settings = {
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
    " Emoji {
        nnoremap <leader>em execute "normal! %s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<cr>:nohls"<cr>
    " }
    " EverVim & Instant-Markdown {
        autocmd BufWinEnter *.{md,mkd,mkdn,mdown,mark*} silent setf markdown
        autocmd BufWinEnter __EVERVIM_NOTE__ silent setf markdown
    " }
    " fontzoom {
        " Replace the default keymapping
        let g:fontzoom_no_default_key_mappings = 1
        "silent! nmap <unique> <silent> = <Plug>(fontzoom-larger)
        "silent! nmap <silent> - <Plug>(fontzoom-smaller)
        silent! nmap <unique> <silent> <C-ScrollWheelUp> <Plug>(fontzoom-larger)
        silent! nmap <unique> <silent> <C-ScrollWheelDown> <Plug>(fontzoom-smaller)
    " }
    " Fugitive {
        "let g:fugitive_git_executable = 'myGit'

        if has('statusline')
            set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
        endif

        autocmd Vimrc BufReadPost fugitive://* set bufhidden=delete

        autocmd Vimrc User fugitive
          \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
          \   nnoremap <buffer> .. :edit %:h<CR> |
          \ endif

        set errorformat+='%f:%l:%m'

    " }
    " Gist {
        if s:uname == "Darwin\n"
            let g:gist_clip_command = 'pbcopy'
            let g:gist_browser_command = 'open -a "Google Chrome" %URL%'
        else
            let g:gist_clip_command = 'xclip -selection clipboard'
            "let g:gist_browser_command = 'x-www-browser %URL%'
        endif
        let g:git_detect_filetype = 1
        let g:gist_open_browser_after_post = 1
        let g:gist_show_privates = 1
        let g:gist_post_private = 1
        let g:gist_get_multiplefile = 1
    " }
    " GitGutter {
        if emoji#available()
            let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
            let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
            let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
            let g:gitgutter_sign_modified_removed = emoji#for('collision')
        endif
    " }
    " Gundo {
        nnoremap <Leader>u :GundoToggle<CR>
        "let g:gundo_width = 60
        "let g:gundo_preview_height = 40
        let g:gundo_right = 1
    " }
    " Learn Vimscript the Hard Way --Steve Losh {
        " More interesting horizontal scrolling
        set sidescroll=5

        " Round indent to multiple of shiftwidth
        set shiftround

        " Move lines around
        "nnoremap ( ddp
        "nnoremap ) dd<up><up>p

        " Upcase the current word
        inoremap <c-u> <Esc>viwUi
        nnoremap <c-u> viwU

        " Highlight the whole file
        nnoremap <Leader>wf ggVG
        vnoremap <Leader>wf ggVG

        " Strip trailing spaces
        "nnoremap <Leader>tw %s,\\s\\+$,,<cr>
        "vnoremap <Leader>tw %s,\\s\\+$,,<cr>
        "inoremap <Leader>tw <Esc>%s,\\s\\+$,,<cr>i

        " Abbreviations
        iabbrev kgatsn kgustavson@straightnorth.com
        iabbrev copyr Copyright 2014 Straight North LLC. All rights reserved.
        iabbrev ssig -- <cr>Kevin Gustavson<cr>Software Developer<cr>kgustavson@straightnorth.com
        " autocorrect ddate to "Monday 1/14/13"
        iab ddate <C-R>=strftime("%a %m/%d/%y")<CR>

        " Filler text
        iabbrev nitt Now is the time for all good men to come to the aid of their country.
        iabbrev tiat This is a test of the Emergency Broadcast System. Broadcasters, in cooperation with federal, state and local authorities have developed this system to keep you informed in the event of an emergency.  This is only a test.  If this had been an actual emergency, you would have been instructed where to tune in your area for news and official information.
        iabbrev qbf The quick brown fox jumped over the lazy dog.
        iabbrev lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        iabbrev ebs This is a test of the Emergency Broadcast System. Broadcasters, in cooperation with federal, state and local authorities have developed this system to keep you informed in the event of an emergency.  This is only a test.  If this had been an actual emergency, you would have been instructed where to tune in your area for news and official information.

        cabbrev gd Gdiff
        cabbrev gw Gwrite
        cabbrev gwr Gwrite
        cabbrev gs Gstatus

        nnoremap <Leader>" viw<Esc>a"<Esc>hbi"<Esc>lel
        vnoremap <Leader>" <Esc>`<i"<Esc>`>la"<Esc>l
        nnoremap <Leader>' viw<Esc>a'<Esc>hbi'<Esc>lel
        vnoremap <Leader>' <Esc>`<i'<Esc>`>la'<Esc>l
        nnoremap <Leader>[ viw<Esc>a]<Esc>hbi[<Esc>lel
        vnoremap <Leader>" <Esc>`<i[<Esc>`>la]<Esc>l
        nnoremap <Leader>( viw<Esc>a)<Esc>hbi(<Esc>lel

        " Floating Point Numbers
        let g:math_pi = 3.14159265359
        let g:math_e  = 2.71828182846

        " Open alternate buffer to the right
        nnoremap <Leader>. :execute "rightbelow vsplit" bufname('#')<cr>

        onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
        onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>

    " }
    " NerdCommenter {
        let g:NERDCustomDelimiters = {
                \ 'rubyX': { 'left': '#', 'leftAlt': 'FOO', 'rightAlt': 'BAR' },
                \ 'grondle': { 'left': '{{', 'right': '}}' },
                \ 'sql': { 'left': '-- ' },
                \ 'jinja2': { 'left': '<!--', 'right': '-->' }
            \ }
    " }
    " NerdTree {
        nnoremap <Leader>nt :NERDTree<CR>
    " }
    " Netrw {
        let g:netrw_liststyle=3
    " }
    " OmniComplete {
        "if has("autocmd") && exists("+omnifunc")
            "autocmd Vimrc Filetype *
                "\if &omnifunc == "" |
                "\setlocal omnifunc=syntaxcomplete#Complete |
                "\endif
        "endif

        " Popup menu hightLight Group
        "highlight Pmenu     ctermbg=13     guibg=DarkBlue
        highlight PmenuSel     ctermbg=7     guibg=DarkBlue         guifg=LightBlue
        "highlight PmenuSbar ctermbg=7     guibg=DarkGray
        "highlight PmenuThumb             guibg=Black

        highlight Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
        highlight PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
        highlight PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

        " some convenient mappings
        inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
        inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
        inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        inoremap <expr> <C-d>        pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
        inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

        " automatically open and close the popup menu / preview window
        autocmd Vimrc CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        set completeopt=menu,longest,preview
    " }
    " Powerline {
        "set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
        "set rtp+=/usr/local/lib/python2.7/site-packages/Powerline-beta-py2.7.egg/powerline/bindings/vim
        "set rtp+=/Users/kgustavson/powerline/build/lib/powerline/bindings/vim
        set rtp+=/Users/kgustavson/powerline/powerline/bindings/vim
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
        "noremap <Leader>sfc :execute ":!"g:symfony_enable_shell_cmd<CR>

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
        autocmd Vimrc BufEnter *Controller.php nnoremap <buffer><Leader>v :SfJumpToView<CR>

        nnoremap <Leader>ve :call PhpStackTrace()<CR>
    " }
    " Syntastic {
        let g:syntastic_check_on_open = 1
        let g:syntastic_error_symbol = '✗'
        let g:syntastic_warning_symbol = '⚠'
    " }
    " Syntax -- Move this out? {
        let conceallevel=2
        let concealcursor=""

        let g:syntax_js=['function', 'return', 'solarized']
    " }
    " Tslime {
        vmap <C-c><C-c> <Plug>SendSelectionToTmux
        nmap <C-c><C-c> <Plug>NormalModeSendToTmux
        nmap <C-c>r <Plug>SetTmuxVars
    " }
    " UltiSnips {
        " Matt Boehm
            "let g:UltiSnipsExpandTrigger="<tab>"
            "let g:UltiSnipsJumpForwardTrigger="<tab>"
            "let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
            "let g:UltiSnipsSnippetDirectories=["mysnippets"]
            "nnoremap <leader>vs :call g:EditMySnippets()
        "let g:UltiSnipsSnippetsDir="~/.vim/bundle/kgust-ultisnips/UltiSnips"
        "let g:UltiSnipsJumpForwardTrigger = "<c-j>"
        "let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
        "let g:UltiSnipsJumpForwardTrigger = "<c-h>"
        "let g:UltiSnipsJumpBackwardTrigger = "<c-l>"

        nnoremap <leader>es :call g:EditMySnippets()<CR>
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<tab>"
        let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    " }
    " VimOrganizer {
        autocmd! BufRead,BufWrite,BufWritePost,BufNewFile *.org
        autocmd Vimrc BufEnter *.org call org#SetOrgFileType()

        let g:org_tags_alist='@home(h) @celltrak(c) @dtedesigns(d) easy(e) hard(r)'
        let g:org_todo_setup='TODO NEXT STARTED | DONE CANCEL'
        let g:agenda_select_dirs=["~/Dropbox/Documents/VimOrg"]
        "let g:agenda_files = split(glob("~/Dropbox/Documents/VimOrg/*.org"),"\n")

        " open VimOrganizerNotes.org in a vertical window
        nnoremap <Leader>vo <C-w><C-v><C-l>:e ~/Dropbox/Documents/VimOrg/<cr>
    " }

" }

" Windows Compatible -- Keeping for the fun of it {
    " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
    " across (heterogeneous) systems easier.
    if has('win32') || has('win64')
        set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    endif
" }

" Functions {
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
    " Building a hash ensures we get each buffer only once
    let buffer_numbers = {}
    for quickfix_item in getqflist()
        let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
    endfor
    return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

function! g:EditMySnippets()
    let ft = &ft
    tabe ~/.vim/bundle/snippets/UltiSnips/
    call search(ft)
endfunction

" http://vim.wikia.com/wiki/Different_syntax_highlighting_within_regions_of_a_file
function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
    let ft=toupper(a:filetype)
    let group='textGroup'.ft
    if exists('b:current_syntax')
        let s:current_syntax=b:current_syntax
        " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
        " do nothing if b:current_syntax is defined.
        unlet b:current_syntax
    endif
    execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
    try
        execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
    catch
    endtry
    if exists('s:current_syntax')
        let b:current_syntax=s:current_syntax
    else
        unlet b:current_syntax
    endif
    execute 'syntax region textSnip'.ft.'
                \ matchgroup='.a:textSnipHl.'
                \ start="'.a:start.'" end="'.a:end.'"
                \ contains=@'.group
endfunction
" }
