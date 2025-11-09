#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$SCRIPT_DIR/dotfiles"
DOTFILES=(.gitconfig .gitignore .zshrc .editorconfig)
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d%H%M%S)"

RED='\033[0;31m'
GRAY='\033[0;90m'
WHITE='\033[0;37m'
NC='\033[0m'

err() { printf '%b\n' "${RED}$*${NC}" >&2; }

log() { printf '%b\n' "${GRAY}$*${NC}"; }

logw() { printf '%b\n' "${WHITE}$*${NC}"; }

usage() {
  cat <<EOF
Usage:

$(basename "$0")

Install dotfiles and configure git user.name/user.email interactively.
EOF
}

while getopts ":h" OPT; do
  case "$OPT" in
    h) usage; exit 0 ;;
    \?) usage; exit 1 ;;
  esac
done

prompt_confirm() {
  local prompt_message="$1"
  read -r -p "$prompt_message [y/N] " response
  case "$response" in
    [yY][eE][sS]|[yY]) return 0 ;;
    *) return 1 ;;
  esac
}

copy_dotfiles() {
  printf '\n'
  log 'Installing dotfiles...'
  printf '\n'

  if [ ! -d "$DOTFILES_DIR" ]; then
    err "Dotfiles directory not found: $DOTFILES_DIR"
    exit 1
  fi

  local BACKUP_ALL=0
  if prompt_confirm "Backup existing files and replace them all?"; then
    BACKUP_ALL=1
    mkdir -p "$BACKUP_DIR"
    log "Backups will be stored in: $BACKUP_DIR"
  fi

  for dotfile in "${DOTFILES[@]}"; do
    local src="$DOTFILES_DIR/$dotfile"
    local dest="$HOME/$dotfile"

    if [ ! -e "$src" ]; then
      err "Source file \"$src\" does not exist."
      continue
    fi

      if [ -L "$dest" ]; then
        logw "Found symlink at $dest"
        if [ "${BACKUP_ALL:-0}" -eq 1 ]; then
          log "Moving symlink: $dest -> $BACKUP_DIR/"
          if ! mv "$dest" "$BACKUP_DIR/"; then
            err "Failed to backup $dest to $BACKUP_DIR"
            exit 1
          fi
        else
          log "Skipped symlink: $dest"
          continue
        fi
    elif [ -e "$dest" ]; then
      if [ "$BACKUP_ALL" -eq 1 ]; then
        log "Backing up $dest -> $BACKUP_DIR/"
        if ! mv "$dest" "$BACKUP_DIR/"; then
          err "Failed to backup $dest to $BACKUP_DIR"
          exit 1
        fi
      else
        log "Skipping $dest"
        continue
      fi
    fi

    log "Creating symlink: $src -> $dest"
    if ! ln -sfn "$src" "$dest"; then
      err "Failed to create symlink $dest -> $src"
      exit 1
    fi
  done

  if [ "${BACKUP_ALL:-0}" -eq 1 ] && [ -d "$BACKUP_DIR" ]; then
    logw "Backups stored in: $BACKUP_DIR"
  fi
}

setup_git() {
  printf '\n'

  local git_name
  local git_email
  git_name="${GIT_NAME:-}"
  git_email="${GIT_EMAIL:-}"

  if ! command -v git >/dev/null 2>&1; then
    err "git is not installed or not in PATH. Please install git and retry."
    exit 1
  fi

  if [ -z "$git_name" ]; then
    read -r -p "Enter your git user.name: " git_name
  fi
  git config --global user.name "$git_name"

  if [ -z "$git_email" ]; then
    read -r -p "Enter your git user.email: " git_email
  fi
  git config --global user.email "$git_email"
}

main() {
  copy_dotfiles
  setup_git
  printf '\n'
  logw 'Done!'
}

main
