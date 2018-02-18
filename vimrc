" Fisa-vim-config
" http://fisadev.github.io/fisa-vim-config/
" version: 8.3.1

" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.vim/plugged')

" Plugins from github repos:

" Override configs by directory 
Plug 'arielrossanigo/dir-configs-override.vim'
" Better file browser
Plug 'scrooloose/nerdtree'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Class/module browser
Plug 'majutsushi/tagbar'
" Code and files fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Plug 'fisadev/vim-ctrlp-cmdpalette'
" Zen coding
Plug 'mattn/emmet-vim'
" Git integration
Plug 'motemen/git-vim'
" Tab list panel
Plug 'kien/tabman.vim'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Terminal Vim with 256 colors colorscheme
Plug 'fisadev/fisa-vim-colorscheme'
" Consoles as buffers
Plug 'rosenfeld/conque-term'
" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'
" Surround
Plug 'tpope/vim-surround'
" Autoclose
Plug 'Townk/vim-autoclose'
" Indent text object
Plug 'michaeljsmith/vim-indent-object'
" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'
" Python autocompletion, go to definition.
Plug 'davidhalter/jedi-vim'
" Better autocompletion
Plug 'Shougo/neocomplcache.vim'
" Snippets manager (SnipMate), dependencies, and snippets repo
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'
" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'
" Automatically sort python imports
Plug 'fisadev/vim-isort'
" Drag visual blocks arround
Plug 'fisadev/dragvisuals.vim'
" Window chooser
Plug 't9md/vim-choosewin'
" Python and other languages code checker
" Plug 'scrooloose/syntastic'
" Paint css colors with the real color
Plug 'lilydjwg/colorizer'
" Ack code search (requires ack installed in the system)
Plug 'mileszs/ack.vim'

" if has('python')
    " YAPF formatter for Python
"     Plug 'pignacio/vim-yapf-format'
" endif

" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative 
" numbering every time you go to normal mode. Author refuses to add a setting 
" to avoid that)
" Plug 'myusuf3/numbers.vim'

" Plugins from vim-scripts repos:

" Search results counter
Plug 'vim-scripts/IndexedSearch'
" XML/HTML tags navigation
Plug 'vim-scripts/matchit.zip'
" Gvim colorscheme
Plug 'vim-scripts/Wombat'
" Yank history navigation
Plug 'vim-scripts/YankRing.vim'


" SuperTab
" Plug 'ervandew/supertab'
" vim-mapping-conflicts
Plug 'lukhio/vim-mapping-conflicts'
" vim-asterisk
Plug 'haya14busa/vim-asterisk'
" vim-highlight-cursor-words
Plug 'pboettch/vim-highlight-cursor-words'
" vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'
" multiselect : Create multiple selections and operate
Plug 'vim-scripts/multiselect'
" genutils : General utility functions 
Plug 'vim-scripts/genutils'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish

" no vi-compatible
set nocompatible

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Show Color
set t_Co=256

" always show status bar
set ls=2

" incremental search
set incsearch
" highlighted search results
set hlsearch

" syntax highlight on
syntax on

" show line numbers
set nu

" tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm 
map tt :tabnew 
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

" old autocomplete keyboard shortcut
" imap <C-J> <C-X><C-O>

" Comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
set completeopt-=preview

" save as sudo
ca w!! w !sudo tee "%"

" simple recursive grep
nmap ,r :Ack 
nmap ,wr :Ack <cword><CR>

" use 256 colors when possible
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
	"let &t_Co = 256
    colorscheme delek 
else
    colorscheme fisa 
endif

" colors for gvim
if has('gui_running')
    colorscheme wombat
endif

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" Tagbar ----------------------------- 

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" NERDTree ----------------------------- 

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']


" Tasklist ------------------------------

" show pending tasks list
map <F2> :TaskList<CR>

" CtrlP ------------------------------

