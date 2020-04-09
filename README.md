# lf.vim

Fast and featureful file manager in vim/neovim powered by lf.

<p align="center">
  <img width="934" src="https://user-images.githubusercontent.com/7200153/77138110-8dd94600-6aab-11ea-925f-8e159b8f0ad4.png">
  <small>colorscheme <a href="https://github.com/pgdouyon/vim-yin-yang">yin</a></small>
</p>

### Requirements

1. lf (minimum version 2.2)
2. Neovim or Vim 8.1 with terminal support

### Install

You must install lf itself. Instructions
[here](https://github.com/jarun/lf#installation).

Then install using your favorite plugin manager:

```vim
" using vim-plug
Plug 'mcchrish/lf.vim'
```

### Usage

To open lf as a file picker in vim/neovim, use the command `:NnnPicker` or
`:Np` or the key-binding `<leader>n`. You can pass a directory to `:NnnPicker`
command and opens lf from there e.g. `:NnnPicker path/to/somewhere`.

Once you [select](https://github.com/jarun/lf#selection) one or more files and
press <kbd>enter</kbd>, vim quits the lf window and opens the first selected
file and add the remaining files to the arg list/buffer list.

Pressing <kbd>enter</kbd> on a file in lf will pick any earlier selection, pick
the file and exit lf.

Note that pressing <kbd>l</kbd> or <kbd>Right</kbd> on a file would open it
instead of picking.

To discard selection and exit, press <kbd>^G</kbd>.

Please visit the complete documentation by running `:help lf`.

### Configurations

#### Custom mappings

```vim
" Disable default mappings
let g:lf#set_default_mappings = 0

" Then set your own
nnoremap <silent> <leader>nn :NnnPicker<CR>


" Or override
" Start lf in the current file's directory
nnoremap <leader>n :NnnPicker '%:p:h'<CR>
```

#### Layout

```vim
" Opens the lf window in a split
let g:lf#layout = 'new' " or vnew, tabnew etc.

" Or pass a dictionary with window size
let g:lf#layout = { 'left': '~20%' } " or right, up, down

" Floating window (neovim latest and vim with patch 8.2.191)
let g:lf#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
```

#### Action

You can set extra key-bindings for opening files in different ways. Nothing is
set by default to not override lf's own key-bindings.

```vim
let g:lf#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }
```

For example, when inside an lf window, pressing <kbd>ctrl-t</kbd> will open the
selected file in a tab, instead of the current window. <kbd>ctrl-x</kbd> will
open in a split an so on. Meanwhile for multi selected files will be loaded in
the buffer list.

#### Command override

When you want to override the default lf command and add some extra flags.
Example you want to start lf in detail mode.

```vim
let g:lf#command = 'lf -d'

" or pass some env variables
let g:lf#command = 'NNN_TRASH=1 lf -d'
```

#### `lf#pick()`

The `lf#pick([<dir>][,<opts>])` function can be called with custom directory
and additional options such as opening file in splits or tabs. Basically a more
configurable version of `:NnnPicker` command.

```vim
call lf#pick('~/some-files', { 'edit': 'vertical split' })
" Then you can do all kinds of mappings if you want
```

`opts` can be:

- `edit` - type of window the select file will be open.
- `layout` - same as `g:lf#layout` and overrides it if specified.

#### Environment variables

You can define env variables in `vimrc` and lf will detect it.

```vim
let $NNN_TRASH=1
```

### Credits

Main lf program: https://github.com/jarun/lf
