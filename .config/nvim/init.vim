"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

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
Plug 'jalvesaq/Nvim-R'
Plug 'liuchengxu/vim-which-key'
call plug#end()


""""""""""""""""""""""
" Basic Vim Settings "
""""""""""""""""""""""

let mapleader = ";"
let maplocalleader=","

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
set splitbelow
set splitright
set timeoutlen=300


"""""""""""""""""""""""
" Vim Plugin Settings "
"""""""""""""""""""""""

let g:Hexokinase_highlighters=['foreground']
let g:limelight_conceal_ctermfg = '#3B4252'
let g:limelight_conceal_guifg = '#3B4252'
let g:airline_powerline_fonts = 1
let g:pencil#autoformat = 1
let g:pencil#textwidth = 80
let g:mkdp_browser = 'qutebrowser'
let g:gitgutter_map_keys = 0
let g:airline#extensions#hunks#non_zero_only = 1
let g:pandoc#folding#mode = ['manual']
let g:pandoc#folding#fdc = 0
let g:pandoc#syntax#conceal#urls = 1
let g:vimtex_view_method = 'zathura'
let g:which_key_map = {}
let g:which_key_use_floating_win = 0

"""""""""""""""""""""""""""
" Sourcing other settings "
"""""""""""""""""""""""""""

source $HOME/.config/nvim/whichKeyDictionary.vim
source $HOME/.config/nvim/markdownBindings.vim
source $HOME/.config/nvim/bindings.vim
source $HOME/.config/nvim/latexBindings.vim


"""""""""""""""
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
	autocmd ColorScheme * hi WhichKeySeperator guibg=NONE guifg=#B48EAD
augroup END

augroup filetype_markdown
	autocmd!
	autocmd FileType markdown :set spell spelllang=en_gb
	autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
	autocmd FileType tex call pencil#init({'wrap': 'soft'})
augroup END
colorscheme nord


