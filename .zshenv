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

# Python Virtual
source $(pwd)/.venv/bin/activate

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
    
    # CUDA
    export CUDA_PATH=/usr/local/cuda-10.0
    export CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-10.0
    export PATH=/usr/local/cuda-10.0/bin:$PATH
    export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:$LD_LIBRARY_PATH

    # JupyterLab (and TensorBoard) on docker-compose
    export NB_UID=`id -u`

    # Intel MKL & MPI
    export MKL_ROOT_DIR=/opt/intel/mkl
    export MPI_ROOT_DIR=/opt/intel/mpi

    export LD_LIBRARY_PATH=$MKL_ROOT_DIR/lib/intel64:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=$MPI_ROOT_DIR/intel64/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=$MPI_ROOT_DIR/intel64/libfabric/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=/opt/intel/lib/intel64_lin:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=/usr/lib:$LD_LIBRARY_PATH

    export LIBRARY_PATH=$MKL_ROOT_DIR/lib/intel64:$LIBRARY_PATH
    export LIBRARY_PATH=$MPI_ROOT_DIR/intel64/lib:$LIBRARY_PATH

    # Intel MKL-DNN
    export LD_LIBRARY_PATH=$HOME/opt/mkldnn/lib:$LD_LIBRARY_PATH
    
    # BLAS and LAPACK
    export LD_LIBRARY_PATH=/opt/blas/lib:$LD_LIBRARY_PATH
    
    # OpenMP
    export OMP_NUM_THREADS=1
    
    # Other PATHs
    export PATH=$HOME/opt/bin:$PATH
    ;;
esac
