#
# Executes commands at login post-zshrc.
#

# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

# Execute code only if STDERR is bound to a TTY.
[[ -o INTERACTIVE && -t 2 ]] && {

  # # Print a random, hopefully interesting, adage.
  # if (( $+commands[fortune] )); then
  #   fortune -s
  #   print
  # fi

  # TODO: Print a random bible verse by mod'ing fortune or something else
  # ala http://www.pc-freak.net/blog/print-daily-bible-quote-shell-login-fortune-bible-mod-gnu-linux/

} >&2
