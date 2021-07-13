set nocompatible              " be iMproved, required

"Vim-plug
so $DOTFILEDIR/vim/vimplugins.vim

filetype plugin on

"Set hardmode by default
"autocmd VimEnter,BufNewFile,BufReadPost * silent! HardTimeOn

"set file/directory ignores
set wildignore+=.git/*,*/node_modules/*

" Enable syntax highlighting
syntax on

" Hidden buffers
set hidden

" Clipboard
set clipboard+=unnamedplus

" Split defaults
set splitright
set splitbelow

" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode - obsolete
"set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Highlight current line
set cursorline
" Make tabs as wide as four spaces
set tabstop=4
set shiftwidth=4
" Search mods - highlight, increment, switch off when editing
set hlsearch
hi Search ctermfg=LightGray
hi IncSearch ctermfg=Yellow
set incsearch
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch

" Ignore case of searches
set ignorecase
" Don't ignore case when using capital letter
set smartcase
" Always show status line
set laststatus=2
" Enable mouse in all modes
"set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Expand tabs to spaces
set expandtab
" Smart tab
set smarttab
" Auto save on buffer switch
set autowriteall
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start n lines before the horizontal window border
set scrolloff=20

" autoread file when it changes outside vim
set autoread

" confirm instead of failing commands
set confirm

"tha [2:43 PM]
" Stop annoying me every time I have a file open in two different vim
" sessions.
" 'e' is "Edit Anyway" in this circumstance. Other options you could use
" here:
" 'q' - quit.
" 'o' - open the file in read-only mode.
" 'r' - recover the changes.
augroup SimultaneousEdits
  autocmd!
  autocmd SwapExists * :let v:swapchoice = 'e'
augroup END

" Highlight EOL whitespace, http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" The above flashes annoyingly while typing, be calmer in insert mode
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction

autocmd! BufEnter * FixWhitespace
autocmd! BufWritePost * FixWhitespace

" Run :FixWhitespace to remove end of line white space
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)


"jj remap to Esc and don't move cursor
inoremap jj <Esc>`^
nnoremap <CR> O<Esc>j
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let mapleader = " "

" set word delimitors
"set iskeyword-=_

" paste toggle
set pastetoggle=<F6>

" no swap
set noswapfile

" copy mode
nnoremap <F8> :set invnumber invrelativenumber<CR>

" clear search highlighting
nnoremap <F7> :noh<CR>

" search and replace visual selection
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
