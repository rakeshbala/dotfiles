#!/bin/bash
echo "Only bootstrapping for zsh.. "

echo "Detecting platform..."
platform=$(uname -s)
if [ "$platform" == "Darwin" ]; then
    platform="osx"
fi
echo "Platform is $platform..."

echo "Checking brew installation"

which -s brew
if [[ $? != 0 ]] ; then
    echo "brew not installed.. "
    if [ "$platform" == "osx" ]; then
        # Install Homebrew
        echo "Installing homebrew..."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        # Install Linuxbrew
        echo "Installing linuxbrew..."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/linuxbrew/go/install)"
    fi
else
    echo "brew installed at $(which brew)... Updating..."
    brew update && brew upgrade && brew prune  && brew doctor
fi

while read tool; do
    brew install "$tool"
done < "Brewfile.$platform"

echo "Backing up old files"
mkdir -p "$HOME/.dotfiles_old"
files=( .zshrc .vimrc .tmux.conf .gitconfig )
for i in "${files[@]}"
do
    mv $i $HOME/.dotfiles_old/
done
mv $HOME/.vim/.vimrc $HOME/.dotfiles_old/.vimrc_fromdotvim


if test "$(ls -A "$HOME/.dotfiles_old")"; then
    echo "Done.."
else
    rmdir "$HOME/.dotfiles_old"
fi

echo "Symlinking dot files..."
echo ".zshrc"
ln -s zsh/zshrc $HOME/.zshrc
echo ".vimrc"
echo "Setting up vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s vim/vimrc $HOME/.vim/.vimrc
nvim +PlugInstall +qall
echo ".tmux.conf"
ln -s tmux/tmux.conf $HOME/.tmux.conf
echo ".gitconfig"
ln -s git/gitignore $HOME/.gitconfig

echo "Bootstrapped for zsh!! " | cowsay | lolcat
