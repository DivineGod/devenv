" SELECTA

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
" Needs selecta (brew install selecta)
function! selecta#SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

function! selecta#SelectaFile(path)
  call selecta#SelectaCommand("find " . a:path . "/* -type f", "", ":e")
endfunction

function! selecta#SelectaGitRepo(path)
  call selecta#SelectaCommand("git ls-files -oc --exclude-standard " . a:path . " 2>/dev/null", "", ":e")
endfunction

function! selecta#SelectaBuffer()
  let bufnrs = filter(range(1, bufnr("$")), 'buflisted(v:val)')
  let buffers = map(bufnrs, 'bufname(v:val)')
  call selecta#SelectaCommand('echo "' . join(buffers, "\n") . '"', "", ":b")
endfunction

