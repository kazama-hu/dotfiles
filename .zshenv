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

# iTerm2
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

# colorls
source $(dirname $(gem which colorls))/tab_complete.sh

# For Iterm2
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
# OpenMP - OpenBLAS
export OPENBLAS_NUM_THREADS=4
export OMP_NUM_THREADS=4
