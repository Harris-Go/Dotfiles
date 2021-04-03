""""""""""""""""""""""""
" Which Key Dictionary "
""""""""""""""""""""""""

call which_key#register(';', "g:which_key_map")
call which_key#register(',', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey ';'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>
let g:which_key_map = {'m': 'Toggle Writing Mode'}
let g:which_key_map = {';': 'Jump to next <++>'}
let g:which_key_map = {'<space>': 'Remove Highlights'}

let g:which_key_map.s = {
	\ 'name' : '+Spelling' ,
	\ 's' : 'Toggle Spelling' ,
	\ }

let g:which_key_map.p = {
	\ 'name' : '+Plugins' ,
	\ 'g' : 'Toggle Goyo' ,
	\ 'l' : 'Toggle Limelight' ,
	\ 'h' : 'Hard Pencil' ,
	\ 's' : 'Soft Pencil' ,
	\ 'n' : 'No Pencil' ,
	\ 't' : 'Toggle Table Mode' ,
	\ }

let g:which_key_map.l = {
	\ 'name' : '+Live Preview' ,
	\ 'm' : 'Markdown' ,
	\ 'l' : 'Latex' ,
	\ }

let g:which_key_map.w = {
	\ 'name' : '+Windows' ,
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
	\ 'v' : 'New Vertical Split' ,
	\ 's' : 'New Horizontal Split' ,
	\ 'n' : 'Open Nvim Config' ,
	\ }


