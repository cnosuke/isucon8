let s:source = {
            \ 'name'        : 'git_files',
            \ 'hooks'       : {},
            \ }

function! s:source.gather_candidates(args, context)
    let kind = unite_git_util#get_kind()
    let result = unite#util#system('git ls-files')
    if unite#util#get_last_status() == 0 && strlen(result) > 0
        return has('lua') ?
              \ unite#sources#git_files#gather_lua(kind, result) :
              \ unite#sources#git_files#gather_vim(kind, result)
    else
        let result = unite#util#system('find . -type f')
        return has('lua') ?
              \ unite#sources#git_files#gather_lua(kind, result) :
              \ unite#sources#git_files#gather_vim(kind, result)
    endif
endfunction

function! unite#sources#git_files#gather_vim(kind, result)
    let candidates = []
    let paths = split(a:result, '\r\n\|\r\|\n')
    for path in paths
        let dict = {
                    \ 'word'         : path,
                    \ 'kind'         : a:kind,
                    \ 'action__path' : path,
                    \ }
        call add(candidates, dict)
    endfor
    return candidates
endfunction

function! unite#sources#git_files#gather_lua(kind, result)
    let candidates = []

    lua << EOF
do
    local candidates = vim.eval('candidates')
    local kind = vim.eval('a:kind')
    local result = vim.eval('a:result')
    for path, sep in string.gmatch(result, "[^\r\n]+") do
        local dict = vim.dict()

        dict.word = path
        dict.kind = kind
        dict.action__path = path

        candidates:add(dict)
    end
end
EOF

    return candidates
endfunction

function! unite#sources#git_files#define()
    return s:source
endfunction
