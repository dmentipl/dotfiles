" Author: Daniel Mentiplay
" Description: ifort for Fortran files

" This option can be set to 0 to use -nofree
" call ale#Set('fortran_ifort_use_free_form', 1)
call ale#Set('fortran_ifort_executable', 'ifort')
" Set this option to change the ifort options for warnings for Fortran.
call ale#Set('fortran_ifort_options', '-warn')

function! ale_linters#fortran#ifort#Handle(buffer, lines) abort
    " We have to match a pattern like
    "
    " <file>(<line>): error #<code>: <message>
    let l:pattern = '(\(\d\+\)): \(error\|warning\|remark\) \(#\d\+\): \(.\+\)$'
    " For each match, update the l:output list:
    let l:output = []
    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        let l:code = l:match[3]

        call add(l:output, {
        \   'lnum': l:match[1] + 0,
        \   'text': l:match[2] . ': ' . l:code . ': ' . l:match[4],
        \   'type': l:match[2] is# 'error' ? 'E' : 'W',
        \})
    endfor
    return l:output
endfunction

function! ale_linters#fortran#ifort#GetCommand(buffer) abort
    let l:layout_option = ''
    " let l:layout_option = ale#Var(a:buffer, 'fortran_ifort_use_free_form')
    " \   ? '-free'
    " \   : '-nofree'

    return '%e -syntax-only -module /tmp ' . l:layout_option
    \   . ale#Pad(ale#Var(a:buffer, 'fortran_ifort_options'))
    \   . ' %t'
endfunction

call ale#linter#Define('fortran', {
\   'name': 'ifort',
\   'output_stream': 'stderr',
\   'executable': {b -> ale#Var(b, 'fortran_ifort_executable')},
\   'command': function('ale_linters#fortran#ifort#GetCommand'),
\   'callback': 'ale_linters#fortran#ifort#Handle',
\})
