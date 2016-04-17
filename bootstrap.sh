#!/bin/bash
echo "Only bootstrapping for zsh.. "


echo "Detecting platform..."
platform=$(uname -s)
if [ "$platform" == "Darwin" ]; then
    platform="osx"
fi
echo "Platform is $platform..."

dotfilepath=$(pwd)
echo "Dotfiles at $dotfilepath ..."
echo $dotfilepath > $HOME/.dotfilepath

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
    mv -i "$HOME/$i" "$HOME/.dotfiles_old/"
done
mv -i $HOME/.vim/.vimrc $HOME/.dotfiles_old/.vimrc_fromdotvim


if test "$(ls -A "$HOME/.dotfiles_old")"; then
    echo "Done.."
else
    rmdir "$HOME/.dotfiles_old"
fi

echo "Symlinking dot files..."
echo ".zshrc"
ln -s "$dotfilepath/zsh/zshrc" $HOME/.zshrc
echo ".vimrc"
echo "Setting up vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s "$dotfilepath/vim/vimrc" $HOME/.vim/.vimrc
ln -s "$dotfilepath/vim/vimrc" $HOME/.vimrc
nvim +PlugInstall +qall
echo ".tmux.conf"
ln -s "$dotfilepath/tmux/tmux.conf" $HOME/.tmux.conf
echo ".gitconfig"
ln -s "$dotfilepath/git/gitconfig" $HOME/.gitconfig

echo "Bootstrapped for zsh!! Source $HOME/.zshrc if you are using a zsh else restart the shell. Enjoy" | cowsay | lolcat
