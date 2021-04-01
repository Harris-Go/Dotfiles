"""""""""""""""""""""
" Markdown Bindings "
"""""""""""""""""""""

"Toggle Table Mode
autocmd FileType markdown nnoremap <leader>t :TableModeToggle<CR>
autocmd FileType markdown inoremap <leader>t <Esc>:TableModeToggle<CR>i

"Insert Headings
autocmd FileType markdown inoremap <leader>1 #<space><CR><CR><++><Esc>2kA
autocmd FileType markdown inoremap <leader>2 ##<space><CR><CR><++><Esc>2kA
autocmd FileType markdown inoremap <leader>3 ###<space><CR><CR><++><Esc>2kA
autocmd FileType markdown inoremap <leader>4 ####<space><CR><CR><++><Esc>2kA
autocmd FileType markdown inoremap <leader>5 #####<space><CR><CR><++><Esc>2kA
autocmd FileType markdown inoremap <leader>6 ######<space><CR><CR><++><Esc>2kA

"Insert Line Breaks
autocmd FileType markdown inoremap <leader>l <space><br><space>

"Insert Bold
autocmd FileType markdown inoremap <leader>b ****<space><++><Esc>6hi

"Insert Italics
autocmd FileType markdown inoremap <leader>i **<space><++><Esc>5hi

"Insert Emphasis
autocmd FileType markdown inoremap <leader>e ******<space><++><Esc>7hi

"Insert Quotes
autocmd FileType markdown inoremap <leader>q ><space>

"Insert URLs
autocmd FileType markdown inoremap <leader>u [](<++>)<space><++><Esc>11hi
autocmd FileType markdown inoremap <leader>U [](<++><space>"<++>")<space><++><Esc>18hi

"Insert Addresses
autocmd FileType markdown inoremap <leader>a <><space><++><Esc>5hi

"Insert Images
autocmd FileType markdown inoremap <leader>p ![](<++>)<space><++><Esc>11hi

"Insert Tick Lists
autocmd FileType markdown inoremap <leader>c -<space>[<space>]<space>
autocmd FileType markdown inoremap <leader>C -<space>[x]<space>

"Insert Definitions
autocmd FileType markdown inoremap <leader>d <CR>:<space><++><Esc>kI

"Insert Seperators
autocmd FileType markdown inoremap <leader>n <CR>---<CR><CR>

"Insert Bullet Points
autocmd FileType markdown inoremap <leader>. *<space><CR><CR><++><Esc>2kA
autocmd FileType markdown inoremap <leader>.. <Esc>o<CR>*<space>
autocmd FileType markdown inoremap <leader>> <Esc>o<CR><tab>*<space>
autocmd FileType markdown inoremap <leader>< <Esc>o<CR>*<space><Esc>2hxA

"Superscript
autocmd FileType markdown inoremap <leader>S ^^<space><++><Esc>5hi

"Subscript
autocmd FileType markdown inoremap <leader>s ~~<space><++><Esc>5hi



