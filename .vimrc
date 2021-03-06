set nocompatible
" enable syntax highlighting
syntax on
colorscheme monokai

" enable line numbers in gutter
set number
highlight LineNr ctermbg=None

filetype off                  " required


let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"


augroup vimrc
  " Remove all vimrc autocommands
  autocmd!
  au BufWritePost .vimrc so %
augroup END

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

call vundle#end()            " required
filetype plugin indent on    " required

set splitbelow
" python indentation
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

" powerline
set laststatus=2
set rtp+=/usr/share/powerline/bindings/vim
