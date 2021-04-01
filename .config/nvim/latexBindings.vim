""""""""""""""""""
" LaTeX Bindings "
""""""""""""""""""

autocmd FileType tex :set spell spelllang=en_gb

"Bold Text
autocmd FileType tex inoremap <leader>b \textbf{}<space><++><Esc>T{i

"Italic Text
autocmd FileType tex inoremap <leader>i \textit{}<space><++><Esc>T{i

"Underlined Text
autocmd FileType tex inoremap <leader>u \underline{}<space><++><Esc>T{i

"Emphasised Text
autocmd FileType tex inoremap <leader>e \emph{}<space><++><Esc>T{i

"Comment
autocmd FileType tex inoremap <leader>c %<space>
