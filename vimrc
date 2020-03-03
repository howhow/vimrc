"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" file name:    vimrc_howchen
" author:       chenhow1985<at>gmail<dot>com
"
" description:  use github to sync vim config
"               details please refer:
"               https://github.com/howhow/vimrc
"
" license:      MIT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include fzf
set rtp+=~/.fzf

call plug#begin('~/.vim/plugged')

" plugin group for git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" super-tab
"Plugin 'ervandew/supertab'

" air-line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'edkolev/tmuxline.vim'

" UML
"Plug 'scrooloose/vim-slumlord'
"Plug 'aklt/plantuml-syntax'

" color
"Plug 'flazz/vim-colorschemes'
"Plug 'altercation/vim-colors-solarized'
"Plug 'dracula/vim'
"Plug 'morhetz/gruvbox'
Plug 'morhetz/gruvbox'

" use ALE to instead of syntastic
Plug 'dense-analysis/ale'

" Plug-in for tmux
"Plug 'tmux-plugins/vim-tmux'

" gtags
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

" scratch
"Plug 'mtth/scratch.vim'

" Latex
"Plug 'lervag/vimtex'

" use fzf as file search, easy and fast than ctrlp and command-t
" LeaderF can be use as function browser
Plug 'Yggdroot/LeaderF'

" fzf will be cloned and install via git and shell, so not use plugin manager
Plug 'junegunn/fzf.vim'

" ACK
Plug 'mileszs/ack.vim'

" Easy motion
Plug 'easymotion/vim-easymotion'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Initialize plugin system
call plug#end()


" filetype & syntax
filetype plugin on
filetype indent on

augroup assemblytoggle
    autocmd!
    au BufRead,BufNewFile *.s let asmsyntax='gas'|let filetype_inc='gas'
    au BufRead,BufNewFile *.asm let asmsyntax='armasm'|let filetype_inc='armasm'
augroup END

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

if has("unix") && strlen($MYVIMRC) < 1
  let $MYVIMRC=$HOME . '/.vimrc'
endif

" color scheme list
" solarized
" gruvbox
" dracula
" check if remote connection
if($SSH_CLIENT || $SSH_TTY)
    "set t_Co=256
    set background=dark
    if has("gui_running")
        syntax on
        colorscheme gruvbox
        hi cursorline guibg=#5f0000
        set guifont=DejaVu\ Sans\ Mono\ 10
        set lines=32
        set columns=128
        set mousemodel=popup
        set guioptions+=b
        set guioptions-=m
        set guioptions-=T
    endif
else
    syntax on
    set t_Co=256
    set background=dark
    colorscheme gruvbox
    if has("gui_running")
        hi cursorline guibg=#5f0000
        set guifont=DejaVu\ Sans\ Mono\ 10
        set lines=32
        set columns=128
        set mousemodel=popup
        set guioptions+=b
        set guioptions-=m
        set guioptions-=T
    endif
endif

" self config {
    set nocompatible
    set scrolloff=4  " 4 lines above/below cursor when scrolling
    "set ignorecase  " case insensitive
    "set smartcase   " but become case sensitive if typr uppercase
    "set number      " show line number
    set number relativenumber
    set ruler       " show cursor position in status bar
    set title       " show file in titlebar
    set incsearch
    set hlsearch
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set backspace=2
    set mouse=a
    "set mouse=v
    set showmatch
    set matchtime=2
    set cursorline
    set laststatus=2    "statusline always on
    set encoding=utf-8  " Necessary to show unicode glyphs
    set fileencodings=ucs-bom,utf-8,latin1,chinese
if has('unnamedplus')
    " By default, Vim will not use the system clipboard when yanking/pasting to
    " the default register. This option makes Vim use the system default
    " clipboard.
    " Note that on X11, there are _two_ system clipboards: the "standard" one, and
    " the selection/mouse-middle-click one. Vim sees the standard one as register
    " '+' (and this option makes Vim use it by default) and the selection one as
    " '*'.
    " See :h 'clipboard' for details.
    set clipboard=unnamedplus,unnamed
else
    " Vim now also uses the selection system clipboard for default yank/paste.
    set clipboard+=unnamed
endif
    set updatetime=100
"}


" EOL whitespace
function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" ctags {
    set tags=./tags,tags;
"}

