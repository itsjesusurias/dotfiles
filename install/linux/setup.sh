###############################################################################
# apps                                                                        #
###############################################################################

. $HOME/dotfiles/install/linux/apps.sh

###############################################################################
# Z                                                                           #
###############################################################################

# github.com/rupa/z - hooked up in .zshrc
# consider reusing your current .z file if possible. it's painful to rebuild :)
# or use autojump instead https://github.com/wting/autojump
git clone https://github.com/rupa/z.git ~/z
chmod +x ~/z/z.sh

#General setup
. $HOME/dotfiles/install/general/setup.sh