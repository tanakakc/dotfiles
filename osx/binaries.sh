#
# Binary installer
#

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew
brew update && brew upgrade brew-cask

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# Install other useful binaries
binaries=(
  git
  hub
  trash
  rbenv
  ruby-build
  rbenv-gemset
  rbenv-default-gems
  rbenv-gem-rehash
  heroku-toolbelt
  nvm
)

# Install the binaries
brew install ${binaries[@]}

# Remove outdated versions from the cellar
brew cleanup

exit 0
