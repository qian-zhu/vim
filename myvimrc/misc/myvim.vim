nnoremap <C-right>	    :vertical resize -5<CR>
nnoremap <C-left>	    :vertical resize +5<CR>
nnoremap <C-up>			:resize -5<CR>
nnoremap <C-down>	    :resize +5<CR>
nnoremap <C-y>			:let @+ = expand("<cword>")<CR>
nnoremap <C-e>			:!p4 edit %:p<CR><CR>

nnoremap <F7>			:exec '!python' shellescape(@%, 1)<cr>

function! Get_file_perm()
  let permission = getfperm(expand('%:p'))
  if(permission[0] == 'r' && permission[1] == '-')
	setlocal nomodifiable
  else
	setlocal modifiable
  endif
endfunction

autocmd BufRead * : call Get_file_perm()

let g:bbbb = 1
function! Test()
	if(g:bbbb == 1)
		let	g:bbbb = 2
	else
		let g:bbbb = 1
	endif
endfunction
