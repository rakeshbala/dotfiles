# load zgen
source "${HOME}/.zgen/zgen.zsh"
# if the init scipt doesn't exist
if ! zgen saved; then

    # specify plugins here
    zgen oh-my-zsh
    zgen plugin/colored-man-pages
    zgen plugin/djui/alias-tips
    zgen plugin/colorize
    zgen plugin/fasd
    zgen plugin/vi-mode


    zgen load arzzen/calc.plugin.zsh

    # generate the init script from plugins above
    zgen save
fi
