execute pathogen#infect()
syntax on
filetype plugin indent on

"used for enable yank to clipboard
set clipboard=unnamedplus
set number
set nowrap
set shiftwidth=4

let NERDTreeShowHidden=1

colorscheme badwolf

nmap <silent> <c-k> :wincmd k<CR>                                                         
nmap <silent> <c-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR>

"set terminal colors to 256 for a better colorscheme
set t_Co=256

"enabling powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

"powerline symbols enabled
let g:Powerline_symbols = 'fancy'

"config for multicursors plugin
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"some mapping for fuzzyfinder plugin
nmap ,f :FufFileWithCurrentBufferDir<CR>
no derivative Powerline 11
nmap ,b :FufBuffer<CR>
nmap ,t :FufTaggedFile<CR>

let Tlist_Use_Right_Window = 1
" let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1 

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
nnoremap <A-1> :tabnext 1<CR>
nnoremap <A-2> :tabnext 2<CR>
nnoremap <A-3> :tabnext 3<CR>
nnoremap <A-4> :tabnext 4<CR>
nnoremap <A-5> :tabnext 5<CR>
nnoremap <A-6> :tabnext 6<CR>
nnoremap <A-7> :tabnext 7<CR>
nnoremap <A-8> :tabnext 8<CR>
nnoremap <A-9> :tabnext 9<CR>

nmap <F8> :TagbarToggle<CR>

if has("gui_running")
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set guioptions-=e  "remove remove the gui tab
endif
