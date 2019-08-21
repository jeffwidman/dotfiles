# Jeff Widman's Brewfile
# To make it so Homebrew can handle Brewfiles:
#   `brew tap Homebrew/bundle`
#   `brew bundle --file=~/.dotfiles/homebrew/.Brewfile`

# Generally life is simplest to not update OSX default SSH
# Because making a non-Apple SSH work with the OSX Keychain can be a pain
# As of OpenSSH 6.5 there's a much more secure encryption format for private keys:
# https://pthree.org/2014/12/08/super-size-the-strength-of-your-openssh-private-keys/
# Unfortunately doesn't seem to be supported by FileZilla (as of Feb 18, 2015)
# Also, no need to install HPN SSH patch per posts from 'djm' here:
# http://lwn.net/Articles/377723/
# brew 'ssh'


# Install all the things:
brew 'zsh'
brew 'ssh-copy-id'
brew 'fasd' # Fast directory switcher
brew 'git'
brew 'gibo' # quickly access Github's git ignore templates
brew 'less'
brew 'lesspipe' # pre-processes various file formats so they can be paged via Less
brew 'ctags'
brew 'stow'
brew 'tmux'
brew 'htop'
brew 'iftop'
brew 'ag' # Faster grep
brew 'ncdu' # ncurses-based directory/file size viewer
brew 'tree'

# Databases
brew 'sqlite'
brew 'postgresql'
brew 'mariadb' # in place of MySQL
brew 'redis'

# Python
brew 'python@2'
brew 'python3'

# Ruby
# Use [RVM](http://rvm.io/) instead of Homebrew.

# Java
# VisualVM is an alternative to Jconsole for JMX debugging
brew cask install java  # required for visualvm
brew cask install visualvm

# Node
# Use [`nvm`](https://github.com/creationix/nvm) instead of Homebrew.
# Install manually using git clone rather than the install script:
# https://github.com/creationix/nvm#manual-install

# Neovim
# I prefer over Vim for the simple reason they accepted one of my patches ;)
tap 'neovim/homebrew-neovim'
brew 'neovim/neovim/neovim', args: ['HEAD']

# Quicklook plugins
tap 'Caskroom/cask'
brew 'Caskroom/cask/qlstephen'
brew 'Caskroom/cask/betterzipql'

# Command-not-found
# this is used by prezto's command-not-found module:
# https://github.com/sorin-ionescu/prezto/tree/master/modules/command-not-found#command-not-found
# https://github.com/Homebrew/homebrew-command-not-found#install
tap 'homebrew/command-not-found'
