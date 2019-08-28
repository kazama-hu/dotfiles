#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

case ${OSTYPE} in
  darwin*)
    export CFLAGS="-I$(brew --prefix openssl)/include:$CFLAGS"
    export LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix sqlite3)/lib:$LDFLAGS"
    export CPPFLAGS="-I$(brew --prefix sqlite3)/include:$CPPFLAGS"
    ;;
esac
