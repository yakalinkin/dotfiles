# Dotfiles

This repository contains configuration files and a setup script for a macOS development environment, including Git and Zsh configurations.

###### FEATURES
- Custom `.gitconfig`
- Enhanced Zsh setup with [Oh My Zsh](https://ohmyz.sh/)
- Standardized `.editorconfig`

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

## Getting Started

###### REQUIREMENTS
- [Git](https://git-scm.com/)
- [Oh My Zsh](https://ohmyz.sh/)

### Installation

> **Warning**
> Only run the script if you understand its effects, as it will overwrite your existing setup files.

1. Clone the repository to your home directory:
    ```sh
    git clone https://github.com/yakalinkin/dotfiles.git ~/dotfiles
    ```

2. Navigate to the `dotfiles` directory:
    ```sh
    cd ~/dotfiles
    ```

3. Make the `config.sh` script executable and run it:
    ```sh
    chmod +x ./config.sh && ./config.sh
    ```

4. Remove the `dotfiles` directory:
    ```sh
    rm -rf ~/dotfiles
    ```

All set! You can now customize the configuration files in your home directory (`~/`) as needed or add new ones.
