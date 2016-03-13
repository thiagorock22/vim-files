execute pathogen#infect()
syntax on
filetype plugin indent on

call pathogen#helptags()

let mapleader = ","

"used for enable yank to clipboard
set clipboard=unnamedplus
set number
set nowrap
set shiftwidth=4
set tabstop=4
set expandtab
set hlsearch

" fix alt mapping on terminal
let c='0'
while c <= '9'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

set background=dark
colorscheme molokai

"set terminal colors to 256 for a better colorscheme
set t_Co=256

let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'

"config for multicursors plugin
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

let Tlist_Use_Right_Window = 1
"let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1 

" switch between vim window split
nmap <silent> <c-k> :wincmd k<CR>                                                         
nmap <silent> <c-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR>

" for command mode
nmap <S-Tab> <<
" for insert mode
imap <S-Tab> <Esc><<i
"to keep selected multiple identing on visual mode
vnoremap > >gv 
vnoremap <lt> <lt>gv 

"a better tab navigation
nnoremap <C-t> :tabnew<CR>
nnoremap gt :tabnext<CR>
nnoremap tg :tabprevious<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>
nnoremap <A-1> :tabnext 1<CR>
nnoremap <A-2> :tabnext 2<CR>
nnoremap <A-3> :tabnext 3<CR>
nnoremap <A-4> :tabnext 4<CR>
nnoremap <A-5> :tabnext 5<CR>
nnoremap <A-6> :tabnext 6<CR>
nnoremap <A-7> :tabnext 7<CR>
nnoremap <A-8> :tabnext 8<CR>
nnoremap <A-9> :tabnext 9<CR>

" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

"Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" NERDTree Configuration
let NERDTreeShowHidden=1
nmap <F8> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.swp$','\.svn$','\.git$','\~$']
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

if has("gui_running")
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set guioptions-=e  "remove remove the gui tab
endif

let g:vdebug_options = {
\ 'server': '127.0.0.1',
\ 'port': '9000'
\}

function! CopyMatches(reg)
    let hits = []
    %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
    let reg = empty(a:reg) ? '+' : a:reg
    let un = SortUnique( hits )
    execute 'let @'.reg.' = join(un, "\n") . "\n"'
endfunction

command! -register CopyMatches call CopyMatches(<q-reg>)

" Works like sort(), optionally taking in a comparator (just like the
" " original), except that duplicate entries will be removed.
function! SortUnique( list, ... )
    let dictionary = {}

    for i in a:list
        execute "let dictionary[ '" . i . "' ] = ''"
    endfor

    let result = []

    if ( exists( 'a:1' ) )
        let result = sort( keys( dictionary ), a:1 )
    else
        let result = sort( keys( dictionary ) )
    endif

    return result
endfunction

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates"