" file finder mapping
let g:ctrlp_map = ',e'
" tags (symbols) in current file finder mapping
nmap ,g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap ,f :CtrlPLine<CR>
" recent files finder mapping
nmap ,m :CtrlPMRUFiles<CR>
" commands finder mapping
nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" Syntastic ------------------------------

" show list of errors and warnings on the current file
" nmap <leader>e :Errors<CR>
" check also when just opened the file
" let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
" let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous setting)
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'
" let g:syntastic_style_error_symbol = '✗'
" let g:syntastic_style_warning_symbol = '⚠'

" Jedi-vim ------------------------------

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" NeoComplCache ------------------------------

" most of them not documented because I'm not sure how they work
" (docs aren't good, had to do a lot of trial and error to make 
" it play nice)
" let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_enable_ignore_case = 1
" let g:neocomplcache_enable_smart_case = 1
" let g:neocomplcache_enable_auto_select = 1
" let g:neocomplcache_enable_fuzzy_completion = 1
" let g:neocomplcache_enable_camel_case_completion = 1
" let g:neocomplcache_enable_underbar_completion = 1
" let g:neocomplcache_fuzzy_completion_start_length = 1
" let g:neocomplcache_auto_completion_start_length = 1
" let g:neocomplcache_manual_completion_start_length = 1
" let g:neocomplcache_min_keyword_length = 1
" let g:neocomplcache_min_syntax_length = 1
" " complete with workds from any opened file
" let g:neocomplcache_same_filetype_lists = {}
" let g:neocomplcache_same_filetype_lists._ = '_'
" 
" TabMan ------------------------------

" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" DragVisuals ------------------------------

" mappings to move blocks in 4 directions
vmap <expr> <S-M-LEFT> DVB_Drag('left')
vmap <expr> <S-M-RIGHT> DVB_Drag('right')
vmap <expr> <S-M-DOWN> DVB_Drag('down')
vmap <expr> <S-M-UP> DVB_Drag('up')
" mapping to duplicate block
vmap <expr> D DVB_Duplicate()

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Window Chooser ------------------------------

" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" Airline ------------------------------
let g:airline_powerline_fonts = 1 
let g:airline_theme = 'dark'
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '' 
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = '' 
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''



" New Settings -------------------------------------------------

" Mouse Setting
set mouse=a

vnoremap > >gv
vnoremap < <gv
vnoremap <C-T> >gv
vnoremap <C-D> <gv
vnoremap <C-I> >gv

set clipboard=unnamedplus

vmap y "+y 
vmap d "+d 
vmap p "+p 
vmap P "+P
nmap p "+p 
nmap P "+P 

" Backspace adjust
set backspace=indent,eol,start

" Automatically wrap left and right
set whichwrap+=<,>,h,l,[,]

" Show current and line number
set relativenumber

" Insert Newline at Normal Mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Save File 
nnoremap <silent> <C-S> :update<cr>
inoremap <silent> <C-S> <c-o>:update<cr>
vnoremap <silent> <C-S> <c-c>:update<cr>

" Jump to Visual Mode from Insert Mode
inoremap <C-V> <c-o>v

" Undo & Redo in Insert Mode
inoremap <C-Z> <c-o>:earlier<cr>
inoremap <C-R> <c-o>:later<cr>

" Execute Python
function ExecutePython()
    if &filetype=~'py'
        :w
        :exec '!clear;python' shellescape(@%, 1)
    endif
endfunction
nnoremap <silent> <C-K> <esc>:call ExecutePython()<cr>
inoremap <silent> <C-K> <c-o>:call ExecutePython()<cr>

" Comments and Uncomments (Single line)
function CommentOrNot()
    if &filetype=~'py'
        let [m,n] = [line('.'),col('.')]
            if getline('.')[0:1] =~ '# '
                :s/^# //
                :noh
                :cal cursor(m, n-2)
            else
                :s/^/# / 
                :noh
                :cal cursor(m, n+2)
            endif
    elseif &filetype=~'vim'
        let [m,n] = [line('.'),col('.')]
            if getline('.')[0:1] =~ '" '
                :s/^" //
                :noh
                :cal cursor(m, n-2)
            else
                :s/^/" / 
                :noh
                :cal cursor(m, n+2)
            endif
    endif
