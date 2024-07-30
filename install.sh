#!/usr/bin/env bash

# Install Oh-My-Zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Homebrew if on Mac
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install all of the homebrew stuff
#xargs brew install < leaves

# finally, see if you can install sdk man
curl -s "https://get.sdkman.io" | bash

# remind to install the nerd font
echo "You're going to have to install the nerd font!"
