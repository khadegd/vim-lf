if exists("g:lf_ftplugin")
    finish
endif
let b:lf_ftplugin = 1

let s:nowait = (v:version > 703 ? '<nowait>' : '')

for key in keys(g:lf#action)
    if type(g:lf#action[key]) == 2
        exec 'tnoremap '.s:nowait.'<buffer><silent> '.key.' <c-\><c-n>:<c-u>call lf#select_action('.string(g:lf#action[key]).')<cr>'
    else
        exec 'tnoremap '.s:nowait.'<buffer><silent> '.key.' <c-\><c-n>:<c-u>call lf#select_action("'.g:lf#action[key].'")<cr>'
    endif
endfor

setlocal nospell bufhidden=wipe nobuflisted nonumber noruler
" vim: set sts=4 sw=4 ts=4 et :
