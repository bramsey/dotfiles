nstall homebrew and cask
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

brew install git
brew tap phinze/homebrew-cask
brew tap homebrew/dupes
brew install brew-cask

brew cask install google-chrome 
brew cask install caffeine
brew cask install dropbox
brew cask install firefox
brew cask install iterm2
brew cask install colloquy
brew cask install skype

curl -L https://get.rvm.io | bash -s stable --rails --autolibs=enable

brew install python
pip install virtualenv

brew install curl
brew install emacs --cocoa
#brew install reattach-to-user-namespace
brew install tmux
brew install wget

# install macvim with ruby support
brew install macvim
