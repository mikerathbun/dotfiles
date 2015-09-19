" Sept 6th
" Change mapleader
let g:mapleader=","
inoremap jk <ESC>

" Local dirs
if !has('win32')
  set backupdir=$DOTFILES/caches/vim
  set directory=$DOTFILES/caches/vim
  set undodir=$DOTFILES/caches/vim
  let g:netrw_home = expand('$DOTFILES/caches/vim')
endif

" Create vimrc autocmd group and remove any existing vimrc autocmds,
" in case .vimrc is re-sourced.
augroup vimrc
  autocmd!
augroup END

" Theme / Syntax highlighting

" Make invisible chars less visible in terminal.
autocmd vimrc ColorScheme * :hi NonText ctermfg=236
autocmd vimrc ColorScheme * :hi SpecialKey ctermfg=236
" Show trailing whitespace.
autocmd vimrc ColorScheme * :hi ExtraWhitespace ctermbg=red guibg=red
" Make selection more visible.
autocmd vimrc ColorScheme * :hi Visual guibg=#00588A
autocmd vimrc ColorScheme * :hi link multiple_cursors_cursor Search
autocmd vimrc ColorScheme * :hi link multiple_cursors_visual Visual

let g:molokai_italic=0
colorscheme molokai
set background=dark

" Visual settings
set cursorline " Highlight current line
set number " Enable line numbers.
set showtabline=2 " Always show tab bar.
set relativenumber " Use relative line numbers. Current line is still in status bar.
set title " Show the filename in the window titlebar.
set nowrap " Do not wrap lines.
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set laststatus=2 " Always show status line

" Show absolute numbers in insert mode, otherwise relative line numbers.
autocmd vimrc InsertEnter * :set norelativenumber
autocmd vimrc InsertLeave * :set relativenumber

" Make it obvious where 80 characters is
" set textwidth=80
" set colorcolumn=+1

" Scrolling
set scrolloff=3 " Start scrolling three lines before horizontal border of window.
set sidescrolloff=3 " Start scrolling three columns before vertical border of window.

" Indentation
set autoindent " Copy indent from last line when starting new line.
set shiftwidth=2 " The # of spaces for indenting.
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set softtabstop=2 " Tab key results in 2 spaces
set tabstop=2 " Tabs indent only 2 spaces
set expandtab " Expand tabs to spaces

" Reformatting
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command.

" Help
" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" Toggle show tabs and trailing spaces (,c)
if has('win32')
  set listchars=tab:>\ ,trail:.,eol:$,nbsp:_,extends:>,precedes:<
else
  set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:>,precedes:<
endif
"set listchars=tab:>\ ,trail:.,eol:$,nbsp:_,extends:>,precedes:<
"set fillchars=fold:-
nnoremap <silent> <leader>v :call ToggleInvisibles()<CR>

" Extra whitespace
autocmd vimrc BufWinEnter * :2match ExtraWhitespaceMatch /\s\+$/
autocmd vimrc InsertEnter * :2match ExtraWhitespaceMatch /\s\+\%#\@<!$/
autocmd vimrc InsertLeave * :2match ExtraWhitespaceMatch /\s\+$/

" Toggle Invisibles / Show extra whitespace
function! ToggleInvisibles()
  set nolist!
  if &list
    hi! link ExtraWhitespaceMatch ExtraWhitespace
  else
    hi! link ExtraWhitespaceMatch NONE
  endif
endfunction

set nolist
call ToggleInvisibles()

" Trim extra whitespace
function! StripExtraWhiteSpace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction
noremap <leader>ss :call StripExtraWhiteSpace()<CR>

" Search / replace
set gdefault " By default add g flag to search/replace. Add g to toggle.
set hlsearch " Highlight searches
set incsearch " Highlight dynamically as pattern is typed.
set ignorecase " Ignore case of searches.
set smartcase " Ignore 'ignorecase' if search pattern contains uppercase characters.

" Clear last search TODO: Find a replacement
"nnoremap <silent><leader><space> :nohlsearch<CR>

