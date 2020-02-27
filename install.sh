#!/bin/sh
#####################################################
# File:     install.sh
# Author:   howchen
# Date:     20/Feb/2020
# Usage:    ./install args
#
# Example:
#   ./install cmake cscope silversearch-ag python3.7
#####################################################

curr_dat=$(date +"%S%M%H%d%m%Y")

for prog in "$@"
do
    echo ""
    echo "Checking $prog..."
    if dpkg --get-selections | grep -q "^$prog[[:space:]]*install$" >/dev/null; then
        echo "$prog is not installed!"
        sudo apt-get install "$prog"
    else
        echo "$prog already installed"
    fi
done

echo ""
echo "Checking for exist vim plugins"
if [ -d "$HOME/.vim" ]; then
    echo "Detected existing vim plugin..."
    echo "Do you want to backup first? [y]/n: "
    read -r option
    if [ "$option" = "y" ] || [ "$option" = "Y" ]; then
        mv "$HOME/.vim" "$HOME/.vim_bak_$curr_dat"
        echo "Backup done"
    fi
fi

echo ""
echo "Checking vim-plug..."
if [ -f ~/.vim/autoload/plug.vim ]; then
    echo "vim-plug already installed"
else
    echo "vim-plugin is not installed, get it..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo ""
echo "Checking fzf..."
if [ -d ~/.fzf ]; then
    echo "fzf already installed"
else
    echo "fzf is not installed, clone from git and install..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
fi

echo ""
echo "Add fzf to bin search PATH..."
if [ -f /usr/local/bin/fzf ];  then
    echo "fzf has old version, remove first..."
    sudo rm /usr/local/bin/fzf
fi

if [ ! -f /usr/local/bin/fzf ]; then
    echo "Make symbol link to bin search PATH"
    sudo ln -s ~/.fzf/bin/fzf /usr/local/bin/fzf
fi

echo ""
echo "Final preparing..."
c_path=$(pwd)
if [ -f ~/.vimrc ];  then
    echo "Backup current .vimrc..."
    mv "$HOME/.vimrc" "$HOME/.vimrc_bak_$curr_dat"
fi
ln -s "$c_path/vimrc" "$HOME/.vimrc"

echo ""
echo "Env setup done, install VIM plugin..."
vim +PlugInstall +qall

#echo ""
#echo "Plugin install doen, build YCM..."
#if [ -f ~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so ]; then
#    echo "YCM installed"
#else
#    echo "YCM has not been compiled, need compile..."
#    cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer && cd -
#fi

echo ""
echo "Enjoy..."

