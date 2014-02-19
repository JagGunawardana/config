" Jag's .vimrc
" Used for developing in python, C++, bash, and make files
" Used snippits from vimbits, and Martin Brochhaus' pycon talk
" vim as a Python IDE see: https://github.com/mbrochh/vim-as-a-python-ide.git

" Automatic reloading of .vimrc (when editing)
autocmd! bufwritepost .vimrc source %

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

" Allow the mouse to play 
set mouse=a  " on OSX press ALT and click


" Rebind <Leader> key
let mapleader = ";"

" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks in visual mode - without this
" you lose the highlight when you want to indent multiple times
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Smart indenting
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class


" Show trailing whitespace (must be before colour scheme)
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" au InsertLeave * match ExtraWhitespace /\s\+$/

" Conque
let g:ConqueTerm_FastMode = 0
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_ExecFileKey = '<F6>'
map <Leader>e <F9>
map <Leader>ef <F6>


" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Color scheme !!!
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
" color wombat256mod
" color distinguished
" color github
" color jellybeans
" color vividchalk
set nocompatible
set t_Co=256
"color pychimp
"color blackboard
" color candy

" Setup Pathogen to manage your plugins !!!
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()

" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on
" let python_highlight_all = 1


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
" set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap

" History/undo length
set history=700
set undolevels=700


" Use spaces not TABs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
" Set indent to 4 spaces with no tabs and wrapping at 78 columns
" set tw=78 ts=4 sw=4 sta et sts=4 ai
" Make needs TABs
autocmd FileType make  set noexpandtab 

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" ============================================================================
" Specific Python IDE Setup
" ============================================================================

" Settings for vim-powerline !!!
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2
set encoding=utf-8
let g:Powerline_symbols = 'compatible'

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#related_names_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
  if pumvisible()
    if a:action == 'j'
      return "\<C-N>"
    elseif a:action == 'k'
      return "\<C-P>"
    endif
  endif
  return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Static analysis
autocmd BufWritePost *.py call Flake8()

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable



" Smart indenting
" set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Auto completion via ctrl-space (instead of the nasty ctrl-x ctrl-o)
" set omnifunc=pythoncomplete#Complete
" inoremap <Nul> <C-x><C-o>

" Wrap at 72 chars for comments.
" set formatoptions=cq textwidth=72 foldignore= wildignore+=*.py[co]

" Highlight end of line whitespace.
" highlight WhitespaceEOL ctermbg=red guibg=red
" match WhitespaceEOL /\s\+$/

"statusline setup
" set statusline=%f%c[%l/%L]%P
" set rulerformat=%f%c[%l/%L]%P
" set laststatus=2
