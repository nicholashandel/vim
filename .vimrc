set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936
""""""""""""""""""""""VUNDLE PLUGIN""""""""""""""""""""

set nocompatible

" dos2unix
set ff=unix

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')


call pathogen#helptags()
call pathogen#infect()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'ascenator/L9'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'kabbamine/vcoolor.vim'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-sexp'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'mattn/emmet-vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'walm/jshint.vim'
Plugin 'moll/vim-node'
Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentLine'
Plugin 'nvie/vim-flake8'
if has('python')
    Plugin 'davidhalter/jedi-vim'
    Plugin 'axiaoxin/vim-json-line-format'
    Plugin 'SirVer/ultisnips'
endif
Plugin 'axiaoxin/favorite-vim-colorscheme'
Plugin 'junegunn/vim-emoji'
Plugin 'mhinz/vim-startify'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-surround'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'


call vundle#end()

filetype plugin indent on

" Brief help

set nu

set backspace=2

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set smarttab
set autoindent
set smartindent

autocmd BufWritePre * :%s/\s\+$//e

autocmd BufWritePre * :%s/^$\n\+\%$//ge

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nowrap
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

" Tab
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround

set fdm=indent

set foldenable
set foldlevel=99
set foldlevelstart=10
set foldnestmax=10

set cursorline
set cursorcolumn

autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

autocmd filetype python set expandtab

autocmd filetype html,xml set listchars-=tab:>.

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

"""""""""""""""""""""""""KEY MAPPING""""""""""""""""""""

" buffer
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

nnoremap [t :tabp<CR>
nnoremap ]t :tabn<CR>

" normal
nmap <C-c> gg"+yG

" visual
vmap <C-c> "+y

" Ctrl+v
inoremap <C-v> <ESC>"+pa

" w!!
cmap w!! w !sudo tee >/dev/null %:p

" F2
nnoremap <F2> :set nonu!<CR>:set foldcolumn=0<CR>

" F3
nmap <silent> <F3> :NERDTreeToggle<CR>

" F4TagList
nmap <silent> <F4> :TagbarToggle<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" F5
if exists("$VIRTUAL_ENV")
    autocmd FileType python map <buffer> <F5> :!$VIRTUAL_ENV'/bin/python' %:p<CR>
else
    autocmd FileType python map <buffer> <F5> :!python %:p<CR>
endif

" <F6>
map <F6> <Esc>:tabnew<CR>

" <F7>
set pastetoggle=<F7>

if has("win64") || has("win32")
    " <F8> sort import and auto pep8
    autocmd FileType python map <buffer> <F8> :!autopep8 -i -a --ignore=W690,E501 %:p<CR><CR>
    " <F9> pep8 by yapf
    autocmd FileType python map <buffer> <F9> :!yapf -i %:p --style=pep8<CR><CR>
else
    " <F8> sort import and auto pep8
    autocmd FileType python map <buffer> <F8> :!autopep8 -i -a --ignore=W690,E501 %:p;isort %:p;<CR><CR>
    " <F9> pep8 by yapf
    autocmd FileType python map <buffer> <F9> :!yapf -i %:p --style=pep8;isort %:p;<CR><CR>
endif

nnoremap w" viw<esc>a"<esc>hbi"<esc>lel
nnoremap w' viw<esc>a'<esc>hbi'<esc>lel

" Normal Mode Visual/Select Mode
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

" quicker window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" quicker window resize
nnoremap <C-Enter> <C-w>=
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-

" emoji
imap <C-e> <C-X><C-U>

" Q
vmap Q gq
nmap Q gqap

nmap <silent> ,/ :nohlsearch<CR>

" sudo in a file
cmap w!! w !sudo tee % >/dev/null

let mapleader=","       " leader is comma

" jk is escape
inoremap jk <esc>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <leader>s :mksession<CR>

" open ag.vim
nnoremap <leader>a :Ag

""""""""""""""""""""""""""""""PLUGIN CONFIG""""""""""""""""""""""""""
" NerdCommenter
let g:NERDSpaceDelims=1

" NERDTREE
let NERDTreeIgnore=['\.pyc$', '\~$']
" show nerdtree when starts up
"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

"Ctrl-X Ctrl-U emoji
set completefunc=emoji#complete

" instant-markdown
let g:instant_markdown_slow = 1

" airline
let g:airline_section_y = '%{strftime("%H:%M")}'
" tabline
let g:airline#extensions#tabline#enabled = 1
" tabline buffer
let g:airline#extensions#tabline#left_sep = ' '
" tabline buffer
let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline buffer
let g:airline#extensions#tabline#buffer_nr_show = 1

" jedi
autocmd FileType python setlocal completeopt-=preview
let g:jedi#completions_command = "<C-n>"

" flake8
let g:flake8_show_in_file = 1
let g:flake8_show_in_gutter = 1
autocmd! BufRead,BufWritePost *.py call Flake8()

" gitgutter
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" jshint
autocmd! BufRead,BufWritePost *.js :JSHint

" vim-table-mode: markdown
let g:table_mode_corner="|"

" rainbow_parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" vim-clojure-static
let g:clojure_syntax_keywords = {
    \ 'clojureMacro': ["defproject", "defcustom"],
    \ 'clojureFunc': ["string/join", "string/replace"]
    \ }

" vim-clojure-highlight
autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry

" Tmux
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


" vCoolor.vim
let g:vcoolor_map = '<leader>cp'
let g:vcool_ins_rgb_map = '<leader>cpr'       " Insert rgb color.
let g:vcool_ins_hsl_map = '<leader>cph'       " Insert hsl color.
let g:vcool_ins_rgba_map = '<leader>cpra'      " Insert rgba color.

if &t_Co >= 256 || has("gui_running")
    set guifont=Menlo:h14

    colorscheme elflord
    set background=dark
endif

if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
endif
let mapleader=","
