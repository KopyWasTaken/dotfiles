# Exports and stuff
export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"
export CLICOLOR=1
export EDITOR='nvim'

# This links homebrew libs (such as SDL)
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

# Useful for working with git
gush() {
	git add .
	git commit -m "$1"
	git push
}
