# Use github to sync vi config
- Tested on Ubuntu14.04 and 16.04
- **Only for C and Assembly language development**

## How to use
[git](https://git-scm.com/), [vim](https://github.com/vim/vim) and [gtags](https://www.gnu.org/software/global/global.html)* must be installed
```
git clone https://github.com/howhow/vimrc ~/.my_config/vim
cd ~/.my_config/vim
./install.sh cmake ctags cscope python2.7 silversearcher-ag
```
**NOTE**: On older systems (e.g. Ubuntu 14.04) you may run into compilation
issues with `cmake`. Therefore, install the following instead:
```
./install.sh cmake3 ctags cscope python2.7 silversearcher-ag
```

- you could clone to anywhere, but I like to save all my configs into one place
- [git installation guide](https://gist.github.com/derhuerst/1b15ff4652a867391f03)
- [gtags installtion guide](https://www.gnu.org/software/global/download.html)
```
  download latest gtags from: <https://www.gnu.org/software/global/download.html> and unzip it
  cd <unzipped_path>
  ./configure
  make
  make install
```
- [vim installation guide](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)
  - vim version must higer than 8.0

## Integrated plugins
1. plugin manager: [Vundle](https://github.com/VundleVim/Vundle.vim)
2. git: [fugitive](https://github.com/tpope/vim-fugitive)
3. complete: [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)*
4. status line: [airline](https://github.com/vim-airline/vim-airline)
5. color schemes: [gruvbox](https://github.com/morhetz/gruvbox), ~~[solarized](https://github.com/altercation/solarized)~~, ~~[dracula](https://draculatheme.com/vim/)~~
6. syntax checking: ~~[syntastic](https://github.com/vim-syntastic/syntastic)~~, [ale](https://github.com/w0rp/ale)
7. searching: ~~[CrtlP](https://github.com/ctrlpvim/ctrlp.vim)~~,[LeaderF](https://github.com/Yggdroot/LeaderF), [fzf](https://github.com/junegunn/fzf), [ack](https://github.com/mileszs/ack.vim), [vim-easymotion](https://github.com/easymotion/vim-easymotion)
8. document: [vimtex](https://github.com/lervag/vimtex), ~~[slumlord](https://github.com/scrooloose/vim-slumlord)~~
9. code: ~~[tagbar](https://github.com/majutsushi/tagbar)~~, ~~[cscopemaps](https://github.com/steffanc/cscopemaps.vim)~~, [gutentags](https://github.com/ludovicchabant/vim-gutentags), [gutentags_plus](https://github.com/skywind3000/gutentags_plus)

*YCM need compile after download, if fail to use `install.sh`, please refer to the [guide](https://github.com/Valloric/YouCompleteMe#installation)

## Some features
1. check tab and EOL whitespace
2. update tags in async mode by gutentags

## Keymaps

| keymap | desc |
|--------|------|
| `\` | leader |
| `<leader>f` | Open file list |
| `<leader>F` | Open current file function list |
| `<leader>a` | Grep current word under cursor |
| `jj`/`hh`/`hj`/`jh` | Exit insert mode |
| `<leader>3` | Open quickfix window |
| `<leader>4` | Close quickfix window |
| `<leader>5` | Previous quickfix item |
| `<leader>6` | Next quickfix item |
| `<leader>7` | Previous file buffer |
| `<leader>8` | Next file buffer |
| `<leader>cs` | Find symbol (reference) under cursor |
| `<leader>cg` | Find symbol definition under cursor |
| `<leader>cd` | Functions called by this function |
| `<leader>cc` | Functions calling this function |
| `<leader>ct` | Find text string under cursor |
| `<leader>ce` | Find egrep pattern under cursor |
| `<leader>cf` | Find file name under cursor |
| `<leader>ci` | Find files #including the file name under cursor |
| `<leader>ca` | Find places where current symbol is assigned |
| `<leader><space>` | Strip trailing white space |
| `<leader>wn` | Find trailing white space |
| `<leader>tn` | Find tab |

## TODO
- [x] Compile and install YCM in install.sh
- [x] Migrate all plugins to async in order to fast vi speed
- [ ] Support python project
- [ ] More error handling in install.sh
