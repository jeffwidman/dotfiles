# This explains the difference between .profile, .bash_profile, and .bashrc--be sure to read the comments:
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

# If on OS X:
if [[ $OSTYPE == darwin* ]]; then
    # Tell compilers we have a 64 bit architecture
    export ARCHFLAGS="-arch x86_64"
    # Ensure Homebrew binaries take precedence
    export PATH=/usr/local/bin:/usr/local/sbin:"$PATH"
fi


# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# create syspip workaround
syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
syspip3(){
   PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}


### Postgres
export PGDATA="/usr/local/var/postgres"


### VirtualEnvWrapper ###
export PROJECT_HOME="$HOME/Code"
# The variable $VIRTUALENVWRAPPER_VIRTUALENV_ARGS tells
# virtualenvwrapper what arguments to pass to virtualenv.
# export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=''
source /usr/local/bin/virtualenvwrapper.sh
