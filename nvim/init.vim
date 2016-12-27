" Jeff Widman
" jeff@jeffwidman.com

" #TODO start with everything commented out, then slowly add stuff and work with it to see it

" ------------
" Index:
" ------------

" Vundle install script # TODO Look into swapping to Vim Plug
" Plugins
" Vundle finish script
" My plugin settings
" My standard vim settings

" ------------
" Vundle stuff
" ------------

" Auto install Vundle
" http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
" Further tweaks from: https://github.com/timss/vimconf/blob/master/.vimrc

"        let has_vundle=1

"            if !filereadable($HOME."/.vim/bundle/Vundle.vim/README.md")
""            echo "Installing Vundle..."
""            echo ""
""            silent !mkdir -p $HOME/.vim/bundle
""            silent !git clone https://github.com/gmarik/Vundle.vim $HOME/.vim/bundle/Vundle.vim
""            let has_vundle=0
""        endif

    " Initialize Vundle

        " required by Vundle for Vim <7.3.430
        " https://github.com/gmarik/Vundle.vim/issues/176
""        filetype off

""        set rtp+=$HOME/.vim/bundle/Vundle.vim       " include vundle
""        call vundle#begin()                         " init vundle

""    Plugin 'gmarik/vundle'

    "-----------------------
    " Add your plugins here
    "-----------------------

""    Plugin 'justinmk/vim-sneak'

""    Plugin 'chriskempson/base16-vim'                " A bunch of themes... solarized, monokai, etc
""    Plugin 'SirVer/ultisnips'
""    Plugin 'honza/vim-snippets'                     " Snippet library
""    Plugin 'kien/ctrlp.vim'                         " Fuzzy finder (files, mru, etc)
""    Plugin 'JazzCore/ctrlp-cmatcher'                " Make ctrlp faster, see http://blog.patspam.com/2014/super-fast-ctrlp
""    Plugin 'Valloric/YouCompleteMe'
""    Plugin 'scrooloose/syntastic'                   " Awesome syntax checker. See :h syntastic-intro
""    " #TODO Need to add syntax checkers for syntastic like flak8, pyflakes, pylint, python etc
""    Plugin 'scrooloose/nerdtree'
""    Plugin 'sjl/gundo.vim'
""    Plugin 'vim-scripts/TaskList.vim/'              " Turns all your scattered TODO statements into tasklist
""    Plugin 'techlivezheng/vim-plugin-minibufexpl'
""    Plugin 'tpope/vim-fugitive'
""    Plugin 'tpope/vim-git'
""    Plugin 'godlygeek/tabular'                      " Required by vim-markdown, must come before it
""    Plugin 'plasticboy/vim-markdown'

" Finish Vundle stuff
""    call vundle#end()

    " Installing plugins the first time, quits when done
""        if has_vundle == 0
""            :silent! PluginInstall
""            :qa
""        endif

"--------------
" Plugin config
"--------------

""UltiSnips""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
"if executable('ag')
  " Use Ag over Grep
""  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " from http://blog.patspam.com/2014/super-fast-ctrlp
  " and http://robots.thoughtbot.com/faster-grepping-in-vim
""  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
""        \ --ignore .git
""        \ --ignore .svn
""        \ --ignore .hg
""        \ --ignore .DS_Store
""        \ --ignore "**/*.pyc"
""        \ -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
""  let g:ctrlp_use_caching = 0

"endif

" Use the faster matcher from CtrlP-cmatcher in CtrlP
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }


"--------------
" Local config
"--------------
" Helpful: http://dougblack.io/words/a-good-vimrc.html

""Appearance""
syntax on
set number                     " Visible line numbering
set cursorline                 " highlight current line
" set wildmenu                   " visual autocomplete for command menu #TODO check if conflicts with ctrlp keybinding
"set lazyredraw                 " redraw only when we need to.
set showmatch                  " when on a [{(, highlight the matching )}]
set hlsearch                   " highlight search matches
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅  "display tabs and trailing spaces
"set background=dark
"colorscheme base16-ocean

"mark the ideal max text width
if v:version >= 703
    set colorcolumn=+1
endif


set history=1000               " store lots of :cmdline history
set incsearch                  " search as characters are entered
set backspace=indent,eol,start " Make backspace behave in a sane manner.

"set foldenable                 " enable folding - toggle a fold with "za"
"set foldmethod=indent          " can also be set to 'syntax'
"set foldlevelstart=99          " open folds by default
"set foldnestmax=10             " 10 nested fold max

filetype on                    " Try to detect filetypes
filetype plugin indent on      " Enable file type detection and do language-dependent indenting.

set expandtab                  " Convert all TAB characters in the file to spaces

augroup configgroup            " an augroup ensures the autocmd's are only applied once
  autocmd FileType python setlocal shiftwidth=4 tabstop=4 textwidth=79
  autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
augroup END

"Remap jk/kj to escape while in insert mode:
inoremap jk <esc>
inoremap kj <esc>

"Enable mouse highlighting
if has('mouse') | set mouse=a | endif
