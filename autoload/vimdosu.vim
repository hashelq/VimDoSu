" create shared temp file
let g:f_tmp = tempname() 

function! vimdosu#WriteFile(...)
  let name = ""
  if a:0 > 0
	let name = a:1
  endif
  if empty(name)
    let name = expand("%")
  endif
  if empty(name)
    echo "No filename"
	return
  endif
  set nobackup nowritebackup
  let writable = filewritable(name)
  let readable = filereadable(name)
  let executable = executable(name)
  let perms = getfperm(name)

  let exists = !empty(perms)
  if exists
	" File exists
	if writable
	  echo "is_writable"
	  " And is writeable
	  execute "w!" name
	else
	  " Requires rights
	  call vimdosu#SaveWithRights(name)
	endif
  else
	" File does (not) exist
	" Just save with rights
	call vimdosu#SaveWithRights(name)
  endif
endfunction

function! vimdosu#SaveWithRights(name)
  let contents = getline(1,'$')
  call writefile(contents, g:f_tmp)
  let password = inputsecret("Password: ")
  let output = systemlist("DOSU_PROMPT= dosu sh -c \'cat " . g:f_tmp . " > \"" . a:name . "\"\'", password)
  
  if v:shell_error != 0
	echo "\nError while saving: " . output[0]
  else
	execute "edit!" a:name
  endif
endfunction
