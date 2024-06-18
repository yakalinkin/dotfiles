#!/bin/bash

DOTFILES=(.gitconfig .gitignore)

echo ""
echo "Copying dotfiles to home directory:"
echo ""

for dotfile in "${DOTFILES[@]}"; do
  cp -v ~/dotfiles/"$dotfile" ~/"$dotfile"
done

echo ""
echo "Setting up git user.name and user.email:"
echo ""

read -p "Enter your git username: " git_username
read -p "Enter your git email: " git_email

git config --global user.name "$git_username"
git config --global user.email "$git_email"

echo ""
echo "Done!"
