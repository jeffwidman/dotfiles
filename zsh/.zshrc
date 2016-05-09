#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...


### VirtualEnv ###
# pip should only run if there is a virtualenv currently activated
# prevents accidentally installing packages without a virtualenv
export PIP_REQUIRE_VIRTUALENV=true
# create syspip workaround
syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
syspip3(){
   PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}


### Use Base16 templating system to theme shell colors ###
# if [[ -s "$HOME/.config/base16-shell/base16-ocean.dark.sh" ]]; then
#   source "$HOME/.config/base16-shell/base16-ocean.dark.sh"
# fi


### Extra ZSH options ###
# If querying the user before executing `rm *' or `rm
# path/*', first wait ten seconds and ignore anything typed
# in that time. This avoids the problem of reflexively
# answering `yes' to the query when one didn't really mean
# it.
setopt RM_STAR_WAIT
