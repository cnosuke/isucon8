let s:GITI_KIND = 'giti/status'
let s:giti_availability = -1

function! s:is_giti_available()
    if s:giti_availability < 0
        let s:giti_availability = !empty(unite#get_kinds(s:GITI_KIND))
    endif
    return s:giti_availability
endfunction

function! unite_git_util#get_kind()
    let kind = ['file']
    if s:is_giti_available()
        call add(kind, s:GITI_KIND)
    endif
    return kind
endfunction
