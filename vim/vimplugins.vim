call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'janko-m/vim-test'
Plug 'mileszs/ack.vim'
Plug 'henrik/vim-indexed-search'
Plug 'xolox/vim-misc'
Plug 'scrooloose/syntastic'
Plug 'gregsexton/gitv'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'mhinz/vim-signify'
source ~/.dotfile_local/vimrc.local
"Neovim plugins
if has('nvim')
    function! DoRemote(arg)
        UpdateRemotePlugins
    endfunction
    Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
    Plug 'zchee/deoplete-go', { 'do': 'make'}
    Plug 'kassio/neoterm'
endif
call plug#end()

"NERDTree options
silent! nnoremap <F2> :NERDTreeToggle<CR>

"airline options
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_default'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#whitespace#enabled = 0


"vim-test options
let test#javascript#mocha#executable = '/home/user/rbalasubra/.nvm/v0.10.42/bin/mocha'
let test#strategy = "neoterm"

"ack.vim options
let g:ackprg = "/home/user/rbalasubra/.linuxbrew/bin/ack -s -H --nocolor --nogroup --column"

" syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_javascript_checkers = [ 'jscs', 'jshint' ]

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_jumpm = 1
let g:syntastic_quiet_messages = { "level":  "warnings" }

" tmux line preset
let g:tmuxline_preset = {
        \ 'a': '#S',
        \ 'b': '#W',
        \ 'c': '#P',
        \ 'win': ['#I', '#W #F' ],
        \ 'cwin': ['#I', '#W #F'],
        \ 'x': '',
        \ 'y': '%a',
        \ 'z': ['%b %d', '%l:%M %p']}

" vim-go binding
au FileType go nmap <leader>r <Plug>(go-run)

" deoplete options
let g:deoplete#enable_at_startup = 1
autocmd CompleteDone * pclose!

" SuperTab like snippets' behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

" Vim-go options
let g:go_term_mode = "split"
let g:go_fmt_command = "goimports"

" Custom comment string
" autocmd FileType apache setlocal commentstring=#\ %s
"
" Rust autoformat rust.vim
let g:rustfmt_autosave = 1

" Vim signify options
let g:signify_vcs_list = [ 'git' ]
let g:signify_update_on_focusgained = 1

" NeoTerm
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap ,th :call neoterm#close()<cr>
nnoremap ,tl :call neoterm#clear()<cr>
nnoremap ,tc :call neoterm#kill()<cr>
let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = ',tt'
