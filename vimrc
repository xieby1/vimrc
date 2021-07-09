set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'

Plugin 'psliwka/vim-smoothie'

Plugin 'inkarkat/vim-mark'
Plugin 'inkarkat/vim-ingo-library'

Plugin 'dense-analysis/ale'

Plugin 'ycm-core/YouCompleteMe'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ==============================================

" vim
"" Highlight searches
set hlsearch
nnoremap <F3> :nohlsearch<CR>
""" clear highlight created by vim-mark
nnoremap <leader><F3> :MarkClear<CR>
"" Show line number
set number
"" indent
"set smartindent " not good, indentation in empty line cannot be auto removed
""" show existing tab with 4 spaces width
set tabstop=4
""" when indenting with '>', use 4 spaces width
set shiftwidth=4
""" On pressing tab, insert 4 spaces
set expandtab
"" tags support, ';' means upward search, refering to http://vimdoc.sourceforge.net/htmldoc/editing.html#file-searching
set tags=./tags;
"" Fold
set foldmethod=syntax
""" Set the foldlevel to a high setting,
""" files are always loaded with opened folds.
set foldlevel=20
""" mouse support " select by pressing shift key!
set mouse=a
""" matchit.vim " :h matchit-install
packadd! matchit
"" Preview
nnoremap <leader>[ :pc<CR>
"" highlight unwanted whitespace
set list
set listchars=tab:>-,trail:-

" ALE
nnoremap <F12> :ALEGoToDefinition<CR>
nnoremap <S-F12> :ALEFindReferences<CR>
nnoremap <leader>] :ALEHover<CR>
nnoremap <leader>f :ALEFix<CR>
"let g:ale_completion_enabled = 1
"" Assign Fixers
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \}
"" add linter to ALE echo msg
let g:ale_echo_msg_format = '[%linter%]: %code: %%s'

" gitgutter
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 1
nnoremap <Leader>g :GitGutterLineHighlightsToggle<CR>:GitGutterSignsToggle<CR>

augroup filetype
    " detect LLVM IR file
    au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END
