#!/bin/sh

echo "Setting up..."
# Check for Homebrew and install it if needed
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Cause i'm using mackup to backup my applications preferences
# ( everything under /Library and some dotfiles)
brew install mackup
mackup restore

# Create a Sites directory
mkdir $HOME/Sites

# Set macOS preferences
source macos

echo "Your Mac is now ready ! "