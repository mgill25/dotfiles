:set nu



" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

filetype indent plugin on " Detect file type by format or content

filetype plugin on	" Provides Intelligent Auto-Indenting

syntax on 		" Enables Syntax Highlighting	

" set hidden 		" Hides Buffers, even when unsaved. Complaints if exit without saving.

" Hide the toobar and menubar
" set guioptions-=m
set guioptions-=T
" window for multiple buffers, and/or:
" set confirm
" set autowriteall

set wildmenu		" Better Command-Line completion

set showcmd		" Show partial commands in the last line of the screen

set hlsearch		" Highlight search.

set ignorecase 		" Ignore case when searching
set smartcase		" Ignore case when search pattern all lowercase. Case-sensitive otherwise.

"Indentation Settings. Taken from the Hitchhiker's guide to Python.
set scrolloff=3
set title
set ttyfast
"set tabstop=4
"set softtabstop=4
set expandtab 
set shiftround
set shiftwidth=4
autocmd FileType python set tabstop=4
autocmd FileType javascript set tabstop=2
autocmd FileType html set tabstop=2
autocmd FileType css set tabstop=2
autocmd FileType cpp set tabstop=8
autocmd FileType c set tabstop=4

set confirm		" Dialog asking if you want to save changed files.

"set visualbell		" Use visual bell instead of beeping when doing something wrong

set mouse=a 		" Enable use of the mouse for all modes

set pastetoggle=<F2>	" Temporarily disables auto indenting and other stuff. Use right before pasting large amount of code.
" This will stop vim from applying it's own indenting features on the paste.
let NERDTreeShowBookmarks=1 " Display the NERDTree Bookmarks table on vim startup

" Easy Hex editing mode
" nnoremap <C-H> :Hexmode<CR>
" inoremap <C-H> <Esc>:Hexmode<CR>
" vnoremap <C-H> :<C-U>Hexmode<CR>
 
" Colorscheme for the GVim 
if &t_Co >= 256 || has("gui_running")  " Terminal supports 256 colors?
	" set guifont=Droid\ Sans\ Mono\ 9
	set guifont=Monaco\ 10
        " colorscheme twilight
	" colorscheme molokai 
	" colorscheme Tomorrow-Night
	colorscheme github
	" colorscheme distinguished
	" colorscheme grb256
else
        " Temporary colorscheme for the gnome-terminal
        colorscheme grb256 
endif
" let g:molokai_original=1
" Pathogen Plugin manager info
" Pathogen plugin manager activation; https://github.com/tpope/vim-pathogen 
" Extract plugins to ~/.vim/bundle , and they'll be added to the 'runtimepath' automatically.
" Example - cd ~/.vim/bundle/; git clone git://github.com/tpope/vim-fugitive.git installs the fugitive.vim plugin

call pathogen#infect() 

" Currently installed plugins --------
" Pathogen (Obviously)
" autoload
" NERDTree
" tcomment
" matchit
" Fuzzy finder
" vim-powerline (needs weird fontpatcher stuff)
" CtrlP
" snipMate
" Tagbar
" Taglist; lets see how different it is from Tagbar
" zoom
" PyDiction; trying to use python tab-completion. 
"-------------- Some Custom Mappings ---------------------------------
let mapleader = ";" "Changing the default <leader> key from \ to ;

map <C-n> :NERDTreeToggle<CR>

"Disable the arrow keys: Doesn't seem to have any affect.
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

"Shortcut for opening Split-Windows
map <leader>o :split
map <leader>e :vsplit

"Quickly open new tabs
map <leader>t :tabnew<CR>
"Easy Split-Window navigation:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Clearing the search buffer by pressing ,/ (Note - NOT the leader key)
nmap <silent> ,/ :nohlsearch<CR>

" Reopen a file in sudo-mode by pressing w!!
cmap w!! w !sudo tee % >/dev/null

" Settings for vim-powerline
let g:Powerline_symbols = 'fancy'
set t_Co=256              " Explicitly tell vim that the terminal supports 256 colors.
set laststatus=2		" Always show the status line
set encoding=utf-8

" Ignore certain files while exploring.
set wildignore+=*.swp,*.zip

map <leader>b :CtrlPBuffer<CR>

" Fuzzy Finder mappings
map <leader>ff :FufFile<CR>
map <leader>fb :FufBuffer<CR>
map <leader>fd :FufDir<CR>

" Tagbar mappings
" g:tagbar_ctags_bin
nmap <leader>q :TagbarToggle<CR>
" Taglist mappings. 
nmap <leader>w :TlistToggle<CR>

" Clipboard settings
"copy to the clipboardd
vmap <leader>y :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!xclip -selection c<CR>u 

"paste from the clipboard
map <leader>p :set paste<CR>i<CR><CR><Esc>k:.!xclip -o<CR>JxkJx:set nopaste<CR>

" PyDiction settings
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
let g:pydiction_menu_height = 15

" Tabs shortcuts
map <leader>j :tabnext<CR>
map <leader>k :tabprevious<CR>

" Execute currently open script
map <leader>e :!%:p<CR>
" and for when command line args are needed!
map <leader>r :!%:p           

"Generate python ctags
map <F11> :!ctags -R -f ./tags `python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"`<CR>

" Racket file settings
if has("autocmd")
    au BufReadPost *.rkt,*.rktl set filetype=scheme
endif
