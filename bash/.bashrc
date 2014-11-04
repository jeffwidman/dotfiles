# This explains the difference between .profile, .bash_profile, and .bashrc--be sure to read the comments:
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

# If on OS X:
if [[ $OSTYPE == darwin* ]]; then
    # Tell compilers we have a 64 bit architecture
    export ARCHFLAGS="-arch x86_64"
    # Ensure Homebrew binaries take precedence
    export PATH=/usr/local/bin:/usr/local/sbin:"$PATH"
fi

### VirtualEnv
# virtualenv should use Distribute instead of legacy setuptools
export VIRTUALENV_DISTRIBUTE=true

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# create syspip workaround
syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
syspip3(){
   PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}

### VirtualEnvWrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Code/git
source /usr/local/bin/virtualenvwrapper.sh

### RVM
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Add RVM Bash Completion
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
# FYI: This works fine, but RVM complains that it can't
# verify it's the first item in path... fix here:
# https://github.com/wayneeseguin/rvm/issues/2337#issuecomment-27725675

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

### Postgres
export PGDATA="/usr/local/var/postgres"