endfunction
nnoremap <silent> <C-J> <esc>:call CommentOrNot()<cr>
inoremap <silent> <C-J> <c-o>:call CommentOrNot()<cr>

" Comments and Uncomments (Multiple lines)
function CommentInVis()
    let [m,n] = [line('.'),col('.')]
    if &filetype=~'py'
        if getline('.')[0:1] =~ '# '
            :s/^# //
            :noh
        else
            :s/^/# /
            :noh
        endif
    endif
    if &filetype=~'vim'
        if getline('.')[0:1] =~ '" '
            :s/^" //
            :noh
        else
            :s/^/" /
            :noh
        endif
    endif
endfunction
vnoremap <silent> <C-J> <c-v>:call CommentInVis()<cr>

" Automatically insert a Matching Brace
vnoremap " <esc>:call Bracket("\"", "\"")<cr><esc>
vnoremap ' <esc>:call Bracket("'", "'")<cr><esc>
vnoremap ( <esc>:call Bracket("(", ")")<cr><esc>
vnoremap [ <esc>:call Bracket("[","]")<cr><esc>
vnoremap { <esc>:call Bracket("{","}")<cr><esc>
vnoremap < <esc>:call Bracket("<",">")<cr><esc>

function Bracket(char1, char2)
    let posStart = getpos("'<")
    let posEnd = getpos("'>")
    let posEnd[2] = posEnd[2]+1
    call setpos('.',posStart)
    normal! v
    call setpos('.',posEnd)
    echom a:char1
    echom a:char2
    exec 's/\%V\(.*\)\%V/' . a:char1 . '\1' . a:char2 . '/'
    :cal cursor(posEnd[1], posEnd[2]+2)
endfunction

" Mapping keys when running tmux
if &term =~ '^screen' && exists('$TMUX')
"     set mouse+=a
    " tmux knows the extended mouse mode
    set ttymouse=xterm2

    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
    execute "set <xHome>=\e[1;*H"
    execute "set <xEnd>=\e[1;*F"
    execute "set <Insert>=\e[2;*~"
    execute "set <Delete>=\e[3;*~"
    execute "set <PageUp>=\e[5;*~"
    execute "set <PageDown>=\e[6;*~"
    execute "set <xF1>=\e[1;*P"
    execute "set <xF2>=\e[1;*Q"
    execute "set <xF3>=\e[1;*R"
    execute "set <xF4>=\e[1;*S"
    execute "set <F5>=\e[15;*~"
    execute "set <F6>=\e[17;*~"
    execute "set <F7>=\e[18;*~"
    execute "set <F8>=\e[19;*~"
    execute "set <F9>=\e[20;*~"
    execute "set <F10>=\e[21;*~"
    execute "set <F11>=\e[23;*~"
    execute "set <F12>=\e[24;*~"
endif



" Disable the Preview Window after Autocompletion
" let g:SuperTabClosePreviewOnPopupClose = 1
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" set completeopt-=preview
" let g:jedi#popup_on_dot = 0
" let g:jedi#show_call_signatures = "1"
" let g:neocomplcache_force_overwrite_completefunc = 0
" let g:jedi#completions_enabled = 0
" autocmd FileType python setlocal completeopt-=preview

let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" Map start key separately from next key
let g:multi_cursor_start_key='<F6>'
let g:multi_cursor_start_key='<C-n>'
let g:multi_cursor_start_word_key='g<C-n>'
let g:multi_cursor_quit_key='<C-c>'

nnoremap <C-c> :call multiple_cursors#quit()<CR>

" let g:HiCursorWords_style='term=reverse cterm=reverse gui=reverse'
let g:HiCursorWords_linkStyle='VisualNOS'

