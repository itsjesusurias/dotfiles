# Copy paste this file in bit by bit.
# Don't run it.

echo "Do not run this script in one go. Hit Ctrl-C NOW"
read -n 1

###############################################################################
# Backup old machine's dotfiles                                               #
###############################################################################

mkdir -p ~/migration/home
cd ~/migration

# then compare brew-list to what's in `brew.sh`
#   comm <(sort brew-list.txt) <(sort brew.sh-cleaned-up)

# let's hold on to these

mkdir -p ~/migration/home
cd ~/migration

# iTerm settings.
  # Prefs, General, Use settings from Folder

# Finder settings


###############################################################################
# XCode Command Line Tools                                                    #
###############################################################################

if ! xcode-select --print-path &> /dev/null; then

  # Prompt user to install the XCode Command Line Tools
  xcode-select --install &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Wait until the XCode Command Line Tools are installed
  until xcode-select --print-path &> /dev/null; do
    sleep 5
  done

  print_result $? 'Install XCode Command Line Tools'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Point the `xcode-select` developer directory to
  # the appropriate directory from within `Xcode.app`
  # https://github.com/alrra/dotfiles/issues/13

  sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
  print_result $? 'Make "xcode-select" developer directory point to Xcode'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Prompt user to agree to the terms of the Xcode license
  # https://github.com/alrra/dotfiles/issues/10

  sudo xcodebuild -license
  print_result $? 'Agree with the XCode Command Line Tools licence'

fi

###############################################################################
# nvm                                                                         #
###############################################################################

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

###############################################################################
# Homebrew                                                                    #
###############################################################################

. $HOME/dotfiles/install/brew.sh
. $HOME/dotfiles/install/brew-cask.sh


###############################################################################
# Z                                                                           #
###############################################################################

# github.com/rupa/z - hooked up in .zshrc
# consider reusing your current .z file if possible. it's painful to rebuild :)
# or use autojump instead https://github.com/wting/autojump
git clone https://github.com/rupa/z.git ~/z
chmod +x ~/z/z.sh


# my magic photobooth symlink -> dropbox. I love it.
#    + first move Photo Booth folder out of Pictures
#    + then start Photo Booth. It'll ask where to put the library.
#    + put it in Dropbox/public
#   * Now… you can record photobooth videos quickly and they upload to dropbox DURING RECORDING
#   * then you grab public URL and send off your video message in a heartbeat.


# for the c alias (syntax highlighted cat)
sudo easy_install Pygments

###############################################################################
# OSX defaults                                                                #
# https://github.com/hjuutilainen/dotfiles/blob/master/bin/osx-user-defaults.sh
###############################################################################

$HOME/dotfiles/osx/set-defaults.sh


###############################################################################
# Symlinks to link dotfiles into ~/                                           #
###############################################################################

$HOME/dotfiles/setup.sh
