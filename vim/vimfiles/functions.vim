
"--------------------------------------------------
" Functions.

" Output message.
command! -nargs=0 EchoMessage call EchoMessage()
function! EchoMessage()
  put =execute('messages')
endfunction

" Detect env windows.
command! -nargs=0 IsWindows call IsWindows()
let s:is_windows = has('win32') || has('win64')
function! IsWindows()
  return s:is_windows
endfunction

" Detect env mac.
command! -nargs=0 IsMac call IsMac()
let s:is_mac = has('mac')
function! IsMac()
  return s:is_mac
endfunction

" Toggle Fullscreen.
command! -nargs=0 ToggleFullScreen call ToggleFullScreen()
function! ToggleFullScreen()

  if filereadable(expand("$HOME/.vimrc"))
    echo $HOME.'/.vimrc'
    echo expand("$HOME/.vimrc")
  endif

  if has('nvim')
    if g:GuiWindowMaximized == 0
      call GuiWindowMaximized(1)
    else
      call GuiWindowMaximized(0)
    endif
  else
    " set columns=100
    " set lines=50
    set columns?
    set lines?
  endif
endfunction

function! s:PHPLint()
  let s:result = system('php -l ' . bufname(""))
  let s:count = split(s:result, "\n")
  echo s:result
endfunction

augroup php-lint
  autocmd!
  autocmd BufWritePost *.php call <SID>PHPLint()
augroup END

if has('macunix')
  function! OpenURLUnderCursor()
    let s:uri = matchstr(getline('.'), '[a-z]*:\/\/[^ >,;()]*')
    let s:uri = shellescape(s:uri, 1)
    if s:uri != ''
      silent exec "!open '".s:uri."'"
      :redraw!
    endif
  endfunction
  nnoremap gx :call OpenURLUnderCursor()<CR>
endif

command! Profile call s:command_profile()
function! s:command_profile() abort
  profile start ~/profile.txt
  profile func *
  profile file *
endfunction
