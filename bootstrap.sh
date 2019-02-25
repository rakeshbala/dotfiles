#!/bin/bash
echo "Only bootstrapping for zsh.. "


echo "Detecting platform..."
platform=$(uname -s)
if [ "$platform" == "Darwin" ]; then
    platform="osx"
elif [ "$platform" == "Linux" ]; then
    platform="linux"
else
    echo "$platformi is not supported.. Exiting.."
    exit
fi
echo "Platform is $platform..."

dotfilepath=$(pwd)
echo "Dotfiles at $dotfilepath ..."
echo $dotfilepath > $HOME/.dotfilepath
export DOTFILEDIR=$dotfilepath

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

brew bundle  --file="$DOTFILEDIR/Brewfile"

echo "Backing up old files"
mkdir -p "$HOME/.dotfiles_old"
files=( .zshrc .tmux.conf .gitconfig )
for i in "${files[@]}"
do
    mv -i "$HOME/$i" "$HOME/.dotfiles_old/"
done
mv -i $HOME/.vim/vimrc $HOME/.dotfiles_old/.vimrc_fromdotvim


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
ln -s "$dotfilepath/vim/vimrc" $HOME/.vim/vimrc
nvim +PlugInstall +qall
echo ".tmux.conf"
ln -s "$dotfilepath/tmux/tmux.conf" $HOME/.tmux.conf
echo ".gitconfig"
ln -s "$dotfilepath/git/gitconfig" $HOME/.gitconfig
echo "Symlinking neovim paths.. "
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s $HOME/.vim $XDG_CONFIG_HOME/nvim
ln -s $HOME/.vim/vimrc $XDG_CONFIG_HOME/nvim/init.vim

mkdir -p "$HOME/.dotfile_local"

echo "Bootstrapped for zsh!! Add local configs (untracked) to $HOME/.dotfile_local/zshrc.local. Enjoy." | cowsay