" Ignore things
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/log/*,*/tmp/*

" Vim commands
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set report=0 " Show all changes.
set mouse=a " Enable mouse in all modes.
set shortmess+=I " Hide intro menu.

" Splits
set splitbelow " New split goes below
set splitright " New split goes right

" Ctrl-J/K/L/H select split
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Buffer navigation
nnoremap <leader>b :CtrlPBuffer<CR> " List other buffers
map <leader><leader> :b#<CR> " Switch between the last two files
map gb :bnext<CR> " Next buffer
map gB :bprev<CR> " Prev buffer

" Jump to buffer number 1-9 with ,<N> or 1-99 with <N>gb
let c = 1
while c <= 99
  if c < 10
    execute "nnoremap <silent> <leader>" . c . " :" . c . "b<CR>"
  endif
  execute "nnoremap <silent> " . c . "gb :" . c . "b<CR>"
  let c += 1
endwhile

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

" Use Q for formatting the current paragraph (or selection)
" vmap Q gq
" nmap Q gqap

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" When editing a file, always jump to the last known cursor position. Don't do
" it for commit messages, when the position is invalid, or when inside an event
" handler (happens when dropping a file on gvim).
autocmd vimrc BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" F12: Source .vimrc & .gvimrc files
nmap <F12> :call SourceConfigs()<CR>

if !exists("*SourceConfigs")
  function! SourceConfigs()
    let files = ".vimrc"
    source $MYVIMRC
    if has("gui_running")
      let files .= ", .gvimrc"
      source $MYGVIMRC
    endif
    echom "Sourced " . files
  endfunction
endif

"" FILE TYPES

" vim
autocmd vimrc BufRead .vimrc,*.vim set keywordprg=:help

" markdown
autocmd vimrc BufRead,BufNewFile *.md set filetype=markdown


" PLUGINS

" Airline
let g:airline_powerline_fonts = 1 " TODO: detect this?
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#fnamecollapse = 0
"let g:airline#extensions#tabline#fnamemod = ':t'

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeMouseMode = 2
let NERDTreeMinimalUI = 1
map <leader>n :NERDTreeToggle<CR>
autocmd vimrc StdinReadPre * let s:std_in=1
" If no file or directory arguments are specified, open NERDtree.
" If a directory is specified as the only argument, open it in NERDTree.
autocmd vimrc VimEnter *
  \ if argc() == 0 && !exists("s:std_in") |
  \   NERDTree |
  \ elseif argc() == 1 && isdirectory(argv(0)) |
  \   bd |
  \   exec 'cd' fnameescape(argv(0)) |
  \   NERDTree |
  \ end

" Signify
let g:signify_vcs_list = ['git', 'hg', 'svn']

" CtrlP.vim
map <leader>p <C-P>
map <leader>r :CtrlPMRUFiles<CR>
"let g:ctrlp_match_window_bottom = 0 " Show at top of window

" Indent Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Mustache/handlebars
let g:mustache_abbreviations = 1

" Fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gp :Git push<CR>

" OmniSharp
" OmniSharp won't work without this setting
filetype plugin on

" Set the typ lookup function to use the preview window instead of the
" statusline
"let g:OmniSharp_typeLookupInPreview = 1
" Timeout in seconds to wait for a response from the server
" let g:OmniSharp_timeout = 1

"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
"set noshowmatch

"Super tab settings - uncomment the next 4 lines
"let g:SuperTabDefaultCompletionType = 'context'
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
"let g:SuperTabClosePreviewOnPopupClose = 1

"don't autoselect first item in omnicomplete, show if only one item (for
"preview)
"remove preview if you don't want to see any documentation whatsoever.
" set completeopt=longest,menuone,preview
" Fetch full documentation during omnicomplete requests.
" There is a performance penalty with this (especially on Mono)
" By default, only Type/Method signatures are fetched. Full documentation
" can still be fetched when
" you need it with the :OmniSharpDocumentation command.
" let g:omnicomplete_fetch_documentation=1

" Get Code Issues and syntax errors
" let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
" If you are using the omnisharp-roslyn backend, use the following
" let g:syntastic_cs_checkers = ['code_checker']


" Not going to use omnisharp anymore but still want to keep it in here for a
" while

" augroup omnisharp_commands
"   autocmd!

"   "Set autocomplete function to OmniSharp (if not using YouCompleteMe
"   /"Completion plugin"
"   autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
"   " Synchronous build (blocks Vim)
"   "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
"   " Builds can also run asynchronously with vim-dispatch installed
"   autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
"   " automatic syntax check on events (TextChanged requires Vim 7.4)
"   autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
  
"   " Automatically add new cs files to the nearest project on save
"   autocmd BufWritePost *.cs call OmniSharp#AddToProject()
  
"   "show type information automatically when the cursor stops moving
"   autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
  
"   "The following commands are contextual, based on the current cursor position.

"   autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
"   autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
"   autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
"   autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
"   autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
"   "finds members in the current buffer
"   autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
"   " cursor can be anywhere on the line containing an issue
"   autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
"   autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
"   autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
"   autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
"   "navigate up by method/property/field
"   autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
"   "navigate down by method/property/field
"   autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>  

" augroup END

" " this setting controls how long to wait (in ms) before fetching type / symbol information.
" set updatetime=500
" " Remove 'Press Enter to continue' message when type information is longer than one line.
" set cmdheight=2
" " Contextual code actions (requires CtrlP or unite.vim)
" nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" " Run code actions with text selected in visual mode to extract method
" vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

" " rename with dialog
" nnoremap <leader>nm :OmniSharpRename<cr>
" nnoremap <F2> :OmniSharpRename<cr>
" " rename without dialog - with cursor on the symbol to rename... ':Rename newname'
" command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" " Force OmniSharp to reload the solution. Useful when switching branches etc.
" nnoremap <leader>rl :OmniSharpReloadSolution<cr>
" nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" " Load the current .cs file to the nearest project
" nnoremap <leader>tp :OmniSharpAddToProject<cr>

" " (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
" nnoremap <leader>ss :OmniSharpStartServer<cr>
" nnoremap <leader>sp :OmniSharpStopServer<cr>

" " Add syntax highlighting for types and interfaces
" nnoremap <leader>th :OmniSharpHighlightTypes<cr>
" "Don't ask to save when changing buffers (i.e. when jumping to a type definition)
" set hidden


"""""""" Finish out the git fugitive settings


" https://github.com/junegunn/vim-plug
" Reload .vimrc and :PlugInstall to install plugins.
call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'mhinz/vim-signify'
Plug 'mattn/emmet-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'chase/vim-ansible-yaml'
Plug 'wavded/vim-stylus'
Plug 'klen/python-mode', {'for': 'python'}
Plug 'terryma/vim-multiple-cursors'
Plug 'wting/rust.vim', {'for': 'rust'}
Plug 'mtth/scratch.vim'
" Plug 'omnisharp/omnisharp-vim'
Plug 'oranget/vim-csharp'
" Plug 'valloric/youcompleteme'
call plug#end()
