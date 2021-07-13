if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'mileszs/ack.vim'
Plug 'henrik/vim-indexed-search'
Plug 'xolox/vim-misc'
Plug 'scrooloose/syntastic'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
call plug#end()

"vim-fugitive
set diffopt+=vertical

"ack.vim options
let g:ackprg = "/usr/local/bin/ack -s -H --nocolor --nogroup --column"

" syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_javascript_checkers = [ 'jscs', 'jshint' ]
let g:syntastic_go_checkers = [ 'gofmt' ]

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

" Vim signify options
let g:signify_vcs_list = [ 'git' ]
let g:signify_update_on_focusgained = 1

" Ctrl-P
let g:ctrlp_custom_ignore = 'node_modules\|vendor'
