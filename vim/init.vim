syntax on
filetype on
filetype plugin on
filetype indent on

set encoding=utf-8
set fileencoding=utf-8
set guifont=Source\ Code\ Pro:h11:cANSI

" map leader prefix
let mapleader=","
set cursorline
set cursorcolumn
set hlsearch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set copyindent
set ignorecase
set smartcase
set nowrap
set noswapfile
set backupdir=D:\stdout\temp
set backspace=indent,eol,start
" vsp the window
nnoremap <silent> <Leader>v :vsplit<CR>

" copy to system paste board
vnoremap <Leader>y "+y
" from system paster board to vim
nmap <Leader>p "+p
" close current window
nmap <Leader>q :q<CR>
" save current window
nmap <Leader>w :w<CR>
" right window
nnoremap <C-l> <C-W>l
" left window
nnoremap <C-h> <C-W>h
" above window
nnoremap <C-k> <C-W>k
" downside window
nnoremap <C-j> <C-W>j

let g:python3_host_prog = 'c:\python3\python.exe'
call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-rooter' "Get to the project root
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'luochen1990/rainbow'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'nfvs/vim-perforce'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ap/vim-buftabline'
Plug 'kamykn/popup-menu.nvim'
Plug 'kamykn/spelunker.vim'
Plug 'Yggdroot/LeaderF'
Plug 'simeji/winresizer'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'Shougo/deoplete-clangx'
call plug#end()

" tab switch
nnoremap <leader>n :bnext<cr>
nnoremap <leader>N :bprev<cr>

" for lightline
set laststatus=2
" Add full file path to your existing statusline
set statusline+=%F

" Use deoplete.
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete', v:false)
call deoplete#custom#option('manual_complete', v:true)
" map ctrl n to deoplete complete instead of vim's
inoremap <expr> <C-n>  deoplete#manual_complete()

" LeaderF
let g:Lf_WildIgnore = {
        \ 'dir': ['.history','.git','.vscode','digest','staged','external','compiler'],
        \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.vcxproj','*.cov','*.xml','*.properties', '*.o','*.so','*.py[co]']
        \}

let g:Lf_RgConfig = [
        \ "--max-columns=150",
        \ "--glob=!external/*",
        \ "--glob=!compiler/*",
        \ "--glob=!.history/*"
    \ ]

let g:Lf_NormalMap = {
    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']]
    \ }

let g:Lf_WorkingDirectory = finddir('.git', 'cm')

" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1

" popup mode
let g:Lf_ShowDevIcons = 0
"let g:Lf_WindowPosition = 'popup'
let g:Lf_WindowPosition = 'bottom'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "Source Code Pro" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
let g:Lf_ShortcutF = '<C-P>'
noremap <C-B> :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>ff :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <leader>g :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e  %s ", expand("<cword>"))<CR>

" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e  %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" vim-rooter
let g:rooter_patterns = ['cm/', '.git/', 'external/', 'source/']

" Disable highlight with esc
nnoremap <esc> :noh<return><esc>
set list
set number
set relativenumber

" add characters for punctuation, use `:set list` to toggle
set listchars=tab:→\ ,trail:•,extends:⟩,precedes:⟨

" rainbow always on
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" theme
syntax enable
set background=dark
colorscheme onedark

" no flash
set gcr=a:block-blinkon0

" easy motion
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" switch buffer
nnoremap <Leader>b :ls<CR>:b<Space>

" Nerdtree
nmap <Leader>fl :NERDTreeToggle<CR>
" NERDTree window width
let NERDTreeWinSize=60

let NERDTreeWinPos="left"
" show hidden
let NERDTreeShowHidden=1
" NERDTree
let NERDTreeMinimalUI=1
" delete file with buffer
let NERDTreeAutoDeleteBuffer=1

" P4 plugin
" Set the P4Client os var before launching nvim
let g:perforce_open_on_save=1
let g:perforce_auto_source_dirs = ['D:\\perforce\\workspace']

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}

" indent-guide
let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_start_level=2
"let g:indent_guides_guide_size=1
"set ts=4 sw=4 noet

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" remove the trailing whitespace
autocmd FileType c,cpp,h,hpp,py,sh autocmd BufWritePre <buffer> %s/\s\+$//e

" gutentags
let g:gutentags_project_root = ['.p4config', 'cm', 'dev', 'external']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_exclude = ["staged", "intermediate_files", "external", "cm", ".history", ".vscode"]
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" ctags
" generate tags
nnoremap <silent> <Leader>T :!ctags -R --fields=+iaS --extra=+q --exclude='.git' --exclude='staged' --exclude='intermediate_files' --exclude='external' .<CR>
" find tags
set tags=./tags;/
" Map the ctrl }
nnoremap <leader>a <C-]>
nnoremap <leader>t <C-t>

" spelunker
set nospell
let g:enable_spelunker_vim = 1
let g:spelunker_target_min_char_len = 4
let g:spelunker_max_suggest_words = 15
let g:spelunker_max_hi_words_each_buf = 100
let g:spelunker_disable_uri_checking = 1
" Override highlight setting.
highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE

" Quickly open/reload vim
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
