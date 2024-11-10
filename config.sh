#!/bin/bash

DOTFILES=(.gitconfig .gitignore .zshrc)

RED='\033[0;31m'
NC='\033[0m'

copy_dotfiles() {
  echo ""
  echo "Copying dotfiles to home directory..."
  echo ""

  for dotfile in "${DOTFILES[@]}"; do
    if [ -f "$PWD/$dotfile" ]; then
      cp -v "$PWD/$dotfile" ~/"$dotfile"
    else
      echo -e "${RED}File \"$PWD/$dotfile\" does not exist.${NC}"
    fi
  done
}

setup_git() {
  echo ""

  read -p "Enter your git user.name: " git_username
  git config --global user.name "$git_username"

  read -p "Enter your git user.email: " git_useremail
  git config --global user.email "$git_useremail"
}

main() {
  copy_dotfiles
  setup_git
  echo ""
  echo "Done!"
}

main
