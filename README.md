# dotfiles

These are my dotfiles. *There are many like them, but these are mine.*

## Installation

```bash
# Clone down the repo
git clone https://github.com/kenmoini/dotfiles.git ~/.dotfiles

# If needed, install things onto a fresh system

# For Mac OS X - it is safe to run and re-run
~/.dotfiles/scripts/brew-setup.sh
~/.dotfiles/scripts/mac-os-setup.sh

# For RHEL
~/.dotfiles/scripts/rhel-setup.sh

# Universal
~/.dotfiles/scripts/ohmyzsh-setup.sh

# Run the bootstrap script - it is safe to run and re-run
~/.dotfiles/scripts/bootstrap.sh
```

## Staying up to date

```bash
# Pull down the latest changes
cd ~/.dotfiles

git pull

# Run the bootstrap script - it is safe to run and re-run
~/.dotfiles/scripts/bootstrap.sh
```
