# Yaroslav's Dotfiles

This repository contains my dotfiles for configuring a macOS system and setting up a development environment.

#### File Overview

```sh
.
├── .editorconfig # Editor configuration
├── .gitconfig    # Git configuration
├── .gitignore    # Git ignore rules
├── .zshrc        # Zsh configuration
│
└── config.sh     # Setup script for home directory
```

## Home Directory Setup

**Warning:** Only run the script if you understand its effects, as it will overwrite your existing setup files.

To set up, clone the repository and run the `config.sh` script from your home directory:

```sh
chmod +x ~/dotfiles/config.sh && ~/dotfiles/config.sh
```

Verify the setup by checking these files:

```sh
code ~/.gitconfig ~/.gitignore ~/.zshrc
```

To keep your home directory clean, you can remove the setup files:

```sh
rm -rf ~/dotfiles
```

You can now customize the configuration files as needed.
