#
# Defines environment variables.
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi


# Custom environment vars... Custom scripts generally go in .zshrc since it's
# only loaded for interactive shells.


### Ansible ###
# If I've created a vault password file, tell Ansible to use it.
# For security, NEVER commit this file to source control.
if [[ -s "$HOME/.ansible_vault_pass.txt" ]]; then
  export ANSIBLE_VAULT_PASSWORD_FILE="$HOME/.ansible_vault_pass.txt"
fi


### NVM ###
# Tell NVM where to store its nodes.
export NVM_DIR="$HOME/.nvm"


### PostgreSQL ###
export PGDATA="/usr/local/var/postgres"


### VirtualEnvWrapper ###
# install virtualenvwrapper using `pip3 install virtualenvwrapper`
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export PROJECT_HOME="$HOME/Code"


### XDG Configs pull directly from dotfiles ###
export XDG_CONFIG_HOME="$HOME/.dotfiles"
