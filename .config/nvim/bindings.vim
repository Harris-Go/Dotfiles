"""""""""""""""""""""""
" Vim Keyboard Remaps "
"""""""""""""""""""""""

"Toggle Writing Mode
nnoremap <leader>m :call ToggleWriting()<CR>

"Toggle Spelling
nnoremap <leader>ss :setlocal spell! spelllang=en_gb<CR>

"Toggle Pencil
nnoremap <leader>ps :SoftPencil<CR>
nnoremap <leader>ph :HardPencil<CR>
nnoremap <leader>pn :NoPencil<CR>

"Toggle Goyo
nnoremap <leader>pg :Goyo 80<CR>

"Toggle Limelight
nnoremap <leader>pl :Limelight!!<CR>

"Turn off search highlight
nnoremap <silent> <leader><space> :noh<CR>

"Toggle previews
nnoremap <leader>lm :MarkdownPreview<CR>

"Toggle Table Mode
nnoremap <leader>pt :TableModeToggle<CR>

noremap <leader>ll :VimtexCompile<CR>

"Pandoc Commands
"nnoremap <leader>pp :!pandoc %:p:r.md --from markdown+grid_tables -V geometry:"top=2cm, bottom=1.5cm, left=2cm, right=2cm" -V CJkmainfont="Roboto Medium" -o %:p:r.pdf<CR>
"nnoremap <leader>pd :!pandoc %:p:r.md --from markdown+grid_tables -o %:p:r.docx<CR>

"Use ,, to jump to jump points
inoremap <leader><leader> <Esc>/<++><CR>:noh<CR>c4l
nnoremap <leader><leader> <Esc>/<++><CR>:noh<CR>c4l

"Use jj to enter normal mode
inoremap jj <Esc>

"Turn off arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"Map window controls
nnoremap <leader>wh <C-w>h
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>wj <C-w>j
nnoremap <leader>wH <C-w>H
nnoremap <leader>wJ <C-w>J
nnoremap <leader>wK <C-w>K
nnoremap <leader>wL <C-w>L
nnoremap <leader>w< <C-w><
nnoremap <leader>w> <C-w>>
nnoremap <leader>w+ <C-w>+
nnoremap <leader>w- <C-w>-
nnoremap <leader>w= <C-w>=
nnoremap <leader>wv :vsplit
nnoremap <leader>ws :split
nnoremap <leader>wn :vsplit $HOME/.config/nvim/init.vim<CR>

"Set undo points
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap <CR> <CR><C-g>u

"Terminal Mode Remaps
tnoremap jj <C-\><C-n>