" plugin config
" gutentags {
    " enable gtags module
    let g:gutentags_modules = ['ctags', 'gtags_cscope']

    " config project root markers.
    let g:gutentags_project_root = ['.root', '.git']

    " generate datebases in my cache directory, prevent gtags files polluting my project
    let g:gutentags_cache_dir = expand('~/.cache/tags')

    " forbid gutentags adding gtags databases
    let g:gutentags_auto_add_gtags_cscope = 0

    " switch to quickfix window automaticlly
    let g:gutentags_plus_switch=1
"}

" status line config
" Air-line {
"    let g:airline#extensions#tabline#enabled = 1
"}

" tmuxline {
"    let g:tmuxline_powerline_separators = 0
"    let g:tmuxline_separators = {
"    \ 'left' : '',
"    \ 'left_alt': '>',
"    \ 'right' : '',
"    \ 'right_alt' : '<',
"    \ 'space' : ' '}
"}

" YCM {
"   let g:ycm_extra_conf_globlist = ['~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/*','!~/*']
"    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
"}

" deoplete {
    let g:deoplete#enable_at_startup = 1
"}

" ALE {
    let g:ale_linters = {
    \   'c':['gcc', 'cppcheck'],
    \   'bash':['shellcheck'],
    \}
    let g:ale_echo_msg_format = '[%linter%][%severity%]%code: %%s'
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_on_insert_leave = 1
    let g:ale_c_gcc_options = '-Wall -O2 -std=gnu99'
    let g:ale_sign_error = 'x'
    let g:ale_sign_warning = '!'
    let g:airline#extensions#ale#enabled = 1
    let g:ale_set_loclist = 0
    "let g:ale_set_quickfix = 1
"}

" FZF {
    "let g:fzf_layout = { 'window': 'enew' }
    "let g:fzf_layout = { 'window': '-tabnew' }
    "let g:fzf_layout = { 'window': '10split enew' }
"}

" Ack and Ag {
    " use ag as the search engine
    if executable('ag')
        let g:ackprg = 'ag --nogroup --nocolor --column'
    endif
"}

" Easymotion {
    let g:EasyMotion_smartcase = 1
    "let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
    map <Leader><leader>h <Plug>(easymotion-linebackward)
    map <Leader><Leader>j <Plug>(easymotion-j)
    map <Leader><Leader>k <Plug>(easymotion-k)
    map <Leader><leader>l <Plug>(easymotion-lineforward)
    map <Leader><leader>. <Plug>(easymotion-repeat)

    " <Leader>f{char} to move to {char}
    map  <Leader>c <Plug>(easymotion-bd-f)
    nmap <Leader>c <Plug>(easymotion-overwin-f)

    " s{char}{char} to move to {char}{char}
    nmap s <Plug>(easymotion-overwin-f2)

    " Move to line
    map <Leader>L <Plug>(easymotion-bd-jk)
    nmap <Leader>L <Plug>(easymotion-overwin-line)

    " Move to word
    map  <Leader>w <Plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)
"}

" ultisnips {
    let g:UltiSnipsExpandTrigger="<c-e>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    let g:UltiSnipsEditSplit="horizontal"
"}

" key mapping {
    " current map leadr change to space
    let mapleader="\<Space>"
    noremap <leader>r :new $MYVIMRC<CR>
    noremap <silent> <leader>R :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

    " FZF mapping
    nmap <leader>f :FZF<cr>

    " LeaderF mapping
    nmap <leader>F :LeaderfFunction!<cr>

    " Ack,  don't jump to first result automatically
    nnoremap <leader>a :Ack!<Space><C-R>=expand("<cword>")<CR><CR>

    "inoremap <A-h> <C-o>h
    "inoremap <A-j> <C-o>j
    "inoremap <A-k> <C-o>k
    "inoremap <A-l> <C-o>l
    " use jj/hh/hj/jh to switch back to normal mode
    inoremap jj <Esc>
    inoremap hh <Esc>
    inoremap hj <Esc>
    inoremap jh <Esc>

    nmap <C-h> :noh<cr>
    nmap <leader>7 :bp<cr>
    nmap <leader>8 :bn<cr>

    " abt quickfix
    " :cw       open matched window
    " :cclose   close matched window
    nmap <leader>3 :cw<cr>
    nmap <leader>4 :cclose<cr>
    nmap <leader>5 :cp<cr>
    nmap <leader>6 :cn<cr>

    nmap <silent> <Leader>e :call <SID>StripTrailingWhitespace()<CR>:exe ":echo 'Strip EOL whitespace'"<CR>
    nmap <leader>wn :match ErrorMsg /\s\+$/<CR>
    nmap <leader>tn :match ErrorMsg /\t/<CR>
"}

