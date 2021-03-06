" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
" set nocompatible
set nu
set backspace=indent,eol,start
set shell=/bin/bash

filetype indent plugin on " Detect file type by format or content
filetype plugin on    " Provides Intelligent Auto-Indenting
syntax on         " Enables Syntax Highlighting    
" set hidden         " Hides Buffers, even when unsaved. Complaints if exit without saving.
" Hide the toobar and menubar
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
" window for multiple buffers, and/or:
" set confirm
" set autowriteall

" let terminal resize scale the internal windows
autocmd VimResized * :wincmd =

" Colorschemes
" Some other light color schemes: blear, summerfruit256, breeze, pyte
" Some modifications to the Zenburn colorscheme.
" Ref: http://statico.github.io/vim.html
function! ColorTermZenburn()
    colorscheme zenburn
    highlight Normal ctermbg=234
    highlight CursorLine ctermbg=236
    let g:zenburn_high_Contrast = 1
endfunction

set t_Co=256              " Explicitly tell vim that the terminal supports 256 colors.

if has("gui_running")  " Terminal supports 256 colors?
    if has("mac")
        " colorscheme apprentice
        " colorscheme seoul256
        " colorscheme gruvbox
        call ColorTermZenburn()
        " colorscheme distinguished
        set guifont=Monaco\ for\ Powerline:h13
        " set guifont=Fira\ Code:h17
        " set bg=light
        " does not work properly on os x
        " an GUIEnter * set fullscreen
        set lines=400 columns=550                   " maximize window on startup
    else
        set guifont=Monaco 13
    endif
    " Because solarized is being a bitch
    set background=dark 
    
    " Set colorscheme for diffs
    if &diff
      colorscheme solarized
      set bg=light
    endif
else
    " colorscheme Tomorrow-Night-Bright
    " colorscheme solarized
    " colorscheme gruvbox
    " colorscheme grb256
    colorscheme github
    " set bg=dark
endif
let g:solarized_diffmode="high"             " Solarized has a beautiful diff contrast


