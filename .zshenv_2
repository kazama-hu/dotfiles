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

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Each OS
case ${OSTYPE} in
  darwin*)
    # For Iterm2
    export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
    ;;
  linux*)
    # 256 color terminal
    export TERM="xterm-256color"

    # CUDA
    export CUDA_PATH=/usr/local/cuda-10.0
    export CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-10.0
    export PATH=/usr/local/cuda-10.0/bin:$PATH
    export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:$LD_LIBRARY_PATH

    # BLAS and LAPACK
    export LD_LIBRARY_PATH=/opt/blas/lib:$LD_LIBRARY_PATH

    # OpenMP
    export OMP_NUM_THREADS=1

    # Other PATHs
    export PATH=$HOME/opt/bin:$PATH
    ;;
esac
