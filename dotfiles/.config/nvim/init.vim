" Install vim-plug if not found
"
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'preservim/nerdtree' " file browser
Plug 'tpope/vim-fugitive' " git commands
Plug 'dense-analysis/ale' " lint engine (syntax checker)
Plug 'ctrlpvim/ctrlp.vim' " full path fuzzy file, finder
Plug 'dyng/ctrlsf.vim' " search tool inside files. Requires ripgrep/ag/ack
Plug 'tpope/vim-endwise' " helps to end certain structures automatically, such as `end` after `if`
Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab
Plug 'vim-ruby/vim-ruby' " provides useful things for ruby such as easy navigation and syntax highlighting
Plug 'tpope/vim-rails' " improve navigation of Rails structure, enhances syntax highlighting, interface to `rails` command, etc.
" Plug 'slim-template/vim-slim' " slim syntax highlighting for vim. Slim is a ruby template language used for views
" Plug 'vim-scripts/cmdalias.vim' " allows creating fancy aliases to commands
Plug 'airblade/vim-gitgutter' " Shows git diff markers
Plug 'ludovicchabant/vim-gutentags' " automatically update ctags, with async support. Remember to first install Universal-ctags: brew install --HEAD universal-ctags/universal-ctags/universal-ctags. Also make sure you have a ~/.ctags.d/default.ctags config file that excludes unneeded directories (node_modules, etc)
Plug 'janko-m/vim-test' " VIM wrapper for running tests on different languages
Plug 'tpope/vim-dispatch' " async running of commands via tmux, etc
Plug 'ntpeters/vim-better-whitespace' " highlight trailing whitespaces

" Plug 'editorconfig/editorconfig-vim' " makes use of .editorconfig file to set up indent style, etc
" Plug 'rstacruz/sparkup' " parser for condensed HTML. Let you expand `#menu > ul` to `<div id='menu'><ul></ul></div>`
Plug 'tpope/vim-surround' " provides mappings to delete, change, add surroundings (parentheses, brackets, quotes, XML tags, etc) in pairs.
Plug 'tpope/vim-repeat' " enhances `.` repeat command in VIM enabling it for non-native commands (plugins)
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'othree/yajs.vim' " Yet Another JavaScript Syntax
" Plug 'maxmellon/vim-jsx-pretty' " React.js syntax highlighting and indenting
" Plug 'HerringtonDarkholme/yats.vim' " Syntax highlighting for TSX (JSX in Typescript). Requires 'maxmellon/vim-jsx-pretty'
Plug 'Yggdroot/indentLine' " display thin vertical lines at each indentation ---------- DISABLE IF JSON FILES GET QUOTES MESSED UP
" Plug 'prettier/vim-prettier' " a VIM plugin for prettier (JS formatter). Make sure to first `npm install -g prettier`

" if has('nvim')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " auto-completion. Requires python3 and doing `pip3 install --user pynvim` in terminal. Then might need to do `:UpdateRemotePlugins` in NVIM

" else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" endif
call plug#end()

" Change cursor shape between insert and normal mode in iTerm2.app
"
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
let g:molokai_original = 1
" let g:rehash256 = 1
set mouse=a " enable mouse support in all modes
set number
set backup
set backupdir=~/vimtmp//,.
set directory=~/vimtmp//,.
colorscheme molokai
set clipboard^=unnamed,unnamedplus " multiplatform
" set clipboard^=unnamed
let mapleader=","
set timeout timeoutlen=1500
set ignorecase
set smartcase
map <leader>h :set hls!<CR>
map <leader>rn :set number relativenumber!<CR>
map <leader>t :NERDTreeToggle<CR>
map <leader>s :set ignorecase! \| set smartcase<CR>
map <leader>w :w<CR>

map <leader>q :q<CR>
" ===== Custom Settings =======

"nnoremap <silent> <Leader>[ :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> <Leader>] :exe "resize " . (winheight(0) * 2/3)<CR>

" Plugins
" Plugin 'dense-analysis/ale' " lint engine (syntax checker)
" ale        ctrlp.vim  ctrlsf.vim endwise    nerdtree   supertab
" End Plugins
" ===== Seeing Is Believing =====
" " Assumes you have a Ruby with SiB available in the PATH
" " If it doesn't work, you may need to `gem install seeing_is_believing -v
" 3.0.0.beta.6`
" " ...yeah, current release is a beta, which won't auto-install
"
" " Annotate every line

"nmap <leader>b :%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk<CR>;
"
"
"  " Annotate marked lines
"
"nmap <leader>n :%.!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk --xmpfilter-style<CR>;
"
"  " Remove annotations
"
"nmap <leader>c :%.!seeing_is_believing --clean<CR>;
"
"  " Mark the current line for annotation
"
"nnoremap <leader>m A # => <Esc>
"
"  " Mark the highlighted lines for annotation
"
"vnoremap <leader>m :norm A # => <Esc>

" ctrlp.vim
"set runtimepath^=~/.config/nvim/bundle/ctrlp.vim
"
let NERDTreeShowLineNumbers=1
"Show hidden files in Nerdtree
let NERDTreeShowHidden=1
" Begin ripgrep (search in files)
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_auto_focus = { "at": "start" }
let g:ctrlsf_ignore_dir = ['bower_components', 'node_modules', 'public/ckeditor']
" End ripgrep

" Begin dense-analysis/ale
let g:ale_lint_on_text_changed = 1
let g:ale_lint_delay = 1000 " changes default 200ms so it doesn't kick off so frequently eating all my CPU and battery
let g:ale_lint_on_save = 1
let g:ale_set_loclist = 1 " location list
let g:airline#extensions#ale#enabled = 1 " show errors or warnings in my statusline
let g:ale_sign_column_always = 1 " keep the sign gutter open all times

let g:ale_linters = {
\ 'ruby': ['rubocop', 'ruby'],
\ 'javascript': ['eslint'],
\ 'vue': ['eslint']
\}

" let g:ale_linters = {'ruby': ['ruby']} # in case rubocop pegs the CPU, just do ruby syntax check
" End dense-analysis/ale

" Begin deoplete.
let g:deoplete#enable_at_startup = 1 " use deoplete
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" End deoplete

" let g:ctrlsf_debug_mode = 1

" Begin jank-m/vimtest
" runs vim-test via Dispatch and tmux, asynchronously
let test#strategy = "dispatch"
let g:dispatch_quickfix_height=12 " Don't open a half-size buffer output at the bottom, but something smaller
" enables :RSpec runner command, fixes issue with first test run.  Remember to use the expansion for the current file :RSpec %
let g:test#runner_commands = ['RSpec']
" RSpec.vim mappings
nmap <silent> <leader>rt :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let g:rspec_command = "Dispatch rspec {spec}" " async run using tmux and tpope/dispatch
" End jank-m/vimtest

" Begin vim-airline
" let g:airline_theme = 'solarized' " let's see if we can get used to default one
let g:airline#extensions#ale#enabled=1
" End vim-airline

" Begin ludovicchabant/vim-gutentags
let g:gutentags_cache_dir="~/.ctags.d/.ctags-cache-dir" " Don't pollute projects with tag files. Place them in certain directory instead
let g:gutentags_project_root = ['Gemfile'] " Generate tags files for other ruby projects that are not in source-control repositories
" End ludovicchabant/vim-gutentags

" Highlight tabs and hidden white characters:
set list
set list listchars=tab:▸‧,nbsp:␣

set statusline+=%{gutentags#statusline()}
