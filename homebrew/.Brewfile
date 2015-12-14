# Jeff Widman's Brewfile
# To make it so Homebrew can handle Brewfiles:
#   `brew tap Homebrew/bundle`
#   `brew bundle --file=~/.dotfiles/homebrew/.Brewfile`


# Add formulae that duplicate OS X software with updated versions:
tap 'homebrew/dupes'

# Generally life is simplest to not update OSX default SSH
# Because making a non-Apple SSH work with the OSX Keychain can be a pain
# As of OpenSSH 6.5 there's a much more secure encryption format for private keys:
# https://pthree.org/2014/12/08/super-size-the-strength-of-your-openssh-private-keys/
# Unfortunately doesn't seem to be supported by FileZilla (as of Feb 18, 2015)
# Also, no need to install HPN SSH patch per posts from 'djm' here:
# http://lwn.net/Articles/377723/
# brew 'homebrew/dupes/ssh'


# Install all the things:
brew 'zsh'
brew 'ssh-copy-id'
brew 'fasd' # Fast directory switcher
brew 'git'
brew 'gibo' # quickly access Github's git ignore templates
brew 'homebrew/dupes/less'
brew 'lesspipe' # pre-processes various file formats so they can be paged via Less
brew 'ctags'
brew 'stow'
brew 'tmux'
brew 'htop'
brew 'ag' # Faster grep

# Databases
brew 'sqlite'
brew 'postgresql'
brew 'mariadb' # in place of MySQL
brew 'redis'

# Python
brew 'python'
brew 'python3'

# Ruby: install using [RVM](http://rvm.io/) instead of Homebrew. Much easier to manage gemsets, ruby versions, etc.

# Neovim
# I prefer over Vim for the simple reason they accepted one of my patches ;)
tap 'neovim/homebrew-neovim'
brew 'neovim/neovim/neovim', args: ['HEAD']

# Quicklook plugins
tap 'caskroom/cask'
brew 'caskroom/cask/brew-cask'
cask 'qlstephen'
cask 'betterzipql'
