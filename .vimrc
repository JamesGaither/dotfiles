" Plugins
call plug#begin()
Plug 'vim-python/python-syntax'
Plug 'preservim/nerdtree'
Plug 'nvie/vim-flake8'
Plug 'rust-lang/rust.vim'
call plug#end()


set number
set spell
set wrap
set hlsearch
syntax on
colorscheme slate

hi clear SpellBad                                                
hi SpellBad cterm=underline                                       
hi clear SpellRare                                               
hi SpellRare cterm=underline                                     
hi clear SpellCap                                                
hi SpellCap cterm=underline                                      
hi clear SpellLocal
hi SpellLocal cterm=underline

" Default settings
set ts=2
set sts=2
set sw=2
set expandtab

" Python things
let g:python_highlight_all=1
autocmd Filetype python set
	\ tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ textwidth=79
	\ expandtab
	\ autoindent
  \ colorcolumn=80

