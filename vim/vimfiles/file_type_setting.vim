
""" remove new-line auto commentout.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""" file type setting
augroup AutoCmdFiletype
  autocmd!
  autocmd FileType html,markdown set synmaxcol=500
  autocmd FileType snippets setlocal shiftwidth=2 tabstop=2
  autocmd BufRead,BufNewFile,BufReadPre,Syntax *.ts set filetype=typescript
  autocmd BufRead,BufNewFile,BufReadPre *.tsx set filetype=typescriptreact
  autocmd BufRead,BufNewFile,BufReadPre *.txt set filetype=markdown
  autocmd BufRead,BufNewFile,BufReadPre *.jsx set filetype=javascriptreact
  autocmd BufRead,BufNewFile,BufReadPre *.es set filetype=javascript
  autocmd BufRead,BufNewFile,BufReadPre *.es6 set filetype=javascript
  autocmd BufRead,BufNewFile,BufReadPre *.scss set filetype=scss
  autocmd BufRead,BufNewFile,BufReadPre *.toml set filetype=toml
  autocmd BufRead,BufNewFile,BufReadPre *.ejs set filetype=html.ejs
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
augroup END

""" remove line-end space.
autocmd BufWritePre !*.{md,txt} :%s/\s\+$//ge

""" remove line-end space.
function! s:autocmd_vim_enter_user()
  syntax on
endfunction
augroup AutoCmdVimEnterUser
  autocmd!
  autocmd VimEnter * call s:autocmd_vim_enter_user()
augroup END

