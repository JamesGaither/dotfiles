" Plugins
call plug#begin()
Plug 'vim-python/python-syntax'
call plug#end()


set number
set spell
set wrap
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

" Python things
" python highlight does not work here. Need to TS
let g:python_highlight_all=1
au Filetype python set
	\ tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ textwidth=79
	\ expandtab
	\ autoindent


" Web Dev
" au BufNewFile,BufRead *.js, *.html, *.css
"    \ set tabstop=2
"    \ set softtabstop=2
"    \ set shiftwidth=2

