source $DOTFILEDIR/zsh/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

# Load the theme.
source $DOTFILEDIR/zsh/$(platform_get).theme

#my choices
antigen bundle colored-man-pages
antigen bundle djui/alias-tips
antigen bundle colorize
antigen bundle arzzen/calc.plugin.zsh
antigen bundle fasd
antigen bundle vi-mode

# Tell antigen that you're done.
antigen apply
#
