function! FoldBraceScope()
	while 1
		let current_char = getline(".")[col(".") - 1]
		if current_char == '}'
				execute "normal! zfa}"
				break
		else 
			execute "normal! /[{}]\<CR>"
			let current_char = getline(".")[col(".") - 1]
			if current_char == '}'
				execute "normal! zfa}"
				break
			else
				exe "normal! %"
				execute "normal! j"
			endif	
		endif
	endwhile
endfunction

function! GetMacroScope()
	"Record current position
	exec "normal! mp"
	let current_line = getline(".")
	if(match(current_line,"#if") != -1)
		exec "normal! ^"
		let front_lineNo = line(".")
		exec "normal! %"
		let back_lineNo = line(".")
		return [front_lineNo,back_lineNo]

		else
			if (match(current_line,"#endif")!= -1)
				exec "normal! ^"
				let back_lineNo = line(".")
				exec "normal! %"
				let front_lineNo = line(".")
				return [front_lineNo,back_lineNo]
			endif
	endif

	"search down
	exec "normal! /#if\\|#endif\<CR>" 
	let current_line = getline(".")
	if (match(current_line,"#endif")!=-1 )
		exec "normal! ^"
		let back_lineNo = line(".")
		exec "normal! %"
		let front_lineNo = line(".")
		return [front_lineNo,back_lineNo]
	endif

	"search up"
	exec "normal! N"
	let current_line = getline(".")
	if match(current_line,"#if")!=-1
		exec "normal! ^"
		let front_lineNo = line(".")
		exec "normal! %"
		let back_lineNo = line(".")
		return [front_lineNo,back_lineNo]
	endif
	exec "normal! `p"
	return [0,0]
endfunction
		
function! FoldMacroScope()
	let [front_lineNo,back_lineNo] = GetMacroScope()
	if front_lineNo!=0 || back_lineNo!=0
		exe "normal!:" front_lineNo "," back_lineNo "fold\<CR>"
	endif
endfunction



function! LoadCscope()
	set tabstop=4
	set noexpandtab
	set softtabstop=4
	set shiftwidth=4
	nnoremap <F2>  : call FoldBraceScope()<CR>
	nnoremap <C-Z> : call FoldMacroScope()<CR>
	let db = findfile("cscope.out", ".;")
	if (!empty(db))
		set nocscopeverbose " suppress 'duplicate connection' error
		exe "cs add "." " db
		set cscopeverbose
	endif
endfunction


augroup testgroup
    autocmd!
    "autocmd BufRead *.c,*.h :call Set_Cscope_database()
    autocmd BufRead *.c,*.h,*.inl :call LoadCscope()
	autocmd CursorMoved *.c,*.h,*.py,*.js exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
augroup END

runtime macros/matchit.vim
