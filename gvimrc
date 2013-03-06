set anti
set guioptions=ec
set vb
set cursorline
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12

nnoremap <A-S-Left> :tabprevious<CR>
nnoremap <A-S-Right> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <A-w> :tabclose<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

if has("gui_macvim")
  set guifont=Andale\ Mono:h14
  " Remap tabs
  macmenu &File.New\ Tab key=<D-t>
  macmenu &File.Open\ Tab\.\.\. key=<D-^>

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  " Next and previous tab
  macmenu Window.Select\ Next\ Tab Key=<S-D-Right>
  macmenu Window.Select\ Previous\ Tab key=<S-D-Left>
end
