" Title:        vimdosu.vim

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_vimdosu")
    finish
endif
let g:loaded_vimdosu = 1

" Exposes the plugin's functions for use as commands in Vim.
command! -nargs=? DosuSave call vimdosu#WriteFile(<f-args>)
