" neocomplete
" if !has("lua")
"   echoerr "if_lua is disabled, required for neocomplete! Execute: `brew install vim --with-lua`"
" endif
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_auto_select = 1
" inoremap <expr><C-[> neocomplete#smart_close_popup()."\<Esc>"
" let g:neocomplete#sources#dictionary#dictionaries = {
" \   'ruby': $HOME . '/.vim/dicts/ruby.dict',
" \ }
" if !exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"
" " Recommended key-mappings.
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return pumvisible() ? neocomplete#close_popup() : "\<CR>"
" endfunction
autocmd FileType python set completeopt-=preview

" Unite.vim
let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_limit = 20
let g:unite_enable_auto_select = 0
let g:unite_source_grep_command = 'ag'

" Unbind <C-e> in unite
augroup test
  autocmd!
  autocmd FileType unite inoremap <buffer> <C-e> <Esc>
augroup END

" vim-tags
" let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
" let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R {OPTIONS} `bundle show --paths` 2>/dev/null"

" vim-gitgutter
let g:gitgutter_sign_column_always = 1

" gocode
" set rtp+=$GOROOT/misc/vim
" let g:go_fmt_autofmt = 1

" golint
" exe "set rtp+=" . globpath($GOPATH, "src/github.com/golang/lint/misc/vim")

" disable trailing whitespace highlight in unite
let g:extra_whitespace_ignored_filetypes = ['unite']

" Unite.vim redraw limit
let g:unite_redraw_hold_candidates = 26000

" vim-go
" let g:go_fmt_autosave = 1
" let g:go_fmt_fail_silently = 1

" let g:skk_jisyo = '~/vim-skk-jisyo.utf8'
if has('mac')
  let g:skk_large_jisyo = '~/Library/Application Support/AquaSKK/SKK-JISYO.L'
" elseif has('unix')
"   let g:skk_large_jisyo = '/usr/share/skk/SKK-JISYO.L'
endif

if has('mac')
  let g:skk_auto_save_jisyo = 1 " don't ask if save
  let g:skk_keep_state = 0
  let g:skk_kutouten_type = 'jp'
  let g:skk_egg_like_newline = 0
  let g:skk_show_annotation = 1
  let g:skk_use_face = 1
endif

" matchit.vim for ruby
source $VIMRUNTIME/macros/matchit.vim
augroup matchit
  au!
  au FileType ruby let b:match_words = '\<\(module\|class\|def\|begin\|do\|if\|unless\|case\)\>:\<\(elsif\|when\|rescue\)\>:\<\(else\|ensure\)\>:\<end\>'
augroup END

" vim-javacomplete2
" if !has("python")
"   echoerr "if_python is disabled, required for vim-javacomplete2!"
" endif
" autocmd FileType java setlocal omnifunc=javacomplete#Complete

let g:JavaComplete_ImportOrder = ['*']
let g:JavaComplete_ImportSortType = 'packageName'
let g:JavaComplete_RegularClasses = ['java.lang.String', 'java.lang.Object', 'java.lang.Class']
nmap [Tag]ja <Plug>(JavaComplete-Imports-AddMissing)
nmap [Tag]jr <Plug>(JavaComplete-Imports-RemoveUnused)
nmap [Tag]ji <Plug>(JavaComplete-Imports-AddSmart)
nmap [Tag]jI <Plug>(JavaComplete-Imports-Add)

" sqlcomplete disable
let g:omni_sql_no_default_maps = 1
