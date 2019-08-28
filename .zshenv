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

# Each OS
case ${OSTYPE} in
  darwin*)
    # For Iterm2
    export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
    ;;
  linux*)
    # 256 color terminal
    export TERM="xterm-256color"
    ;;
esac
