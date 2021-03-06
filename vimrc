set nocompatible                " choose no compatibility with legacy vi
filetype off                    " required for Vundle
set exrc                        " enable per-directory .vimrc files
set secure                      " recommended security for external .vimrc files
set encoding=utf-8              " Encoding

"Background
syntax enable

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
set expandtab                   " Use spaces, not tabs (optional)
set backspace=indent,eol,start  " Backspace through everything in insert mode
set laststatus=2                " Always show the statusline
set showcmd                     " Display incomplete commands
set nospell                     " Turn off spellchecker
set shortmess=atI               " Don't show intro messages
set report=0                    " Tell us about changes
set modeline
set modelines=10
set lazyredraw                  " Stop vim from redrawing the screen during complex operations
set list                        " Show trailing whitespace
set listchars=tab:\ ·,trail:·   " Show trailing whitespace

if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin"
     set clipboard=unnamed "on mac and windows, use * register for copy-paste
  else
     set clipboard=unnamedplus "on Linux use + register for copy-paste
  endif
endif

" Mouse
set mouse=a                     " Make mouse working!

set wildmode=list:longest,full  " Tab completion

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

" Shell
set shellcmdflag=-c                  " Make shell behave as command prompt

" Some personal shortcuts
nmap <silent> <leader>hs :nohlsearch<CR>
nmap <leader>fef ggVG=                " format the entire file
nmap <leader>a ggVG                   " select all

nnoremap <silent> <leader>tf  :tabfirst<CR>
nnoremap <silent> <leader>tl  :tablast<CR>
nnoremap <silent> <leader>tn  :tabnext<CR>
nnoremap <silent> <leader>ty  :tabnext<CR>
nnoremap <silent> <leader>tp  :tabprev<CR>
nnoremap <silent> <leader>tr  :tabprev<CR>
nnoremap <silent> <leader>tc  :tabclose<CR>
nnoremap <silent> <leader>tt  :tabnew<CR>
nnoremap <silent> <leader>to  :tabonly<CR>
let g:lasttab = 1
au TabLeave * let g:lasttab = tabpagenr()
nmap <Leader>tb :exe "tabn ".g:lasttab<CR>


" Make it easy to switch it to 2 or 4 spaces
nmap <leader>2 :set tabstop=2<cr>:set shiftwidth=2<cr>:set softtabstop=2<cr>
nmap <leader>4 :set tabstop=4<cr>:set shiftwidth=4<cr>:set softtabstop=4<cr>

map <S-Enter> O<ESC>
nmap <CR> o<ESC>

" If I forget sudo..
cmap w!! w !sudo tee % >/dev/null
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))  "Avoid typo!!!
nnoremap Y y$                        " Be consistent with C and D

" Functions
function! ToggleLineNumbers()
    if(&number == 1)
        set nonumber
    else
        set number
    endif
endfunc
nmap <leader>n  :call ToggleLineNumbers()<CR>                " Show/Hide line numbers

function! ToggleWrap()
    if(&wrap == 1)
        set nowrap
    else
        set wrap
    endif
endfunc
nmap <leader>w  :call ToggleWrap()<CR>                       " Set/Unset wrap

function! ToggleRelativeNumbers()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
nmap <leader>rn  :call ToggleRelativeNumbers()<CR>            " Show/Hide relative line numbers

" Removes trailing spaces
function! ClearWhiteSpace()
    %s/\s*$//
    ''
endfunc
nmap <leader>cw :call ClearWhiteSpace()<CR>

au FocusLost * :silent! wall    " Save when losing focus
set textwidth=120
set cc=+1
"  highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"  match OverLength /\%81v.*/


set rtp+=~/.vim/bundle/Vundle.vim  " Vundle
call vundle#begin()                " Vundle
" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Use local bundles if available
if filereadable(expand("~/.vim/bundlesrc"))
    source ~/.vim/bundlesrc
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
