#!/bin/bash

OSX_INSTALLS_DIR=$(dirname $0)

brew install $(<$OSX_INSTALLS_DIR/brew_packages)

# npm is installed alongside node in the brew packages
cat $OSX_INSTALLS_DIR/npm_packages | xargs npm install -g

# pip comes bundled with python (installed via brew).
# we can install other python versions later for specific projects using poetry.
pip install --user -r pip_packages

### installation commands for packages unavailable via brew

# install poetry to manage project-level python dependencies
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

