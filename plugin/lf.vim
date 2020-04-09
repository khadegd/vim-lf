if exists('g:lf#loaded')
    finish
endif
let g:lf#loaded = 1

if !(exists("g:lf#set_default_mappings"))
    let g:lf#set_default_mappings = 1
endif

if !(exists("g:lf#layout"))
    let g:lf#layout = 'enew'
endif

if !(exists("g:lf#action"))
    let g:lf#action = {}
endif

if !(exists("g:lf#command"))
    let g:lf#command = 'lf'
endif

if !(exists("g:lf#replace_netrw"))
    let g:lf#replace_netrw = 0
endif

if !(exists("g:lf#statusline"))
    let g:lf#statusline = 1
endif

command! -bar -nargs=? -complete=dir LfPicker call lf#pick(<f-args>)
command! -bar -nargs=? -complete=dir Lf call lf#pick(<f-args>)

if g:lf#set_default_mappings
    nnoremap <silent> <leader>n :LfPicker<CR>
endif

" To open lf when vim load a directory
if g:lf#replace_netrw
    function! s:lf_pick_on_load_dir(argv_path)
        let l:path = expand(a:argv_path)
        bdelete!
        call lf#pick(l:path, {'layout': 'enew'})
    endfunction

    augroup ReplaceNetrwByLfVim
        autocmd VimEnter * silent! autocmd! FileExplorer
        autocmd BufEnter * if isdirectory(expand("%")) | call <SID>lf_pick_on_load_dir("%") | endif
    augroup END
endif

" vim: set sts=4 sw=4 ts=4 et :
