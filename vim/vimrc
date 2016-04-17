set nocompatible              " be iMproved, required

"Vim-plug
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'ajh17/VimCompletesMe'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'takac/vim-hardtime'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'janko-m/vim-test'
Plug 'AutoComplPop'
Plug 'ervandew/supertab'
Plug 'mileszs/ack.vim'
Plug 'henrik/vim-indexed-search'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'scrooloose/syntastic'
Plug 'gregsexton/gitv'
" Neovim plugins
if has('nvim')
        Plug 'kassio/neoterm'
endif
call plug#end()

"NERDTree options
silent! nnoremap <F2> :NERDTreeToggle<CR>

"airline options
let g:airline_powerline_fonts = 1
let g:airline_theme = 'wombat'

"Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

"vim-test options
let test#javascript#mocha#executable = '/home/user/rbalasubra/.nvm/v0.10.42/bin/mocha'
let test#strategy = "neoterm"

"ack.vim options
let g:ackprg = "/home/user/rbalasubra/.linuxbrew/bin/ack -s -H --nocolor --nogroup --column"

"vim-session options
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

" syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = [ 'jscs', 'jshint' ]

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_jumpm = 1
let g:syntastic_quiet_messages = { "level":  "warnings" }



filetype plugin on
"Set hardmode by default
"autocmd VimEnter,BufNewFile,BufReadPost * silent! HardTimeOn

"set file/directory ignores
set wildignore+=.git/*,*/node_modules/*

" Enable syntax highlighting
syntax on

" Hidden buffers
set hidden

" Use the Solarized Dark theme
colorscheme solarized
let g:solarized_termtrans=1
let g:solarized_termcolors=256
set background=dark

" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
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
" Start scrolling three lines before the horizontal window border
set scrolloff=10



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

" Run :FixWhitespace to remove end of line white space
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)


"jj remap to Esc and don't move cursor
inoremap jj <Esc>`^
nnoremap <CR> O<Esc>j
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

autocmd! BufEnter * FixWhitespace
autocmd! BufWritePost * FixWhitespace

