#
# Defines environment variables.
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi


# Custom environment vars... Custom scripts generally go in .zshrc since it's
# only loaded for interactive shells.

# Set the list of directories that Zsh searches for programs.
# Note: Unlike prezto default, I set this here rather than in .zprofile
# so that I can use $(brew --prefix) in .zshenv.
# See also https://github.com/sorin-ionescu/prezto/issues/1988
path=(
  $HOME/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)

### Ansible ###
# If I've created a vault password file, tell Ansible to use it.
# For security, NEVER commit this file to source control.
if [[ -s "$HOME/.ansible_vault_pass.txt" ]]; then
  export ANSIBLE_VAULT_PASSWORD_FILE="$HOME/.ansible_vault_pass.txt"
fi


### Go ###
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"


### Rust ###
export PATH="$PATH:$HOME/.cargo/bin"


### NVM ###
# Tell NVM where to store its nodes.
export NVM_DIR="$HOME/.nvm"


### PostgreSQL ###
export PGDATA="/usr/local/var/postgres"


### VirtualEnvWrapper ###
# install virtualenvwrapper using `pip3 install virtualenvwrapper`
export VIRTUALENVWRAPPER_PYTHON="$(brew --prefix)/bin/python3"
export PROJECT_HOME="$HOME/Code"


### XDG Configs pull directly from dotfiles ###
export XDG_CONFIG_HOME="$HOME/.dotfiles"
