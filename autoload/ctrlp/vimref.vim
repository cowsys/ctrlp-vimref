if exists('g:loaded_ctrlp_vimref') && g:loaded_ctrlp_vimref
  finish
endif
let g:loaded_ctrlp_vimref = 1

let s:vimref_var = {
\  'init':   'ctrlp#vimref#init()',
\  'accept': 'ctrlp#vimref#accept',
\  'exit':   'ctrlp#vimref#exit()',
\  'lname':  'vimref',
\  'sname':  'vimref',
\  'type':   'vimref',
\  'sort':   0,
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:vimref_var)
else
  let g:ctrlp_ext_vars = [s:vimref_var]
endif

function! ctrlp#vimref#init()
  let s = "foreach\nstrcmp"
"  redir => s
"  silent marks
"  redir END
  return split(s, "\n")[1:]
endfunc

function! ctrlp#vimref#accept(mode, str)
  call ctrlp#exit()
	exe "Ref phpmanual ".matchstr(a:str, '^\s*\zs\S\+\ze\s.*')
endfunction

function! ctrlp#vimref#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#vimref#id()
  return s:id
endfunction

" vim:fen:fdl=0:ts=2:sw=2:sts=2
