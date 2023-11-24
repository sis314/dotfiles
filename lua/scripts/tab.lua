vim.cmd([[

function! GetNextString(length) abort
	let l:str = ""
	for i in range(0, a:length-1)
		let l:str = l:str.getline(".")[col(".")-1+i]
	endfor
	return l:str
endfunction
function! TabOut() abort
    let l:nextChar = GetNextString(1)
    if l:nextChar == ")" || l:nextChar == "\"" || l:nextChar == "\'" || l:nextChar == "<"
        return "\<Right>"
    else
        return "\<Tab>"
    endif
endfunction

inoremap <expr> <Tab> TabOut()
]])
