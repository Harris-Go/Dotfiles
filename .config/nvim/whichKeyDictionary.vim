""""""""""""""""""""""""
" Which Key Dictionary "
""""""""""""""""""""""""

call which_key#register(';', "g:which_key_map")
call which_key#register(',', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey ';'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>
let g:which_key_map = {'m': 'Toggle Writing Mode'}
let g:which_key_map.w = {
	\ 'name' : 'windows' ,
	\ '=' : 'Equalise' ,
	\ 'h' : 'Left' ,
	\ 'j' : 'Down' ,
	\ 'k' : 'Up' ,
	\ 'l' : 'Right' ,
	\ 'H' : 'Move Left' ,
	\ 'J' : 'Move Down' ,
	\ 'K' : 'Move Up' ,
	\ 'L' : 'Move Right' ,
	\ '>' : 'Increase Width' ,
	\ '<' : 'Decrease Width' ,
	\ '+' : 'Increase Height' ,
	\ '-' : 'Decrease Height' ,
	\ }


