
""" remove new-line auto commentout.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""" file type setting
augroup AutoCmdFiletype
  autocmd!
  autocmd FileType html,markdown set synmaxcol=500
  autocmd FileType snippets setlocal shiftwidth=2 tabstop=2
  " autocmd BufRead,BufNewFile,BufReadPre,Syntax *.ts set filetype=typescript
  autocmd BufRead,BufNewFile *.ts set filetype=typescript
  autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
  autocmd BufRead,BufNewFile *.txt set filetype=markdown
  autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
  autocmd BufRead,BufNewFile *.es set filetype=javascript
  autocmd BufRead,BufNewFile *.es6 set filetype=javascript
  autocmd BufRead,BufNewFile *.scss set filetype=scss
  autocmd BufRead,BufNewFile *.toml set filetype=toml
  autocmd BufRead,BufNewFile *.ejs set filetype=html.ejs
augroup END

""" terminal setting
function! s:bufnew()
  if &buftype == "terminal" && &filetype == ""
    set filetype=terminal
  endif
endfunction
function! s:filetype()
  set ambiwidth=single
endfunction
augroup AutoCmdTerminal
  autocmd!
  autocmd BufNew * call timer_start(0, { -> s:bufnew() })
  autocmd FileType terminal call s:filetype()
augroup END

augroup AutoCmdHighlight
  autocmd!
  autocmd Syntax sql if 1000 < line('$') | syntax sync minlines=100 | endif
  autocmd Syntax php if 1000 < line('$') | syntax sync minlines=100 | endif
  autocmd Syntax log if 1000 < line('$') | syntax sync minlines=100 | endif
augroup END

""" hilight in comment.
augroup AutoCmdHilightsForce
  autocmd!
  autocmd WinEnter,BufRead,BufNew,Syntax * :silent! call matchadd('Todo', '\(TODO\|NOTE\|INFO\|XXX\|TASK\|TEMP\|MEMO\):')
  autocmd WinEnter,BufRead,BufNew,Syntax * highlight Todo guibg=Red guifg=White

  if has('nvim')
    " transparency
    autocmd WinEnter,BufRead,BufNew,Syntax * highlight Normal ctermbg=none
  endif
augroup END

""" remove line-end space.
autocmd BufWritePre !*.{md,txt} :%s/\s\+$//ge

function! s:autocmd_vim_enter_user()
  syntax on
endfunction
augroup AutoCmdVimEnterUser
  autocmd!
  autocmd VimEnter * call s:autocmd_vim_enter_user()
augroup END

