" Author: Daniel Mentiplay
" Description: gfortran for Fortran files, modified from gcc.vim by w0rp

" This option can be set to 0 to use -ffixed-form
call ale#Set('fortran_gfortran_use_free_form', 1)
call ale#Set('fortran_gfortran_executable', 'gfortran')
" Set this option to change the gfortran options for warnings for Fortran.
call ale#Set('fortran_gfortran_options', '-Wall')

function! ale_linters#fortran#gfortran#Handle(buffer, lines) abort
    " We have to match a starting line and a later ending line together,
    " like so.
    "
    " :21.34:
    " Error: Expected comma in I/O list at (1)
    let l:line_marker_pattern = ':\(\d\+\)[.:]\=\(\d\+\)\=:\=$'
    let l:message_pattern = '^\(Fatal Error\|Error\|Warning\): \(.\+\)$'
    let l:looking_for_message = 0
    let l:last_loclist_obj = {}

    let l:output = []

    for l:line in a:lines
        if l:looking_for_message
            let l:match = matchlist(l:line, l:message_pattern)
        else
            let l:match = matchlist(l:line, l:line_marker_pattern)
        endif

        if len(l:match) == 0
            continue
        endif

        if l:looking_for_message
            let l:looking_for_message = 0

            " Now we have the text, we can set it and add the error.
            let l:last_loclist_obj.text = l:match[2]
            let l:last_loclist_obj.type = l:match[1] is# 'Warning' ? 'W' : 'E'
            call add(l:output, l:last_loclist_obj)
        else
            let l:last_loclist_obj = {
            \   'bufnr': a:buffer,
            \   'lnum': l:match[1] + 0,
            \   'col': l:match[2] + 0,
            \}

            " Start looking for the message and error type.
            let l:looking_for_message = 1
        endif
    endfor

    return l:output
endfunction

function! ale_linters#fortran#gfortran#GetCommand(buffer) abort
    let l:layout_option = ''
    " let l:layout_option = ale#Var(a:buffer, 'fortran_gfortran_use_free_form')
    " \   ? '-ffree-form'
    " \   : '-ffixed-form'

    return '%e -fsyntax-only -J/tmp ' . l:layout_option
    \   . ale#Pad(ale#Var(a:buffer, 'fortran_gfortran_options'))
    \   . ' %t'
endfunction

call ale#linter#Define('fortran', {
\   'name': 'gfortran',
\   'output_stream': 'stderr',
\   'executable': {b -> ale#Var(b, 'fortran_gfortran_executable')},
\   'command': function('ale_linters#fortran#gfortran#GetCommand'),
\   'callback': 'ale_linters#fortran#gfortran#Handle',
\})
