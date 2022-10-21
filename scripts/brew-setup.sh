# kenmoini/dotfiles

# Check if brew is installed
if ! command -v brew &> /dev/null; then
  echo "brew could not be found, installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)";
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
#brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
#brew install gnu-sed

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install other useful binaries.
brew install cmatrix
brew install git
brew install git-lfs
brew install imagemagick
brew install p7zip
brew install golang

# Install GUI tools
brew install --cask iterm2 vlc firefox

# Install fonts
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Remove outdated versions from the cellar.
brew cleanup