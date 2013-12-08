call pathogen#infect()
set background=dark
syntax on

set nocompatible
filetype indent plugin on
set expandtab
set smarttab
set autoindent

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1
let g:syntastic_auto_loc_list=1
let g:loaded_syntastic_puppet_puppetlint_checker=1
