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

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Pipenv
export PIPENV_VENV_IN_PROJECT=1

# Each OS
case ${OSTYPE} in
  darwin*)
    # For Iterm2
    export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
    ;;
  linux*)
    # 256 color terminal
    export TERM="xterm-256color"

    # Intel MKL & MPI
    export MKL_ROOT_DIR=/opt/intel/mkl
    export MPI_ROOT_DIR=/opt/intel/mpi

    export LD_LIBRARY_PATH=$MKL_ROOT_DIR/lib/intel64:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=$MPI_ROOT_DIR/intel64/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=$MPI_ROOT_DIR/intel64/libfabric/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=/opt/intel/lib/intel64_lin:$LD_LIBRARY_PATH

    export LIBRARY_PATH=$MKL_ROOT_DIR/lib/intel64:$LIBRARY_PATH
    export LIBRARY_PATH=$MPI_ROOT_DIR/intel64/lib:$LIBRARY_PATH
    # Bazel
    export PATH=$HOME/bin:$PATH
    # Intel MKL-DNN
    export LD_LIBRARY_PATH=$HOME/opt/mkldnn/lib:$LD_LIBRARY_PATH
    ;;
esac
