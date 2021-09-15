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

Plugin 'tpope/vim-fugitive'

Plugin 'rhysd/git-messenger.vim'

" comment autoload/DrawIt.vim line 378: ... <Leader>f ...
Plugin 'vim-scripts/DrawIt'
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
"" syntax
syntax on
"" backspace
set backspace=indent,eol,start
"" line wrap
""" https://stackoverflow.com/questions/248102/is-there-any-command-to-toggle-enable-auto-text-wrapping
:function ToggleWrap()
: if (&wrap == 1)
:   set nowrap
: else
:   set wrap
: endif
:endfunction
nnoremap <F9> :call ToggleWrap()<CR>

" vim-mark
"" clear highlight created by vim-mark
nnoremap <leader><F3> :MarkClear<CR>
"" show all marks
nnoremap <leader>M :Marks<CR>

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

" cscope
" inspired by https://linux-kernel-labs.github.io/refs/heads/master/labs/introduction.html
if has("cscope")
        " Look for a 'cscope.out' file starting from the current directory,
        " going up to the root directory.
        let s:dirs = split(getcwd(), "/")
        while s:dirs != []
                let s:path = "/" . join(s:dirs, "/")
                if (filereadable(s:path . "/cscope.out"))
                        execute "cs add " . s:path . "/cscope.out " . s:path . " -v"
                        break
                endif
                let s:dirs = s:dirs[:-2]
        endwhile

        set csto=0  " Use cscope first, then ctags
        set cst     " Only search cscope
        set csverb  " Make cs verbose

        " 0 symbol
        nmap <C-\>s :cs find s <C-R><C-W><CR>
        nmap <C-\>S :cs find s<Space>
        " 1 definition
        nmap <C-\>g :cs find g <C-R><C-W><CR>
        nmap <C-\>G :cs find g<Space>
        " 2 called func
        nmap <C-\>d :cs find d <C-R><C-W><CR>
        nmap <C-\>D :cs find d<Space>
        " 3 calling func
        nmap <C-\>c :cs find c <C-R><C-W><CR>
        nmap <C-\>C :cs find c<Space>
        " 4 text string
        nmap <C-\>t :cs find t <C-R><C-W><CR>
        nmap <C-\>T :cs find t<Space>
        " 6 egrep pattern
        nmap <C-\>e :cs find e <C-R><C-W><CR>
        nmap <C-\>E :cs find e<Space>
        " 7 file
        nmap <C-\>F :cs find f<Space>
        " 8 including file
        nmap <C-\>i :cs find i ^<C-R><C-F>$<CR>
        nmap <C-\>I :cs find i<Space>
        " 9 assign
        nmap <C-\>a :cs find a <C-R><C-W><CR>
        nmap <C-\>A :cs find a<Space>

        " Open a quickfix window for the following queries.
        "set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
        "nmap <F6> :cnext <CR>
        "nmap <F5> :cprev <CR>
endif

" git-messenger
"" popup window no close automatically
let g:git_messenger_close_on_cursor_moved=v:false
