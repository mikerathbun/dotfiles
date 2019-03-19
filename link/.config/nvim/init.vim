" http://vim.wikia.com/wiki/Working_with_Unicode
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

"""""""""""""""""""""""""""""""""""""""""""""
"
"       Examples and definitions of maps
"       http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
"       ---------------------------------
"       To see a list of existing maps
"       :map displays the maps that work in normal, visual and select and operator pending mode
"       :map! maps that work in insert and command-line mode.
"       :nmap - Display normal mode maps
"       :imap - Display insert mode maps.
"       :vmap - Display visual and select mode maps.
"       :smap - Display select mode maps
"       :xmap - Display visual mode maps.
"
"       :nmap g - Display
"
"       :unmap <F8>
"       To disable a key map defined by a plugin, must be done after the
"       plugin defines it.
"       autocmd VimEnter * unmap! <F8>
"           or
"       autocmd FileType python unmap! <F8>
"
"
"       inoremap - Remap in insert mode
"
"
""""""""""""""""""""""""""""""""""""""""""""""




" Change mapleader
let g:mapleader=","
inoremap jk <ESC>
" Commented out becuase it messes up typing comma at the end of a line and
" pressing enter.
" imap <nl> <ESC>o
" inoremap  <ESC>o



" Local dirs
if !has('win32')
  set backupdir=$DOTFILES/caches/vim
  set directory=$DOTFILES/caches/vim
  set undodir=$DOTFILES/caches/vim
  let g:netrw_home = expand('$DOTFILES/caches/nvim')
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

" colorscheme settings
" Trying new colorschemes
:colorscheme molokai
" :colorscheme space-vim-dark
" :colorscheme 256-jungle
" set background=dark
" set the background to be a little more brown
" let g:molokai_original = 1
let g:rehash256 = 1



" Visual settings
set cursorline " Highlight current line
set number " Enable line numbers.
set showtabline=2 " Always show tab bar.
" set relativenumber " Use relative line numbers. Current line is still in status bar.
set title " Show the filename in the window titlebar.
set nowrap " Do not wrap lines.
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set laststatus=2 " Always show status line

