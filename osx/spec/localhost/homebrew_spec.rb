require 'spec_helper'

# Is homebrew installed?
describe command "test $(which brew)" do
  its(:exit_status) { should eq 0 }
end

# Is homebrew cask installed?
describe package("brew-cask") do
  it { should be_installed.by(:homebrew) }
end


# homebrew repos
brew_repos = %w(
  caskroom/cask
  caskroom/fonts
  caskroom/versions
  homebrew/dupes
  homebrew/php
)

brew_repos.each do |repo|
  describe command "brew tap | grep -q '#{repo}'" do
    its(:exit_status) { should eq 0 }
  end
end


# homebrew pacakges
brew_packages = %w(
  git
  hub
  trash
  rbenv
  ruby-build
  rbenv-gemset
  rbenv-default-gems
  rbenv-gem-rehash
  heroku-toolbelt
  nodebrew
  ngrok
  php55
  composer
  boot2docker
  docker
)

brew_packages.each do |pkg|
  describe package(pkg) do
    it { should be_installed.by(:homebrew) }
  end
end


# homebrew cask packages
cask_packages = %w(
  alfred
  appcleaner
  atom
  coda
  dropbox
  firefox
  flash
  google-chrome
  google-japanese-ime
  iterm2
  java7
  licecap
  mailbox
  messenger
  quicklook-json
  skype
  slack
  utorrent
  vagrant
  virtualbox
)

cask_packages.each do |pkg|
  describe package(pkg) do
    it { should be_installed.by(:homebrew_cask) }
  end
end
