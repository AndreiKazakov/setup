set nocompatible
set mouse=a
set showmatch
set showcmd
set showmode
set ruler
set autoindent
set smartindent
set backspace=2
set tabstop=4
set nu
set smarttab
set shiftwidth=2
set foldmethod=manual
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set mps+=<:>
set expandtab
set softtabstop=2
set hlsearch
set incsearch
set cursorline
set wildmenu
set nobackup
set nowb
set noswapfile
set laststatus=2
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
syntax on
imap <silent> <down> <c-o>gj
imap <silent> <up> <c-o>gk
nmap <silent> <down> gj
nmap <silent> <up> gk
set clipboard=unnamed