" Show absolute numbers in insert mode, otherwise relative line numbers.
autocmd vimrc InsertEnter * :set norelativenumber
" autocmd vimrc InsertLeave * :set relativenumber

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
nnoremap <silent><leader><space> :nohlsearch<CR>
" When in the terminal, we want to pause it using <Esc>
tnoremap <Esc> <C-\><C-n>
" Ignore things
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/log/*,*/tmp/*
set wildignore+=*.DS_Store*
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
" nnoremap <leader>b :CtrlPBuffer<CR> " List other buffers
nnoremap <leader><leader> :b#<CR> " Switch between the last two files
nnoremap gb :bnext<CR> " Next buffer
nnoremap gB :bprev<CR> " Prev buffer

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

" Map the quickfix commands
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>


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


""""""""""""""""""""""""""""""
"
"       Python based commands I came across
"
""""""""""""""""""""""""""""""
if has('python')

  " Format JSON document
  nnoremap <Leader>j :%!python -m json.tool<CR>

endif


" This is the setup for vim-go
""""""""""""""""""""""""""""""
"
"
"       Vim-GO
"
""""""""""""""""""""""""""""""

set autowrite
syntax enable
filetype plugin on


"----------------------------------------------
" Language: Golang
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4


"----------------------------------------------
" Plugin: zchee/deoplete-go
"----------------------------------------------
" Enable completing of go pointers
let g:deoplete#sources#go#pointer = 1

au FileType go nmap <F8> :GoMetaLinter<cr>
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>rr <Plug>(go-run-split)
au FileType go nmap <leader>gd <Plug>(go-def)

au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go nmap <leader>ga <Plug>(go-alternate-edit)
au FileType go nmap <leader>gah <Plug>(go-alternate-split)
au FileType go nmap <leader>gav <Plug>(go-alternate-vertical)

au FileType go nmap <leader>gdv <Plug>(go-def-vertical)
au FileType go nmap <leader>gdh <Plug>(go-def-split)
au FileType go nmap <leader>gD <Plug>(go-doc)
au FileType go nmap <leader>gDv <Plug>(go-doc-vertical)

" Auto import of dependencies
let g:go_fmt_command = "goimports"

let g:go_snippet_engine = "neosnippet"

" Highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_auto_sameids = 0
let g:go_auto_type_info = 1

" Show the progress when running :GoCoverage
let g:go_echo_command_info = 1

let g:go_list_type = "quickfix"
let g:go_disable_autoinstall = 0

" Add the failing test name to the output of :GoTest
let g:go_test_prepend_name = 1

" Linting
" Error and warning signs
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" Enable integration with airline
let g:airline#extensions#ale#enabled = 1


" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" gometalinter configuration
let g:go_metalinter_command = ""
let g:go_metalinter_deadline = "5s"
let g:go_metalinter_enabled = [
    \ 'deadcode',
    \ 'errcheck',
    \ 'gas',
    \ 'goconst',
    \ 'gocyclo',
    \ 'golint',
    \ 'gosimple',
    \ 'ineffassign',
    \ 'vet',
    \ 'vetshadow'
\]

" Set whether the JSON tags should be snakecase or camelcase.
let g:go_addtags_transform = "snakecase"

" neomake configuration for Go.
let g:neomake_go_enabled_makers = [ 'go', 'gometalinter' ]
let g:neomake_go_gometalinter_maker = {
  \ 'args': [
  \   '--tests',
  \   '--enable-gc',
  \   '--concurrency=3',
  \   '--fast',
  \   '-D', 'aligncheck',
  \   '-D', 'dupl',
  \   '-D', 'gocyclo',
  \   '-D', 'gotype',
  \   '-E', 'errcheck',
  \   '-E', 'misspell',
  \   '-E', 'unused',
  \   '%:p:h',
  \ ],
  \ 'append_file': 0,
  \ 'errorformat':
  \   '%E%f:%l:%c:%trror: %m,' .
  \   '%W%f:%l:%c:%tarning: %m,' .
  \   '%E%f:%l::%trror: %m,' .
  \   '%W%f:%l::%tarning: %m'
  \ }



" vim
autocmd vimrc BufRead .vimrc,*.vim set keywordprg=:help

" markdown
autocmd vimrc BufRead,BufNewFile *.md set filetype=markdown

" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""
"
"     VimWiki
"
"""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [
                        \{'path': '$MYDBDEV/vimwiki/tech.wiki'},
                        \{'path': '$MYDBDEV/vimwiki/personal.wiki'},
                        \]



""""""""""""""""""""""""""""""""""""""""""""""""""


" Javascript using pangloss/vim-javascript
" syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1
" Enables syntax for Flow
let g:javascript_plugin_flow = 1

" py settings for iMac
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" python-provider settings for maybe vagrant_win10
" let g:python_host_prog = '/usr/bin/python'
" let g:python3_host_prog = '/usr/bin/python3.7'


" Python-mode (pymode)
let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 95
let g:pymode_options_colorcolumn = 1
let g:pymode_folding = 0

" Python-mode Rope settings
let g:pymode_rope = 0
" Extended autocompletion (rope could complete objects which have not been
" imported) from project
let g:pymode_rope_autoimport = 0

" Load modules to autoimport by default
" let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime']

" Offer to unresolved import object after completion.
" let g:pymode_rope_autoimport_import_after_complete = 0

" Tab setting for Python
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4


" Syntastic settings
"
" statusline options are taken care of by airline
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1 " in active mode run syntax checks when open and save
let g:syntastic_check_on_wq = 0 " skip check when quitting
let g:syntastic_aggregate_errors = 1
" set Syntastic linting options


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
" autocmd vimrc VimEnter *
"   \ if argc() == 0 && !exists("s:std_in") |
"   \   NERDTree |
"   \ elseif argc() == 1 && isdirectory(argv(0)) |
"   \   bd |
"   \   exec 'cd' fnameescape(argv(0)) |
"   \   NERDTree |
"   \ end

" Signify
let g:signify_vcs_list = ['git', 'hg', 'svn']

" CtrlP.vim
" map <leader>p <C-P>
" map <leader>r :CtrlPMRUFiles<CR>
"let g:ctrlp_match_window_bottom = 0 " Show at top of window

" Indent Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Mustache/handlebars
let g:mustache_abbreviations = 1

" VimCompletesMe
let b:vcm_tab_complete = ''
" deoplete settings
let g:deoplete#enable_at_startup = 0

if has('nvim')
  nnoremap <leader>d :call deoplete#toggle()<cr>
endif

" Fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gp :Gpull<CR>
nnoremap <leader>gP :Gpush<CR>
nnoremap <leader>gc :Gcommit -a<CR>

"""""""""""""""" Neosnippet config """""""""""""""""""""""
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
""""""""""""""" End Neosnippet """"""""""""""""""""""""""""""

" Vim-Indent-guides
" colorscheme bclear

set ts=1 sw=2 et
let g:indent_guides_start_level = 2

"
"
" https://github.com/junegunn/vim-plug
" Reload .vimrc and :PlugInstall to install plugins.
call plug#begin('~/.vim/plugged')
" Dependencies
Plug 'Shougo/neocomplcache'        " Depenency for Shougo/neosnippet
Plug 'godlygeek/tabular'           " This must come before plasticboy/vim-markdown
Plug 'tpope/vim-rhubarb'           " Depenency for tpope/fugitive

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'  " Default snippets for many languages
Plug 'bling/vim-airline'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-jdaddy'
Plug 'vphantom/vim-obsession'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mhinz/vim-signify'
Plug 'mattn/emmet-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'chase/vim-ansible-yaml'
Plug 'klen/python-mode', {'branch': 'develop'}
Plug 'mtth/scratch.vim'
Plug 'oranget/vim-csharp'
Plug 'ervandew/supertab'
" vim-go plugins and support
Plug 'fatih/vim-go'
Plug 'othree/xml.vim'
Plug 'ajh17/VimCompletesMe'
Plug 'zchee/deoplete-go', { 'do': 'make'}      " Go auto completion
Plug 'vimwiki/vimwiki'
" testing colorschemes
Plug 'flazz/vim-colorschemes'
call plug#end()
