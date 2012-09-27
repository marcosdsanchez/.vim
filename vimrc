set nocompatible                " choose no compatibility with legacy vi
filetype off                    " required for Vundle
set exrc                        " enable per-directory .vimrc files
set secure                      " recommended security for external .vimrc files
set encoding=utf-8              " Encoding

set rtp+=~/.vim/bundle/vundle/  " Vundle
call vundle#rc()                " Vundle
" let Vundle manage Vundle
Bundle 'gmarik/vundle'

"Background
Bundle 'altercation/vim-colors-solarized'
syntax enable
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
set background=light

" MapLeader
let mapleader=","               " Change mapleader

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Editor
filetype plugin indent on       " Load file type plugins + indentation
set nostartofline               " Don’t reset cursor to start of line when moving around.
set nowrap                      " Don't wrap lines
set tabstop=2 shiftwidth=2      " A tab is two spaces (or set this to 4)
set expandtab                   " Use spaces, not tabs (optional)
set backspace=indent,eol,start  " Backspace through everything in insert mode
set laststatus=2                " Always show the statusline
set showcmd                     " Display incomplete commands
set nospell                     " Turn off spellchecker
set number                      " Show line numbers
set shortmess=atI               " Don't show intro messages
set report=0                    " Tell us about changes
set modeline
set modelines=10
set lazyredraw                  " Stop vim from redrawing the screen during complex operations
vmap > >gv                      " Keep visual mode during indenting
vmap < <gv                      " Keep visual mode during indenting
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
au FocusLost * :silent! wall    " Save when losing focus

" Mouse
set clipboard+=unnamed " Share your clipboard with system
set mouse=a            " Make mouse working!

set wildmode=list:longest,list:full  " Tab completion

" Ignore
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem,*.jar
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*

" Backups
set autoread                          " Load modified files automatically
set history=1000                      " Store lots of :cmdline history
set backupdir=~/.vim/tmp/backup/      " where to put backup files.
set directory=~/.vim/tmp/swap/        " where to put swap files.
set backupskip=/tmp/*,/private/tmp/*  " make Vim able to edit crontab files again.
set backup                            " enable backups
set noswapfile                        " It's 2012, Vim.
set undodir=~/.vim/undo/
set undofile

" Some personal shortcuts
nmap <leader>hs :nohlsearch<CR>
nmap <leader>fef ggVG=                " format the entire file
nmap <leader>u mQviwU`Q               " upper word
nmap <leader>l mQviwu`Q               " lower word
nmap <leader>U mQgewvU`Q              " upper first char of word
nmap <leader>L mQgewvu`Q              " upper first char of word
nmap <S-Enter> O<ESC>
nmap <CR> o<ESC>

" Functions
  function! ToggleLineNumbers()
    if(&number == 1)
       set nonumber
    else
       set number
    endif
  endfunc
  nmap <leader>tn  :call ToggleLineNumbers()<CR>                " Show/Hide line numbers

  function! ToggleRelativeNumbers()
    if(&relativenumber == 1)
       set norelativenumber
    else
       set relativenumber
    endif
  endfunc
  nmap <leader>trn  :call ToggleRelativeNumbers()<CR>            " Show/Hide relative line numbers

  " Removes trailing spaces
  function! ClearWhiteSpace()
    %s/\s*$//
    ''
  endfunc
  nmap <leader>cw :call ClearWhiteSpace()<CR>
