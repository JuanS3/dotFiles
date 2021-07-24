" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
" ~                                                                           ~ "
" ~                      {{ - Plug install packages - }}                      ~ "
" ~                                                                           ~ "
" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
call plug#begin('~/AppData/Local/nvim/plugged')

    " {{ On-demand loading }} "
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
        Plug 'jistr/vim-nerdtree-tabs'

        " Fuzzy finder - neovim-fzf-shim - special for GoNeovim"
        Plug 'akiyosi/gonvim-fuzzy'

        " FZF
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }


    " {{ Themes }} "
        Plug 'dracula/vim', { 'as': 'dracula' }
        Plug 'morhetz/gruvbox'
        Plug 'sonph/onehalf', { 'rtp': 'vim' }
        Plug 'joshdick/onedark.vim'

        " Airline
            Plug 'vim-airline/vim-airline'
            Plug 'vim-airline/vim-airline-themes'


    " {{ Coding }} "
        " Autocomplete
            Plug 'ncm2/ncm2'
            Plug 'roxma/nvim-yarp'
            Plug 'ncm2/ncm2-bufword'
            Plug 'ncm2/ncm2-path'
            Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
            Plug 'ncm2/ncm2-neoinclude' | Plug 'Shougo/neoinclude.vim'
            Plug 'ncm2/ncm2-path'

        " Python
            Plug 'ncm2/ncm2-jedi'

    " {{ Snippets }} "
        Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'

call plug#end()


" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
" ~                                                                           ~ "
" ~                           {{ - Basic Setup - }}                           ~ "
" ~                                                                           ~ "
" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
    " {{ Encoding }} "
        set encoding=utf-8
        set fileencoding=utf-8
        set fileencodings=utf-8
        set ttyfast

    " {{ Fix backspace indent }} "
        set backspace=indent,eol,start

    " {{ Tabs. May be overridden by autocmd rules }} "
        set tabstop=4
        set softtabstop=0
        set shiftwidth=4
        set expandtab

    " {{ Map leader to <space> }} "
        let mapleader=' '

    " {{ Enable hidden buffers }} "
        set hidden


    " {{ Searching }} "
        set hlsearch
        set incsearch
        set ignorecase
        set smartcase

    " {{ session management }} "
        let g:session_directory = "~/.vim/session"
        let g:session_autoload = "no"
        let g:session_autosave = "no"
        let g:session_command_aliases = 1


" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
" ~                                                                           ~ "
" ~                         {{ - Visual Settings - }}                         ~ "
" ~                                                                           ~ "
" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
    " {{ Basic visual settings }} "
        syntax on
        set ruler
        set number
        set relativenumber
        set cursorline
        set cursorcolumn
        set foldmethod=indent
        set foldlevel=99

        set title
        set titleold="Terminal"
        set titlestring=%F

        set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

        let no_buffers_menu=1
        set scrolloff=3

    " {{ Disable the blinking cursor }} "
        set gcr=a:blinkon0

    " {{ Status bar }} "
        set laststatus=2

    " {{ Use modeline overrides }} "
        set modeline
        set modelines=10

    " {{ Search mappings: These will make it so that going to the }} "
    " {{ next one in a search will center on the line it's found in }} "
        nnoremap n nzzz
        nnoremap N Nzzzv


" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
" ~                                                                           ~ "
" ~                          {{ - Abbreviations - }}                          ~ "
" ~                                                                           ~ "
" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
    cnoreabbrev W! w!
    cnoreabbrev Q! q!
    cnoreabbrev Qall! qall!
    cnoreabbrev Wq wq
    cnoreabbrev Wa wa
    cnoreabbrev wQ wq
    cnoreabbrev WQ wq
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev Qall qall


" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
" ~                                                                           ~ "
" ~                            {{ - Commands - }}                             ~ "
" ~                                                                           ~ "
" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
    " {{ remove trailing whitespaces }} "
        command! FixWhitespace :%s/\s\+$//e


" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
" ~                                                                           ~ "
" ~                            {{ - Functions - }}                            ~ "
" ~                                                                           ~ "
" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
    if !exists('*s:setupWrapping')
        function s:setupWrapping()
            set wrap
            set wm=2
            set textwidth=120
        endfunction
    endif


" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
" ~                                                                           ~ "
" ~                          {{ - Autocmd Rules - }}                          ~ "
" ~                                                                           ~ "
" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
    " {{ The PC is fast enough, do syntax highlight }} "
    " {{ syncing from start unless 200 lines }} "
        augroup vimrc-sync-fromstart
            autocmd!
            autocmd BufEnter * :syntax sync maxlines=200
        augroup end

    " {{ Remember cursor position }} "
        augroup vimrc-remember-cursor-position
            autocmd!
            autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
        augroup end

    " {{ TXT }} "
        augroup vimrc-wrapping
            autocmd!
            autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
        augroup end


    " {{ make/cmake }} "
        augroup vimrc-make-cmake
            autocmd!
            autocmd FileType make setlocal noexpandtab
            autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
        augroup end

    set autoread


" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
" ~                                                                           ~ "
" ~                            {{ - Mappings - }}                             ~ "
" ~                                                                           ~ "
" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
    " {{ Basics }} "
        noremap <leader>q :q<CR>
        noremap <leader>qn :q!<CR>
        noremap <leader>w :w<CR>
        noremap <leader>wq :wq<CR>

    " {{ Splits }} "
        noremap <leader>h :<C-u>split<CR>
        noremap <leader>v :<C-u>vsplit<CR>

    " {{ terminal emulation }} "
        nnoremap <silent> <leader>sh :terminal<CR>


    " {{ session management }} "
        nnoremap <leader>so :OpenSession<space>
        nnoremap <leader>ss :SaveSession<space>
        nnoremap <leader>sd :DeleteSession<CR>
        nnoremap <leader>sc :CloseSession<CR>

    " {{ Tabs }} "
        nnoremap <Tab> gt
        nnoremap <S-Tab> gT
        nnoremap <silent> <S-t> :tabnew<CR>

    " {{ working directory }} "
        nnoremap <leader>. :lcd %:p:h<CR>

    " {{ Opens an edit command with the path of the }} "
    " {{ currently edited file filled in }} "
        noremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

    " {{ Buffer nav }} "
        noremap <leader>bp :bp<CR>
        noremap <leader>bn :bn<CR>
        map <silent> <F6> :bprev<CR>
        map <silent> <F7> :bnext<CR>
        noremap <leader>bl :buffers<CR>

    " {{ Close buffer }} "
        noremap <leader>bd :bd<CR>
        noremap <leader>bdn :bd!<CR>

    " {{ Clean search (highlight) }} "
        nnoremap <silent> <leader><space> :noh<CR>

    " {{ Switching windows }} "
        noremap <C-j> <C-w>j
        noremap <C-k> <C-w>k
        noremap <C-l> <C-w>l
        noremap <C-h> <C-w>h

    " {{ Move visual block }} "
        vnoremap J :m '>+1<CR>gv=gv
        vnoremap K :m '<-2<CR>gv=gv


" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
" ~                                                                           ~ "
" ~                         {{ - Config Themes - }}                           ~ "
" ~                                                                           ~ "
" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
    " {{ Dracula }} "
        colorscheme gruvbox
        let g:airline_theme='onehalfdark'

    " {{ vim-airline }} "
        let g:airline_theme = 'powerlineish'
        let g:airline#extensions#branch#enabled = 1
        let g:airline#extensions#ale#enabled = 1
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tagbar#enabled = 1
        let g:airline#extensions#tabline#left_sep = ' '
        let g:airline#extensions#tabline#left_alt_sep = '|'
        let g:airline#extensions#tabline#formatter = 'unique_tail'
        let g:airline_skip_empty_sections = 1

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
        let g:airline_symbols.notexists = 'Ɇ'
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


" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
" ~                                                                           ~ "
" ~                        {{ - Config Pluggins - }}                          ~ "
" ~                                                                           ~ "
" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
    " {{ neovim-fzf-shim }} "
        let g:gonvim_fuzzy_ag_cmd = 'pt --nogroup --column --nocolor'

    " {{ NERDTree configuration }} "
        let g:NERDTreeChDirMode=2
        let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
        let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
        let g:NERDTreeShowBookmarks=1
        let g:nerdtree_tabs_focus_on_files=1
        let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
        let g:NERDTreeWinSize = 50
        let NERDTreeQuitOnOpen=1
        set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
        nnoremap <silent> <C-f> :NERDTreeFind<CR>
        nnoremap <silent> <C-b> :NERDTreeToggle<CR>


    " {{ FZF configuration }} "
        noremap <C-p> :FZF<CR>

        " This is the default extra key bindings
        let g:fzf_action = {
          \ 'ctrl-t': 'tab split',
          \ 'ctrl-x': 'split',
          \ 'ctrl-v': 'vsplit' }

        " This is the default extra key bindings
        let g:fzf_action = {
          \ 'ctrl-t': 'tab split',
          \ 'ctrl-x': 'split',
          \ 'ctrl-v': 'vsplit' }

        " An action can be a reference to a function that processes selected lines
        function! s:build_quickfix_list(lines)
          call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
          copen
          cc
        endfunction

        let g:fzf_action = {
          \ 'ctrl-q': function('s:build_quickfix_list'),
          \ 'ctrl-t': 'tab split',
          \ 'ctrl-x': 'split',
          \ 'ctrl-v': 'vsplit' }

        " - Popup window (center of the current window)
        let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }

        " Customize fzf colors to match your color scheme
        " - fzf#wrap translates this to a set of `--color` options
        let g:fzf_colors = { 'fg':      ['fg', 'Normal'],
                           \ 'bg':      ['bg', 'Normal'],
                           \ 'hl':      ['fg', 'Comment'],
                           \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                           \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
                           \ 'hl+':     ['fg', 'Statement'],
                           \ 'info':    ['fg', 'PreProc'],
                           \ 'border':  ['fg', 'Ignore'],
                           \ 'prompt':  ['fg', 'Conditional'],
                           \ 'pointer': ['fg', 'Exception'],
                           \ 'marker':  ['fg', 'Keyword'],
                           \ 'spinner': ['fg', 'Label'],
                           \ 'header':  ['fg', 'Comment'] }

        autocmd! FileType fzf
        autocmd  FileType fzf set laststatus=0 noshowmode noruler
            \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


    " {{ UtilSnips }} "
        let g:UltiSnipsExpandTrigger       = "<Tab>"
        let g:UltiSnipsJumpForwardTrigger  = "<M-n>"
        let g:UltiSnipsJumpBackwardTrigger = "<M-b>"

        " If you want :UltiSnipsEdit to split your window.
        let g:UltiSnipsEditSplit = "vertical"
