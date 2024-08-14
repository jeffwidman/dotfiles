#
# Executes commands at login pre-zshrc.
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-g -i -M -R -S -w -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Additional Customizations
#


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
# or if Python was installed via Homebrew use `syspip3 install --break-system-packages virtualenvwrapper`
export VIRTUALENVWRAPPER_PYTHON="$(brew --prefix)/bin/python3"
export PROJECT_HOME="$HOME/Code"


### XDG Configs pull directly from dotfiles ###
export XDG_CONFIG_HOME="$HOME/.dotfiles"
