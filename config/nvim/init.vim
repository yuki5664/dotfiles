" setting
set number
set mouse=a
set noswapfile
set clipboard+=unnamed
set cursorline
set encoding=utf-8
set autoread
set ignorecase
set incsearch
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c


inoremap <silent> jj <ESC>

let mapleader = "\<space>"

inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<left>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<ESC>i
inoremap (<Enter> []<Left><CR><ESC><S-o>
inoremap " ""<Left>
inoremap "<Enter> ""<Left><CR><ESC><S-o>
inoremap ' ''<ESC>i
inoremap '<Enter> ''<Left><CR><ESC><S-o>

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'pechorin/any-jump.vim'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" setting debug for golang
" Plug 'sebdah/vim-delve'

" colors
Plug 'ghifarit53/tokyonight-vim'
call plug#end()

colorscheme tokyonight

" setting FZF
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GitFiles
  endif
endfun
nnoremap <C-b> :Buffers<CR>
nnoremap <C-g> :Rg<Space>
nnoremap <leader><leader> :Commands<CR>
nnoremap <C-p> :call FzfOmniFiles()<CR>

command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
\ : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
\ <bang>0)

" setting lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ }
      \ }


" setting nerdtree
nnoremap <C-e> :NERDTreeToggle<CR>

" setting delve
nmap <silent> <Leader>9 :DlvToggleBreakpoint<CR>
nmap <silent> <Leader>5 :DlvDebug<CR>

" setting coc.nvim
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" setting golang
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
