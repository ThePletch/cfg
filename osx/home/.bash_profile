############
#
# User customization file for bash
#
############

# Prepend user's bin directory to path
PATH=$HOME/bin:$PATH

source "$HOME/.bash.d/*"
# add GODEBUG setting to fix known issue with AWS terraform provider
export GODEBUG=asyncpreemptoff=1;
