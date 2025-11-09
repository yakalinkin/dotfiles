# Dotfiles

Personal configs and helper scripts for setting up a macOS machine.

> [!WARNING]
> Personal dotfiles. Use at your own risk.

#### Repository structure

```text
.
├── config.sh           # Installer
├── dotfiles/           # Source dotfiles
│   ├── .editorconfig
│   ├── .gitconfig
│   ├── .gitignore
│   └── .zshrc
└── bin/                # Helper scripts
    └── cisco-vpn.sh    # Cisco VPN helper
```

Clone to `~/dotfiles`, then run from your home folder:

```sh
cd ~
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
./config.sh
```

Notes:

- Commands assume you run them from your home directory.
- The installer expects the repo at `~/dotfiles`.
