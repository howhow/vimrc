#!/bin/sh

for prog in "$@"
do
    echo ""
    echo "Checking $prog..."
    if [ "$(dpkg-query -W -f='${Status}' $prog 2>/dev/null | grep -c "ok installed")" -eq 0 ];
    then
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
echo "Checking Linux config"
if [ -d ~/.my_config/vim ]; then
    echo "How Chen Linux config installed"
else
    echo "How Chen Linux config not installed, clone from git"
    git clone https://github.com/howhow/vimrc ~/.my_config/vim
fi

echo ""
echo "Preparing..."
if [ -f ~/.vimrc ];  then
    echo "Backup current .vimrc"
    mv ~/.vimrc ~/.vimrc_bak
fi
ln -s ~/.my_config/vim/vimrc_howchen ~/.vimrc

echo ""
echo "Env setup done, install VIM plugin..."
vim +PluginInstall +qall
