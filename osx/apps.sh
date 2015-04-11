#
# Application installer (via brew-cask)
#

set -e

# Apps
apps=(
  alfred
  dropbox
  google-chrome
  google-japanese-ime
  slack-beta
  firefox
  vagrant
  flash
  iterm2
  virtualbox
  atom
  mailbox
  evernote-beta
  sketch
  quicklook-json
  skype
  java7
  coda
  appcleaner
)

# Specify the location of the apps
appdir="/Applications"
caskroom="/usr/local/Caskroom"

main() {

  # Ensure homebrew is installed
  homebrew

  # Install homebrew-cask
  if ! brew cask; then
    echo "installing cask..."
    brew install caskroom/cask/brew-cask
  fi

  # Tap alternative versions
  brew tap caskroom/versions

  # Tap the fonts
  # brew tap caskroom/fonts

  # install apps
  echo "installing apps..."
  for app in ${apps[@]}; do
    if brew cask list -1 | grep -q "^${app}"; then
      echo "Skip: brew cask install ${app}"
    else
      brew cask install --appdir=$appdir --caskroom=$caskroom ${app}
    fi
  done

  # install fonts
  # echo "installing fonts..."
  # brew cask install ${fonts[@]}

  # link with alfred
  alfred
  cleanup
}

homebrew() {
  if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

alfred() {
  brew cask alfred link
}

cleanup() {
  brew cleanup
}

main "$@"
exit 0
