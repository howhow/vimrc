#!/bin/sh

for prog in "$@"
do
    echo ""
    echo "Checking $prog..."
    if dpkg --get-selections | grep -q "^$prog[[:space:]]*install$" >/dev/null; then
        echo "$prog is not installed"
        sudo apt-get install "$prog"
    else
        echo "$prog is installed"
    fi
done

echo ""
echo "Checking Vundle..."
if [ -d ~/.vim/bundle/Vundle.vim ]; then
    echo "Vundle is installed"
else
    echo "Vundle is not installed, clone from git"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo ""
echo "Preparing..."
c_path=$(pwd)
if [ -f ~/.vimrc ];  then
    echo "Backup current .vimrc"
    mv "$HOME"/.vimrc "$HOME"/.vimrc_bak
fi
ln -s "$c_path"/vimrc_howchen "$HOME"/.vimrc

echo ""
echo "Env setup done, install VIM plugin..."
vim +PluginInstall +qall

echo ""
echo "Enjoy..."
