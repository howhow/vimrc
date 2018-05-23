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
    echo "Vundle installed"
else
    echo "Vundle is not installed, clone from git..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo ""
echo "Checking fzf..."
if [ -d ~/.fzf ]; then
    echo "fzf installed"
else
    echo "fzf is not installed, clone from git and install..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
fi

echo ""
echo "Add fzf to bin search PATH..."
if [ -f /usr/local/bin/fzf ];  then
    echo "Older version, remove first..."
    sudo rm /usr/local/bin/fzf
fi
sudo ln -s ~/.fzf/bin/fzf /usr/local/bin/fzf

echo ""
echo "Build YCM..."
if [ -f ~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so ]; then
    echo "YCM installed"
else
    echo "YCM has not been compiled, need compile..."
    cd ~/.vim/bundle/YouCompleteMe && install.py --clang-completer && cd -
fi

echo ""
echo "Preparing..."
c_path=$(pwd)
if [ -f ~/.vimrc ];  then
    echo "Backup current .vimrc..."
    mv "$HOME"/.vimrc "$HOME"/.vimrc_bak
fi
ln -s "$c_path"/vimrc_howchen "$HOME"/.vimrc

echo ""
echo "Env setup done, install VIM plugin..."
vim +PluginInstall +qall

echo ""
echo "Enjoy..."

