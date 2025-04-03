
echo
echo zshenv before
echo "$PATH"

if [[ -v ZPROFILE_LOADED ]]; then

	case "$(uname -m)" in
		"arm64")
			echo Apple
			HOMEBREW_PREFIX="/opt/homebrew"
			HOMEBREW_RUBY_PATH="$HOMEBREW_PREFIX/opt/ruby"
			;;
		"x86_64")
			echo Intel
			HOMEBREW_PREFIX="/usr/local"
			HOMEBREW_RUBY_PATH="$HOMEBREW_PREFIX/opt/ruby"
			;;
	esac

	# export PATH="$HOMEBREW_PREFIX/bin:$PATH"
	export LDFLAGS="-L$HOMEBREW_RUBY_PATH/lib"
	export CPPFLAGS="-I$HOMEBREW_RUBY_PATH/include"
	export PKG_CONFIG_PATH="$HOMEBREW_RUBY_PATH/lib/pkgconfig"

	echo
	echo zshenv after1
	echo "$PATH"

	if [[ -x "$HOMEBREW_PREFIX/bin/brew" ]]; then
		eval "$("$HOMEBREW_PREFIX/bin/brew" shellenv)"
	fi

	echo
	echo zshenv after2
	echo "$PATH"

fi