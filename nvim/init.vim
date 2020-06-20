" cmap Wq wq kinda like alias
let g:python3_host_prog="/Users/jorgenr/anaconda3/bin/python3"
set termguicolors
let g:deoplete#enable_at_startup = 1
" Leader
let mapleader = " "
set modifiable
let NERDTreeShowHidden=1
set autochdir
let NERDTreeChDirMode=2
nnoremap <leader>n :NERDTree .<CR>
nmap <leader>e :CocCommand explorer<CR>
nmap <leader>f :CocCommand explorer floating<CR>
nnoremap <silent> <Leader>+ :exe "vertical resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winheight(0) * 2/3)<CR>
"noremap <F3> :Autoformat<CR>
"au BufWrite * :Autoformat
"let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
"let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlighting
" Nerdtree file browsing
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
" Move to and from Tmux and Vim panes
Plug 'christoomey/vim-tmux-navigator'

Plug 'ianks/vim-tsx'

Plug 'leafgarland/typescript-vim'

Plug 'vim-airline/vim-airline'

Plug 'tomasr/molokai'

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdcommenter'

Plug 'ntpeters/vim-better-whitespace'
" Git stuff
Plug 'airblade/vim-gitgutter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

Plug 'machakann/vim-highlightedyank'

Plug 'junegunn/fzf'

Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
call plug#end()

" jj replaces Esc from insert mode
:imap jj <Esc>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

command! -bang ProjectFiles call fzf#vim#files('~/Ignite', <bang>0)

command! -bang Agg call fzf#vim#ag('~/Ignite', <bang>0)
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, '--skip-vcs-ignores', <bang>0)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview(), <bang>0)
set pastetoggle=<leader><p>

let g:molokai_original = 1
colorscheme molokai

nnoremap <leader>a :NERDTreeToggle<cr>

" Tabs
nnoremap <Left> :tabprevious<cr>
nnoremap <Right> :tabnext<cr>
" Display hidden characters
set list
set listchars=tab:▸\ ,eol:¬
let g:airline_powerline_fonts = 1

" Enable mouse
set mouse=a

" Vim split standards
set splitbelow
set splitright

" Fix whitespace
nnoremap <leader>s :StripWhitespace<cr>

set cursorline
set ruler

set autowrite
set autoread
set autoindent

" Persist undos
set undofile
set undodir=/tmp
" Tab settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

set scrolljump=-15
" Better movement around wrapped lines
nnoremap j gj
nnoremap k gk

" Global clipboard for macOS
set clipboard=unnamed

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
nnoremap <leader><space> :noh<cr>

"nnoremap <C-p> :FZF<cr>
nnoremap <C-P> :FZF ~<cr>
nnoremap <C-s> :Rg!<cr>
nnoremap <C-g> :GFiles<cr>
nnoremap <C-f> :Buffers<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" From coc.vim
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <C-d>p <Plug>(coc-diagnostic-prev)
nmap <silent> <C-d>n <Plug>(coc-diagnostic-next)

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
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>b  <Plug>(coc-codeaction-selected)
nmap <leader>b  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>bc  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

"Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <leader>r <Plug>(coc-range-select)
xmap <silent> <leader>r <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

command! -nargs=0 TSAutofix :call CocAction('runCommand', 'tsserver.executeAutofix')
noremap <silent> <leader>f :TSAutofix<CR>

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <tab>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <tab>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <tab>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <tab>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <tab>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <tab>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <tab>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <tab>p  :<C-u>CocListResume<CR>

nnoremap <silent> <leader>cl  :<C-u>CocList diagnostics<cr>
" gh - get hint on whatever's under the cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>

" Startify
let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [
            \ { 'c': '~/.config/i3/config' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ '~/Blog',
            \ '~/Code',
            \ '~/Pics',
            \ ]
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0

let g:startify_custom_header = [
        \ '   _  __     _',
        \ '  / |/ /  __(_)_ _',
        \ ' /    / |/ / /  ` \',
        \ '/_/|_/|___/_/_/_/_/',
        \ '  __________                   .__                 _________________________   ____ ___',
        \ '   \        \ _______  ______  |  |___  __ ____    \      \__    ___/\      \ |    |   \',
        \ '    |       _// __ \  \/ /  _ \|  |\  \/ // __ \   /   |   \|    |   /   |   \|    |   /',
        \ '    |    |   \  ___/\   (  <_> )  |_\   /\  ___/  /    |    \    |  /    |    \    |  /',
        \ '    |____|_  /\___  >\_/ \____/|____/\_/  \___  > \____|__  /____|  \____|__  /______/',
        \ '           \/     \/                          \/          \/                \/',
        \]
