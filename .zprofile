echo
echo zprofile before
echo "$PATH"

export GEM_HOME="$HOME/.gem"
export PATH="$GEM_HOME/bin:$PATH"

echo
echo zprofile after
echo "$PATH"

export ZPROFILE_LOADED="$(date -u +'%Y-%m-%dT%H:%M:%SZ')"
source .zshenv