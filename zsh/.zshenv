#
# Defines environment variables.
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# WARNING: On macOS, `path_helper` is a helper that is called _after_ loading this.
# However, in addition to helpful things, it also will re-order the contents of $PATH...
# So any changes to $PATH to ordering should **not** go in here.
# Details: https://gist.github.com/Linerre/f11ad4a6a934dcf01ee8415c9457e7b2
