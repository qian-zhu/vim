nnoremap <C-left>	   :vertical resize -5<CR>
nnoremap <C-right>	   :vertical resize +5<CR>
nnoremap <C-up>	   :resize -5<CR>
nnoremap <C-down>	   :resize +5<CR>
nnoremap <C-y>	:let @+ = expand("<cword>")<CR>
nnoremap <C-e>	:!p4 edit %:p<CR><CR>

nnoremap <buffer> <F7> :exec '!python' shellescape(@%, 1)<cr>
