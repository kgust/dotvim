" thanks to http://vimcasts.org/e/4
function! util#strip_trailing()
    let previous_search=@/
    let previous_cursor_line=line('.')
    let previous_cursor_column=col('.')
    %s/\s\+$//e
    let @/=previous_search
    call cursor(previous_cursor_line, previous_cursor_column)
endfunction


"
" The following functions are from https://github.com/jasonamyers/dotfiles
"

" Informative echo line
function! g:util#showToggles() abort
  echom '<F1> NERDTree | <F2> Free | <F3> Paste mode | <F4> Spellcheck | <F5> Reload rc | <F6> Search HL |' .
        \' <F7> Whitechars | <F8> Vertical Term | <F9> Fire REST Request | <F10> Free  | <F11> How do I |' .
        \' <F12> This message'
endfunction

" Copy and paste function using xclip
function! g:util#clipboardYank() abort
  call system('xclip -i -selection clipboard', @@)
endfunction

function! g:util#clipboardPaste() abort
  let @@ = system('xclip -o -selection clipboard')
endfunction

" Profile neovim and save results to profile.log
function! g:util#profile() abort
  execute 'profile start profile.log'
  execute 'profile func *'
  execute 'profile file *'
  echom 'Profiling started (will last until you quit neovim).'
endfunction

" When cycling ignore NERDTree and Tagbar
function! g:util#intelligentCycling() abort
  " Cycle firstly
  wincmd w
  " Handle where you are now
  if &filetype ==# 'nerdtree'
    call g:util#intelligentCycling()
  endif
  " If in terminal buffer start insert
  if &buftype ==# 'terminal'
    startinsert!
  endif
endfunction

