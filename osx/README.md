# osx

Config for setting up a Mac machine for work.

## How to install

1. [Change your default shell from zsh to bash](https://www.howtogeek.com/444596/how-to-change-the-default-shell-to-bash-in-macos-catalina/)
1. You'll obviously need `git` to clone this repository. You can install git by running `xcode-select --install` and following the installer.
1. Clone this repository.
1. Run `install.sh` to install anything installable via CLI.
1. Copy the contents of `home` to your home directory
1. Restart any active shell sessions to load the new Bash settings

## What gets installed?

We install the following things, in the order they appear in this list:

* Any brew packages listed in `brew_packages` are installed via `brew install`
* Brew casks in `brew_casks` are installed via `brew install --cask`
* Node modules in `npm_packages` are installed globally via `npm install -g`
* Python packages in `pip_packages` are installed for the current user via `pip install --user`.
  * This will ignore any settings you have configured to force the use of a virtualenv.
* Poetry is installed to manage project-specific Python versions and packages.
* Package Control is installed in Sublime Text.
* All Sublime Text packages in `sublime_packages` are added to Package Control's config, and will be installed the next time Sublime Text runs.
