#!/bin/bash
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