" Be aware of whether you are right or left vertical split
" so you can use arrows more naturally.
" Inspired by https://github.com/ethagnawl.
function! g:util#intelligentVerticalResize(direction) abort
  let l:window_resize_count = 5
  let l:current_window_is_last_window = (winnr() == winnr('$'))

  if (a:direction ==# 'left')
    let [l:modifier_1, l:modifier_2] = ['+', '-']
  else
    let [l:modifier_1, l:modifier_2] = ['-', '+']
  endif

  let l:modifier = l:current_window_is_last_window ? l:modifier_1 : l:modifier_2
  let l:command = 'vertical resize ' . l:modifier . l:window_resize_count . '<CR>'
  execute l:command
endfunction

" Run current file
function! g:util#runCurrentFile() abort
  if &filetype ==? 'ruby'
    let l:command = 'ruby %'
  elseif &filetype ==? 'sh'
    let l:command = 'sh %'
  else
    echom "Can't run current file (unsupported filetype: " . &filetype . ')'
  endif

  if exists('command')
    execute ':terminal ' . l:command
  endif
endfunction

" Run NERDTreeFind or Toggle based on current buffer
function! g:util#nerdWrapper() abort
  if &filetype ==# '' " Empty buffer
    :NERDTreeToggle
  elseif expand('%:t') =~? 'NERD_tree' " In NERD_tree buffer
    wincmd w
  else " Normal file buffer
    :NERDTreeFind
  endif
endfunction

" Strip trailing spaces
function! g:util#stripTrailingWhitespaces() abort
  " Preparation: save last search, and cursor position.
  let l:lastSearch = @/
  let l:line = line('.')
  let l:col = col('.')

  " Do the business:
  execute '%s/\s\+$//e'

  " Clean up: restore previous search history, and cursor position
  let @/ = l:lastSearch
  call cursor(l:line, l:col)
endfunction

" Set SK keyboard layout with qwerty
function! g:util#setSKKBLayout() abort
  silent !setxkbmap sk -variant qwerty
endfunction

" Set US keyboard layout with qwerty
function! g:util#setUSKBLayout() abort
  silent !setxkbmap us
endfunction

" Generate ctags and put them into tags directory
" gem install starscope
function! g:util#generateCtags() abort
  silent execute '!starscope -e ctags'
  echom 'Tags generated into tags file!'
endfunction

" Tab wrapper
function! g:util#tabComplete() abort
  let l:col = col('.') - 1

  if pumvisible()
    return "\<C-n>"
  else
    if !l:col || getline('.')[l:col - 1] !~# '\k'
      return "\<TAB>"
    else
      return "\<C-n>"
    endif
  endif
endfunction

" Manual Tag complete
" TODO: improve to also trigger tag complete after closing popup
function! g:util#manualTagComplete() abort
  if pumvisible()
    return g:deoplete#mappings#close_popup()
  else
    return g:deoplete#mappings#manual_complete('tag')
  endif
endfunction

" Simple notes management
function! g:util#openNotes() abort
  execute ':e ~/dev/notes/vim-notes.md'
endfunction

" Use omni complete source as default
function! g:util#useOmniTabWrapper() abort
  inoremap <buffer> <expr> <TAB> util#insertTabOmniWrapper()
endfunction

" Unite commands wrappers
function! g:util#uniteSources() abort
  execute 'Unite -no-split -buffer-name=sources -start-insert source'
endfunction

function! g:util#uniteMRUs() abort
  execute 'Unite -no-split -buffer-name=most-recently-used -start-insert neomru/file'
endfunction

function! g:util#uniteFileBrowse() abort
  execute 'Unite -no-split -buffer-name=project-files -start-insert file'
endfunction

function! g:util#uniteFileRec() abort
  execute 'Unite -no-split -buffer-name=file-recursive-search -start-insert file_rec/neovim'
endfunction

function! g:util#uniteBuffers() abort
  execute 'Unite -no-split -buffer-name=buffers -start-insert buffer'
endfunction

function! g:util#uniteOutline() abort
  execute 'Unite -no-split -buffer-name=symbols -start-insert outline'
endfunction

function! g:util#uniteTags() abort
  execute 'Unite -no-split -buffer-name=tags -start-insert tag'
endfunction

function! g:util#uniteHistory() abort
  execute 'Unite -no-split -buffer-name=edit-history change'
endfunction

function! g:util#uniteLineSearch() abort
  execute 'Unite -no-split -buffer-name=line-search -start-insert line'
endfunction

function! g:util#uniteYankHistory() abort
  execute 'Unite -no-split -buffer-name=yank-history history/yank'
endfunction

function! g:util#uniteRegisters() abort
  execute 'Unite -no-split -buffer-name=registers register'
endfunction

function! g:util#uniteWindows() abort
  execute 'Unite -no-split -buffer-name=splits window'
endfunction

function! g:util#uniteSnippets() abort
  execute 'Unite -no-split -buffer-name=snippets -start-insert ultisnips'
endfunction

function! g:util#uniteCustomMenu() abort
  execute 'Unite -no-split -buffer-name=menu -start-insert menu'
endfunction

function! g:util#uniteJumps() abort
  execute 'Unite -no-split -buffer-name=jumps -start-insert jump'
endfunction

function! g:util#uniteCommands() abort
  execute 'Unite -no-split -buffer-name=commands -start-insert command'
endfunction

function! g:util#uniteMappings() abort
  execute 'Unite -no-split -buffer-name=mappings -start-insert mapping'
endfunction

" Format function
" Needs: npm install js-beautify, gem install ruby-beautify, python
function! g:util#formatFile() abort
  let l:line = line('.')
  let l:col = col('.')
  let l:command_prefix = '%!'

  if &filetype ==? 'javascript.jsx'
    let l:command = 'js-beautify -X -f -'
  elseif &filetype ==? 'html'
    let l:command = 'html-beautify -f -'
  elseif &filetype ==? 'css'
    let l:command = 'css-beautify -f -'
  elseif &filetype ==? 'json'
    let l:command = 'python -m json.tool'
  elseif &filetype ==? 'ruby'
    let l:command = 'ruby-beautify -c 2 -s'
  else
    " Basic vim format fallback
    normal! gg=G
  endif

  if exists('l:command')
    execute l:command_prefix . l:command
  endif

  call cursor(l:line, l:col)
endfunction

" Annotate file function (only ruby support for now)
function! g:util#annotateFile() abort
  let l:command_prefix = '%!'

  if &filetype ==? 'ruby'
    let l:command = 'seeing_is_believing -x'
  endif

  if exists('l:command')
    execute l:command_prefix . l:command
  endif
endfunction

" Mode function for Lightline statusline
function! g:util#lightLineMode() abort
  let l:fname = expand('%:t')
  return l:fname =~? 'NERD_tree' ? 'NT' :
        \ &filetype ==? 'unite' ? 'Unite' :
        \ winwidth(0) > 70 ? g:lightline#mode() : ''
endfunction

" File format function for Lightline statusline
function! g:util#lightLineFileformat() abort
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

" Filetype function for Lightline statusline
function! g:util#lightLineFiletype() abort
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

" File encoding function for Lightline statusline
function! g:util#lightLineFileencoding() abort
  return winwidth(0) > 70 ? (strlen(&fileencoding) ? &fileencoding : &encoding) : ''
endfunction

" File name function for Lightline statusline
function! g:util#lightLineFilename() abort
  let l:fname = expand('%:t')
  return l:fname =~? 'NERD_tree' ? 'NERDTree' :
        \ &filetype ==? 'unite' ? g:unite#get_status_string() :
        \ ('' !=# l:fname ? l:fname : '[No Name]')
endfunction

" Howdoi integration (pip install howdoi)
function! g:util#howDoI() abort
  let l:command_prefix = 'read '
  let l:howdoi = '!howdoi '

  call inputsave()
  let l:query = input('How do I: ')
  call inputrestore()

  if l:query !=# ''
    execute l:command_prefix . l:howdoi . l:query
  endif
endfunction

" Search current word with CtrlSF
" Inspired by github.com/zenbro
function! g:util#searchCurrentWordWithAg() abort
  execute 'CtrlSF' expand('<cword>')
endfunction

" Reset tabs to 4 spaces
function! g:util#retabToFourSpaces() abort
  setlocal tabstop=4 shiftwidth=4 expandtab
  retab
endfunction
