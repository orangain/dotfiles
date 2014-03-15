setlocal ts=2 sw=2 sts=2
setlocal expandtab
setlocal smarttab

"autocmd BufWritePre <buffer> :keepjumps call s:JsFormat()

function! s:JsFormat()
     let view = winsaveview()
     let tempfile = tempname() . '.js'
     silent execute "%!sh -c 'cat > " . tempfile . " && fixjsstyle " . tempfile . " > /dev/null && cat " . tempfile . "'"
     call winrestview(view)
endfunction
