#!/usr/bin/env bash
#
#
set -o errexit -o pipefail 
# set -x
WORKDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" || exit; pwd -P)
export PROMPT_COMMAND=bananas
#
##############################################################################
#
# Load some utilities
#
readonly THE_UTILS=( "common" )

for utility in "${THE_UTILS[@]}"; do
  if [[ -r "${WORKDIR}/utils_${utility}.sh" ]]; then
    source "${WORKDIR}/utils_${utility}.sh"
  fi
done
#
##############################################################################
#
# Desired python version
#
export PYENV_VERSION=2.7.13
#
##############################################################################
#
# pyenv
#
if $(command -v pyenv >/dev/null); then
  eval "$(pyenv init -)"
else
  puterr "pyenv not installed"
  brew install pyenv

  if $(command -v pyenv >/dev/null); then
    putsuccess "pyenv installed"
    eval "$(pyenv init -)"
  else
    puterr "pyenv not installed"
    exit 1
  fi
fi
#
##############################################################################
#
# virtualenv
#
if $(command -v pyenv-virtualenv-init >/dev/null); then
  eval "$(pyenv virtualenv-init -)"
else
  puterr "virtualenv not installed"
  brew install pyenv-virtualenv

  if $(command -v pyenv-virtualenv-init >/dev/null); then
    putsuccess "virtualenv installed"
  else
    puterr "virtualenv not installed"
    exit 1
  fi
fi

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv install --skip-existing $PYENV_VERSION
if $(pyenv versions --bare | grep python-local-${PYENV_VERSION} &> /dev/null); then
  putsuccess "virtual environment 'python-local-${PYENV_VERSION}' already exists."
else
  pyenv virtualenv $PYENV_VERSION python-local-${PYENV_VERSION}
fi
pyenv shell python-local-${PYENV_VERSION}
pyenv which pip

pip install -r "${WORKDIR}/../pip.txt"
