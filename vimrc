execute pathogen#infect()
syntax on
filetype plugin indent on
set number rnu
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set backspace=indent,eol,start
set incsearch
set tw=76 ruler
set laststatus=2
inoremap <S-Tab> <C-V><Tab>
set background=dark
set clipboard+=unnamed
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
command Ls NERDTree 
