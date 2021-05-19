#!/bin/bash

OSX_INSTALLS_DIR=$(dirname $0)

mkdir -p $OSX_INSTALLS_DIR/tmp

# install homebrew if necessary
if [ ! -f "$(which brew)" ]; then
    # command sourced from https://brew.sh/
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install $(<$OSX_INSTALLS_DIR/brew_packages)
brew install --cask $(<$OSX_INSTALLS_DIR/brew_casks)

# npm is installed alongside node in the brew packages
cat $OSX_INSTALLS_DIR/npm_packages | xargs npm install -g

# pip comes bundled with python (installed via brew).
# we can install other python versions later for specific projects using poetry.
PIP_REQUIRE_VIRTUALENV=false pip install --user -r $OSX_INSTALLS_DIR/pip_packages

# install poetry to manage project-level python dependencies
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

# try to install Package Control automatically in sublime, if we can
SUBL_INSTALLED_DIR="$HOME/Library/Application Support/Sublime Text 3"
SUBL_PACKAGES_DIR="$SUBL_INSTALLED_DIR/Installed Packages"
SUBL_PACKAGE_CONFIG_DIR="$SUBL_INSTALLED_DIR/Packages/User"
if [ -d "$SUBL_PACKAGES_DIR" ]; then
    if [ ! -f "$SUBL_PACKAGES_DIR/Package Control.sublime-package" ]; then
        # directly download package control into sublime if it's not there already
        curl https://packagecontrol.io/Package%20Control.sublime-package > "$SUBL_PACKAGES_DIR"
    fi

    PACKAGE_CONTROL_CONFIG_FILE="$SUBL_PACKAGE_CONFIG_DIR/Package Control.sublime-settings"
    if [ -f "$PACKAGE_CONTROL_CONFIG_FILE" ]; then
        # if there's already a package control settings file, we want to merge our packages into it
        # so they'll be installed there.
        jq -sf "$OSX_INSTALLS_DIR/support/add_packages_to_package_control.jq" \
               "$PACKAGE_CONTROL_CONFIG_FILE" \
               "$OSX_INSTALLS_DIR/sublime_packages" > "$PACKAGE_CONTROL_CONFIG_FILE"
    else
        # no package control settings, so we just toss in our package list directly
        cp "$OSX_INSTALLS_DIR/sublime_packages" "$PACKAGE_CONTROL_CONFIG_FILE"
    fi
else
    echo "Sublime's package directory isn't where we expected ($SUBL_PACKAGES_DIR)."
    echo "Skipping installation of Package Control."
    echo "Manual install instructions can be found on the Package Control site at https://packagecontrol.io/installation"
fi
