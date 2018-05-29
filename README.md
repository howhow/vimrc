# Use github to sync vi config
*Tested on Ubuntu14.04 and 16.04

## How to use
1. [git](https://git-scm.com/)* and [vim](https://github.com/vim/vim)* must be installed
2. git clone https://github.com/howhow/vimrc ~/.my_config/vim
3. cd ~/.my_config/vim
4. ./install.sh ctags cscope python2.7 silversearcher-ag

*you could clone to anywhere, but I like to save all my configs into one place

*[git installation guide](https://gist.github.com/derhuerst/1b15ff4652a867391f03)

*[vim installation guide](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)

## Integrated plugins
1. plugin manager: [Vundle](https://github.com/VundleVim/Vundle.vim)
2. git: [fugitive](https://github.com/tpope/vim-fugitive)
3. complete: [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)*
4. status line: [airline](https://github.com/vim-airline/vim-airline)
5. color schemes: [solarized](https://github.com/altercation/solarized), [gruvbox](https://github.com/morhetz/gruvbox), [dracula](https://draculatheme.com/vim/)
6. syntax checking: [syntastic](https://github.com/vim-syntastic/syntastic)
7. searching: ~~[CrtlP](https://github.com/ctrlpvim/ctrlp.vim)~~,[LeaderF](https://github.com/Yggdroot/LeaderF), [fzf](https://github.com/junegunn/fzf), [ack](https://github.com/mileszs/ack.vim), [vim-easymotion](https://github.com/easymotion/vim-easymotion)
8. document: [vimtex](https://github.com/lervag/vimtex), ~~[slumlord](https://github.com/scrooloose/vim-slumlord)~~
9. code: ~~[tagbar](https://github.com/majutsushi/tagbar)~~, [cscopemaps](https://github.com/steffanc/cscopemaps.vim)

*YCM need compile after download, please refer to the [guide](https://github.com/Valloric/YouCompleteMe#installation)

## Some features
1. check tab and EOL whitespace
2. update tag and cscope in vim

## TODO
- [x] Compile and install YCM in install.sh
- [ ] Migrate all plugins to async in order to fast vi speed
- [ ] Migrate from Vundle to [vim-plug](https://github.com/junegunn/vim-plug)
- [ ] More error handling in install.sh
