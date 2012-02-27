" 2012-02-27, Created by Hagen Fuchs <code@hfuchs.net>
"
" PURPOSE.
" This vimrc is suitable for hacking on Vim plugins in isolation without
" changing your precious ~/.vimrc.   It uses Vundle and Vim's '-u'
" commandline option.
"
" USAGE.
" Say
"
"       git clone https://github.com/gmarik/vundle.git dot_vim/bundle/vundle
"
" in your project dir and - while hacking - use only this vimrc by
" saying:
"
"       vim -u dev.vimrc [file_to_hack_on]
"
" TODO Say how marvellous vundle's Github intregration really is,
" because you can directly hack on your fork(s) of most (all?) Vim
" plugins.


" --- Debugging'n'Profiling
" ----------------------------------------------------------------------
"set verbose=10
"set verbosefile=vim_debug
set history=1000

" Unless either 'func' or 'file' are specified, the profile will be empty.
profile start profile1
"profile func *NewHMD*
" Profile functions defined in the script ('!'), not just the load time.
"profile! file /home/fox/data/projects/hacking_vimoutliner/dot_vim/bundle/vimoutliner/vimoutliner/plugin/vo_checkbox.vim
profile! file /home/fox/data/projects/hacking_vimoutliner/dot_vim/bundle/vimoutliner/ftplugin/vo_base.vim


" --- Vundle & General Settings
" ----------------------------------------------------------------------
set nocompatible
filetype off

" 'bit of dynamism here - this is not documented in Vundle's README.
let bundle_path=expand("%:p:h") . "/dot_vim/bundle"
let vundle_path=bundle_path     . "/vundle"

" This contrived statement to add our custom Vundle path to the
" runtimepath is necessary because set statements don't take variables
" on the RHS.
execute "set rtp=".vundle_path
set runtimepath+=$VIM,$VIMRUNTIME
call vundle#rc(bundle_path)         " Undocumented.  :)

Bundle 'gmarik/vundle'
Bundle 'hfuchs/vimoutliner'

" Finally!  Fire up the works!
syntax on
filetype plugin indent on


" --- Flavouring
" ----------------------------------------------------------------------
set background=dark
set ignorecase smartcase
set textwidth=72
"set hidden  " When changing files (eg. ':e') keep them open in a buffer.
set diffopt+=iwhite  " Ignore whitespace (makes sense with my autocmd).

" Indentation - a hornet's nest.
set expandtab
set smarttab
set autoindent
set tabstop=4
set shiftwidth=4
"set copyindent
"set preserveindent
"set softtabstop=2

" Display Candy
"set number
set ruler
"set cursorcolumn  " Generally Distracting, sometimes helpful.
"set cursorline    " Dito.
set t_Co=256
"colorscheme desert " Doesn't suck too hard.


" --- Abbreviations and Custom Commands
" ----------------------------------------------------------------------
" Delete whitespace at the end of a line whenever I save, aka happy pill.
autocmd BufWritePre * :%s/\s\+$//e

