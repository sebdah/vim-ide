" Disable syntastic
" This resolves a bug which makes saving Go files slow
let g:syntastic_mode_map = { 'passive_filetypes': ['go'] }
