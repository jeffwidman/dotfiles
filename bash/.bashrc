# This explains the difference between .profile, .bash_profile, and .bashrc--be sure to read the comments:
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

# If on macOS:
if [[ $OSTYPE == darwin* ]]; then
    # Tell compilers we have a 64 bit architecture
    export ARCHFLAGS="-arch x86_64"
    # Ensure Homebrew binaries take precedence
    export PATH=/usr/local/bin:/usr/local/sbin:"$PATH"
fi


### Go ###
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"


### Rust ###
export PATH="$PATH:$HOME/.cargo/bin"


### NVM ###
# Tell NVM where to store its nodes.
export NVM_DIR="$HOME/.nvm"


### Pip (Python) ###
# pip should only install packages if there is a virtualenv currently
# activated prevents accidentally installing packages without a virtualenv
export PIP_REQUIRE_VIRTUALENV=true
# create syspip workaround
syspip(){
  PIP_REQUIRE_VIRTUALENV=false pip "$@"
}
syspip3(){
  PIP_REQUIRE_VIRTUALENV=false pip3 "$@"
}


### Postgres
export PGDATA="/usr/local/var/postgres"


### VirtualEnvWrapper ###
# install virtualenvwrapper using `pip3 install virtualenvwrapper`
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export PROJECT_HOME="$HOME/Code"
source /usr/local/bin/virtualenvwrapper.sh


### XDG Configs pull directly from dotfiles ###
export XDG_CONFIG_HOME="$HOME/.dotfiles"