" set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ \
"                       \ (%{&ff})\ %y\ %{fugitive#statusline()}\ \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\
"                       \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\ %L\ lines " requires fugitive.

" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart
set wildmenu        " Better Command-Line completion
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*.zip,*.sw[op]
"set wildmode=list:full
set showcmd        " Show partial commands in the last line of the screen
set hlsearch        " Highlight search.
set incsearch
set ignorecase         " Ignore case when searching
set smartcase        " Ignore case when search pattern all lowercase. Case-sensitive otherwise.

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"Indentation Settings. Taken from the Hitchhiker's guide to Python.
set scrolloff=5
set title
set ttyfast
"set tabstop=4
"set softtabstop=4
set expandtab 
set shiftround
"set shiftwidth=4
set autochdir

" ------------------------------- Begin Filetype config ---------------------------------
" autocmd FileType sh colorscheme dante
autocmd FileType python set tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType modula2 set tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType markdown set tabstop=4 softtabstop=4 shiftwidth=4
" autocmd FileType python setlocal cc=80
autocmd FileType javascript set tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType javascript let b:javascript_fold = 0
autocmd BufNewFile,BufRead *.json setlocal ft=javascript
let javascript_enable_domhtmlcss=1
autocmd FileType html,htmldjango set tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType css set tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType cpp set tabstop=8 softtabstop=8 shiftwidth=8
autocmd FileType c set tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType cpp set tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.go setlocal ft=go
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 
" autocmd Filetype go autocmd BufWritePre <buffer> Fmt
autocmd FileType java set tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType sml set tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType ruby set expandtab tabstop=4 softtabstop=4 shiftwidth=4 formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType coffee setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType lua setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType rust setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4
autocmd FileType rust setlocal commentstring=//\ %s
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2
autocmd BufNewFile,BufRead *.sls setlocal ft=yaml
au FileType make setlocal noexpandtab " Don't expand tabs into spaces when editing makefiles
" template language support (SGML / XML too)
" ------------------------------------------
" and disable that stupid html rendering (like making stuff bold etc)
autocmd FileType xml,html,htmljinja,htmldjango setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-e> <Plug>SparkupExecute
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-l> <Plug>SparkupNext
autocmd FileType html setlocal commentstring=<!--\ %s\ -->
autocmd FileType htmljinja setlocal commentstring={#\ %s\ #}
autocmd BufWritePre *.py :%s/\s\+$//e   " Removing Trailing Whitespace on buffer write
autocmd BufWritePre *.py :%s/\s\+$//e   " Removing Trailing Whitespace on buffer write
autocmd BufWritePre *.js :%s/\s\+$//e   " Removing Trailing Whitespace on buffer write
autocmd BufRead,BufNewFile **/templates/*.html set filetype=htmljinja
let html_no_rendering=1

" Run shortcut for different file types
au FileType python map <leader>r :!python %<CR>
au FileType go map <leader>r :!go run %<CR>
au FileType c map <leader>r :!gcc -Wall -g %; ./a.out<CR>
au FileType cpp map <leader>r :!g++ -Wall -g %; ./a.out<CR>
au FileType ruby map <leader>r :!ruby %<CR>
au FileType perl map <leader>r :!perl %<CR>
au FileType php map <leader>r :!php %<CR>
au FileType javascript map <leader>r :!node %<CR>
au FileType coffee map <leader>r :!coffee %<CR>
" au FileType coffee map <leader>c :!coffee -c %<CR>
" au FileType coffee map <leader>p :!coffee -p %<CR>

" Java Compile, Run, and Compile+Run respectively
au FileType java map <leader>q :!javac %<CR>
au FileType java map <leader>r :!java -cp %:p:h %:t:r<CR>
au FileType java map <leader>qr :!javac %; java -cp %:p:h %:t:r<CR>

" When loading text files, wrap them and don't split up words.
au BufNewFile,BufRead *.txt setlocal wrap 
au BufNewFile,BufRead *.txt setlocal lbr
" Turn on spell-checking in markdown and text.
" au Filetype gitcommit setlocal spell
au Filetype markdown setlocal spell

" ------------------------------- End Filetype config ---------------------------------

set confirm        " Dialog asking if you want to save changed files.
"set visualbell        " Use visual bell instead of beeping when doing something wrong
" don't bell or blink
set noerrorbells
set vb t_vb=
set mouse=a         " Enable use of the mouse for all modes
set mousemodel=popup
set pastetoggle=<F2>    " Temporarily disables auto indenting and other stuff. Use right before pasting large amount of code.
" This will stop vim from applying it's own indenting features on the paste.

set showcmd
set laststatus=2        " Always show the status line
if !has('nvim')
    " Original vim specific things that nvim breaks
    set encoding=utf-8
endif
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files
" set tags=~/.ctags.d  " ctags source directory

" Automatically generate Shebang
augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># -*- coding: utf-8 -*-\<nl>\"|$
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby -w\<nl># encoding: UTF-8\<nl>\"|$
  autocmd BufNewFile *.sh 0put =\"#!/bin/bash\<nl>\"|$
  "autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
  "autocmd BufNewFile *.\(cc\|hh\) 0put =\"//\<nl>// \".expand(\"<afile>:t\").\" -- \<nl>//\<nl>\"|2|start!
augroup END

"----------------------------------- Begin Custom Mappings ---------------------------------
let mapleader = ";" "Changing the default <leader> key from \ to ;

"Dot behaves like in normal mode
vnoremap . :norm.<CR>       

"Shortcut for opening Split-Windows
" map <leader>o :split<CR>
" map <leader>e :vsplit<CR>
map <leader>d :bd<CR>
" Hide current split
map <leader>h :hide<CR>

"Quickly open new tabs
"map <leader>t :tabnew<CR>

" Quickly move a split to a new tab
map <leader>sp :tab sp<CR>

"Easy Split-Window navigation:
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Hide all but current split
map <leader>a <c-w>o

" Resize splits more quickly.
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Clearing the search buffer by pressing ,/ (Note - NOT the leader key)
nmap <silent> ,/ :nohlsearch<CR>

" Reopen a file in sudo-mode by pressing w!!
cmap w!! w !sudo tee % >/dev/null

" clipboard
set clipboard=unnamed

" Column
hi ColorColumn ctermbg=lightgrey guibg=lightgrey

" Cycle through buffers 
map <leader>j :bp<CR>
map <leader>k :bn<CR>

" Move through tabs
map <leader>tn :tabNext<CR>
map <leader>tp :tabprevious<CR>
map <leader>to :tabnew<CR>              
" tab open!"

" Quickly Change Font-Size, since it's something I seem to do a lot. - GVim
" nmap <leader>1 :set guifont=Monaco\\ 13<CR>
" nmap <leader>0 :set guifont=Monaco\\ 10<CR>
" nmap <leader>2 :set guifont=DejaVu\\ Sans\\ Mono\\ 10<CR>
" nmap <leader>3 :set guifont=DejaVu\\ Sans\\ Mono\\ 13<CR>

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
:nmap <leader>v :e $MYVIMRC<CR>

" List directory contents of the file in current buffer
" nmap <leader>15 :!ls %:p:h<CR>

" Set the current directory to that of the file in buffer
" For all windows.
" nmap <leader>16 :cd %:p:h<CR>       
" Only for current window.
" nmap <leader>17 :lcd %:p:h<CR>

" See whitespaces
nnoremap <leader>tab :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>

vnoremap <leader>c :!column -t<CR>

" Cursor position after pressing enter immediately after curly braces/angle
" brackets etc
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

"----------------------------------- End Custom Mappings ---------------------------------
" Racket file settings
if has("autocmd")
    au BufReadPost *.rkt,*.rktl set filetype=scheme
endif

" Rename current file
function! RenameFile()
        let old_name = expand('%')
        let new_name = input('New file name: ', expand('%'), 'file')
        if new_name != '' && new_name != old_name
                exec ':saveas ' . new_name
                exec ':silent !rm ' . old_name
                redraw!
        endif
endfunction
map <leader>n :call RenameFile()<CR>

nnoremap <silent><leader>u :set relativenumber!<cr>

" Auto-reload vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Make a simple "search" text object.
" Ref: http://vim.wikia.com/wiki/Copy_or_change_search_hit
" Usage:
" 1. Search via /foo.
" 2. Hit cs, replace first match, and hit <Esc>. Also see cgn.
" 3. Hit n to find the next occurrence and press . to repeat the change.
" 4. Similarly, ys to copy, gUs to uppercase, vs to visually select.
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" Text under cursor search with Ag
nnoremap <leader>ag :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" Cursor hacks
" Jump from one key to another in a dictionary
nnoremap <right> va'<esc>f'
nnoremap <left> va'o<esc>F'va'o<esc>l

" Insert line numbers over a selection.
vnoremap <leader>ln :s/^/\=printf("%d.\t", line(".") - line("'<") + 1)<CR>

"autocmd InsertEnter * :set number
"autocmd InsertLeave * :set relativenumber

" Tmux status bar hack
" autocmd VimEnter,VimLeave * silent !tmux set status
" Fix for E303 bug
" set directory=.,$TEMP

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" -------------- Plugins --------------------------------
" This is the part that makes vim slower than I'd like :(

" Maintained using vim-plug: https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/plugged')

" Make sure to use single quotes
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'burke/matcher'
Plug 'tacahiroy/ctrlp-funky'
Plug 'tpope/vim-fugitive'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'rking/ag.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'mitsuhiko/vim-jinja'
Plug 'mattn/emmet-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'dhruvasagar/vim-dotoo'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/syntastic'
Plug 'mxw/vim-jsx'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'https://github.com/Shutnik/jshint2.vim'
Plug 'xolox/vim-lua-ftplugin'
Plug 'xolox/vim-misc'
call plug#end()

" ------------- Plugin auxiliary stuff ------------------

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

map <leader>b :CtrlPBuffer<CR>
map <leader>m :CtrlPMRU<CR>
map <leader>5 :CtrlPClearCache<CR>            " Same as pressing f5 in ctrlp
let g:ctrlp_dotfiles = 0 " Don't scan for dotfiles and dotdirs
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20'
let g:ag_prg="/usr/local/bin/ag --vimgrep"

" Tagbar
nnoremap <leader>q :TagbarToggle<CR>

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " bind \ (backward slash) to grep shortcut
  " command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
endif

let g:ctrlp_clear_cache_on_exit = 0

" Use a better fuzzy matcher for CtrlP
if executable('matcher')
    let g:ctrlp_match_func = { 'match': 'GoodMatch' }
    function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)
      " Create a cache file if not yet exists
      let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
      if !( filereadable(cachefile) && a:items == readfile(cachefile) )
        call writefile(a:items, cachefile)
      endif
      if !filereadable(cachefile)
        return []
      endif
      " a:mmode is currently ignored. In the future, we should probably do
      " something about that. the matcher behaves like "full-line".
      let cmd = 'matcher --limit '.a:limit.' --manifest '.cachefile.' '
      if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
        let cmd = cmd.'--no-dotfiles '
      endif
      let cmd = cmd.a:str
      return split(system(cmd), "\n")
    endfunction
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Fugitive aliases
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :silent! Glog -5<CR>:bot copen<CR>
nnoremap <leader>gb :Git branch<leader>
nnoremap <leader>go :Git checkout<leader>
nnoremap <leader>gcc :Gcommit<CR>

" Lua 
let g:lua_compiler_name = '/usr/local/bin/luac'
" let g:lua_complete_omni = 1

" Ultisnip settings
let g:UltiSnipsSnippetDirectories=["UltiSnips", "CustomSnippets"] " have to be in the runtimepath

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" CtrlP-Funky
nnoremap <leader>l :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <leader>lU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" matched chars highlight
let g:ctrlp_funky_use_cache = 1
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1

" Vim-Commentary mapping
nnoremap <C-_> :Commentary<Cr>
vnoremap <C-_> :Commentary<Cr>

" Ag.vim
nnoremap S :Ag<CR>
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" NeoComplete
if !has('nvim')
  let g:acp_enableAtStartup = 0             " Disable AutoComplPop.
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
          \ }

  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'
endif

" Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplete#close_popup()
" inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Set Netrw to behave like NERDTree
" Toggle Vexplore with Ctrl-E
com!  -nargs=* -bar -bang -complete=dir  Lexplore  call netrw#Lexplore(<q-args>, <bang>0)
fun! Lexplore(dir, right)
  if exists("t:netrw_lexbufnr")
  " close down netrw explorer window
  let lexwinnr = bufwinnr(t:netrw_lexbufnr)
  if lexwinnr != -1
    let curwin = winnr()
    exe lexwinnr."wincmd w"
    close
    exe curwin."wincmd w"
  endif
  unlet t:netrw_lexbufnr

  else
    " open netrw explorer window in the dir of current file
    " (even on remote files)
    let path = substitute(exists("b:netrw_curdir")? b:netrw_curdir : expand("%:p"), '^\(.*[/\\]\)[^/\\]*$','\1','e')
    exe (a:right? "botright" : "topleft")." vertical ".((g:netrw_winsize > 0)? (g:netrw_winsize*winwidth(0))/100 : -g:netrw_winsize) . " new"
    if a:dir != ""
      exe "Explore ".a:dir
    else
      exe "Explore ".path
    endif
    setlocal winfixwidth
    let t:netrw_lexbufnr = bufnr("%")
  endif
endfun

map <silent> <C-N> :Lexplore<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1
" absolute width of netrw window
let g:netrw_winsize = -28
" do not display info on the top of window
let g:netrw_banner = 0
" tree-view
let g:netrw_liststyle = 3

" Vim-Javascript Config
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"

" Emmet expand shortcut key

" Python-Mode
" let g:pymode_rope_goto_definition_bind = "<C-]>"
" let g:pymode_run_bind = "<C-leader-e>"
" let g:pymode_doc_bind = "<C-leader-d>"
" let g:pymode_folding = 0
" let g:pymode_lint = 0
" let g:pymode_lint_on_write = 0

" Syntastic

" let g:syntastic_html_checkers = []
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers = ['flake8']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

