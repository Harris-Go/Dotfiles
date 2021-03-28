
"""""""""""
" Plugins "
"""""""""""

call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim' "Nord Colour Scheme
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } "Highlight Colours
Plug 'vim-airline/vim-airline' "Customised Status Bar
Plug 'junegunn/goyo.vim' "Distraction Free Writing
Plug 'junegunn/limelight.vim' "Focus on the current paragraph
Plug 'reedes/vim-pencil' "Adds writing features
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'dhruvasagar/vim-table-mode' "Makes it easier to edit tables
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } "Allows a visual of the markdown text
Plug 'lervag/vimtex' "Adds improved syntax highlighting for latex files
Plug 'airblade/vim-gitgutter' "Adds diff markers for changes in git repos
call plug#end()


""""""""""""""""""""""
" Basic Vim Settings "
""""""""""""""""""""""

set nocompatible
set termguicolors
set relativenumber
set incsearch
set ignorecase
set smartcase
set hlsearch
set number
syntax on
filetype plugin on
set encoding=utf-8
set clipboard=unnamedplus
set nospell
"set tw=80
set spelllang=en_gb
set showmatch
set conceallevel=2
set nofoldenable
set noswapfile
set updatetime=100
setlocal foldcolumn=0


"""""""""""""""""""""""
" Vim Plugin Settings "
"""""""""""""""""""""""

let g:Hexokinase_highlighters=['foreground']
let g:limelight_conceal_ctermfg = '#3B4252'
let g:limelight_conceal_guifg = '#3B4252'
let g:airline_powerline_fonts = 1
let g:pencil#autoformat = 1
let g:pencil#textwidth = 80
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:mkdp_browser = 'qutebrowser'
let g:gitgutter_map_keys = 0
let g:airline#extensions#hunks#non_zero_only = 1
let g:pandoc#folding#mode = ['manual']
let g:pandoc#folding#fdc = 0
let g:pandoc#syntax#conceal#urls = 1


"""""""""""""""""""""""
" Vim Keyboard Remaps "
"""""""""""""""""""""""

let mapleader = ","
"Toggle Writing Mode
nnoremap <leader>w :call ToggleWriting()<CR>
"Toggle Spelling
nnoremap <leader>s :setlocal spell! spelllang=en_gb<CR>
"Toggle Pencil
nnoremap <leader>sp :SoftPencil<CR>
nnoremap <leader>hp :HardPencil<CR>
nnoremap <leader>np :NoPencil<CR>
"Toggle Goyo
nnoremap <leader>g :Goyo 80<CR> "Format to Hard Wrap mode
nnoremap <leader>f gggqG
"Format from Hard Wrap mode
nnoremap <leader>F :%norm vipJ<CR>
"Toggle Limelight
nnoremap <leader>l :Limelight!!<CR>
"Turn of search highlight
nnoremap <silent> <leader>h :noh<CR>
"Toggle markdown preview
nnoremap <leader>m :MarkdownPreview<CR>
nnoremap <leader>pp :!pandoc %:p:r.md --from markdown+grid_tables -V geometry:"top=2cm, bottom=1.5cm, left=2cm, right=2cm" -V CJkmainfont="Roboto Medium" -o %:p:r.pdf<CR>
nnoremap <leader>pd :!pandoc %:p:r.md --from markdown+grid_tables -o %:p:r.docx<CR>
"Use ,, to jump to jump points
inoremap ,, <Esc>/<++><CR>:noh<CR>c4l
nnoremap ,, <Esc>/<++><CR>:noh<CR>c4l
"Use jj to enter normal mode
inoremap jj <Esc>
"Turn off arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"Set undo points
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap <CR> <CR><C-g>u

""""""""""""""""
" Writing Mode "
""""""""""""""""

let g:WritingMode=0
function! ToggleWriting()
	if !g:WritingMode
		call WritingOn()
	else
		call WritingOff()
	endif
endfunction

function! WritingOn()
	echo "Writing: On"
	let g:WritingMode=1
	Limelight
	Goyo 80
	HardPencil
	setlocal spell
	HexokinaseTurnOff
endfunction

function! WritingOff()
	echo "Writing: Off"
	let g:WritingMode=0
	Limelight!
	Goyo!
	NoPencil
	setlocal nospell
	HexokinaseTurnOn
endfunction


"""""""""""""""""""""""""
" Colour Scheme Changes "
"""""""""""""""""""""""""

augroup transparent
	autocmd!
	"Adjust colours of background and spell checking
	autocmd ColorScheme * hi Normal guibg=NONE ctermbg=NONE
	autocmd ColorScheme * hi NonText guibg=NONE ctermbg=NONE
	autocmd ColorScheme * hi SpellBad guibg=NONE guifg=#BF616A gui=undercurl,bold
	autocmd ColorScheme * hi SpellCap guibg=NONE guifg=#EBCB8B gui=undercurl,bold
	autocmd ColorScheme * hi SpellRare guibg=NONE guifg=#B48EAD gui=undercurl,bold
	autocmd ColorScheme * hi SpellLocal guibg=NONE guifg=#A3BE8C gui=undercurl,bold
	autocmd ColorScheme * hi SignColumn guibg=NONE
	autocmd ColorScheme * hi Conceal guifg=#88C0D0 guibg=NONE
augroup END

augroup filetype_markdown
	autocmd!
	"Set Bold, Italic and URL colors
	"autocmd ColorScheme * hi Bold gui=bold guifg=#88C0D0
	"autocmd ColorScheme * hi Italic gui=italic guifg=#88C0D0
	"autocmd ColorScheme * hi markdownUrl gui=bold,undercurl,italic guifg=#5E81AC
	autocmd FileType markdown :set spell spelllang=en_gb
	autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
	autocmd FileType tex call pencil#init({'wrap': 'soft'})
augroup END
colorscheme nord


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
autocmd FileType markdown inoremap <leader>> <Esc>o<tab>*<space>
autocmd FileType markdown inoremap <leader>< <Esc>o*<space><Esc>2hxA

"Superscript
autocmd FileType markdown inoremap <leader>S ^^<space><++><Esc>5hi

"Subscript
autocmd FileType markdown inoremap <leader>s ~~<space><++><Esc>5hi


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
