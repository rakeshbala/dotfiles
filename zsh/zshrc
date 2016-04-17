#antigen
#
source ~/Projects/dotfiles/zsh/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme bureau

#my choices
antigen bundle colored-man-pages
antigen bundle djui/alias-tips
antigen bundle colorize
antigen bundle autojump
antigen bundle supercrabtree/k
antigen bundle arzzen/calc.plugin.zsh
antigen bundle fasd

# Tell antigen that you're done.
antigen apply
#
# Created by newuser for 5.2
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home"
export PATH="$PATH:~/bin"
export PATH="$PATH:~/Library/Android/sdk/platform-tools"
export PATH=/usr/local/bin:$PATH #homebrew
export PATH="/usr/local/sbin:$PATH" #homebrew
export PATH="/opt/local/bin:/opt/local/sbin:$PATH" #mac ports


#aliases
source ~/Projects/dotfiles/.aliases

# Colorize a bunch of stuff
source "`brew --prefix`/etc/grc.bashrc"

#vi mode
set -o vi


# why would you type 'cd dir' if you could just type 'dir'?
 setopt AUTO_CD
#
 unsetopt CASE_GLOB

# # 10 second wait if you do something that will delete everything.  I wish I'd had this before...
 setopt RM_STAR_WAIT
#
# # use magic (this is default, but it can't hurt!)
#  setopt ZLE
#
 setopt NO_HUP
#
# # only fools wouldn't do this ;-)
 export EDITOR="vi"
#
# setopt IGNORE_EOF
#
# # If I could disable Ctrl-s completely I would!
# setopt NO_FLOW_CONTROL
#
# # Keep echo "station" > station from clobbering station
 setopt NO_CLOBBER
#
# # Case insensitive globbing
 setopt NO_CASE_GLOB
#
# # Be Reasonable!
 setopt NUMERIC_GLOB_SORT
#
# # I don't know why I never set this before.
 setopt EXTENDED_GLOB
#
# # hows about arrays be awesome?  (that is, frew${cool}frew has frew surrounding all the variables, not just first and last
# setopt RC_EXPAND_PARAM
#
# # Who doesn't want home and end to work?
 bindkey '\e[1~' beginning-of-line
 bindkey '\e[4~' end-of-line

# # Incremental search is elite!
 bindkey -M vicmd "/" history-incremental-search-backward
 bindkey -M vicmd "?" history-incremental-search-forward
#
# # Search based on what you typed in already
 bindkey -M vicmd "//" history-beginning-search-backward
 bindkey -M vicmd "??" history-beginning-search-forward
#
# bindkey "\eOP" run-help
#
# # oh wow!  This is killer...  try it!
 bindkey -M vicmd "q" push-line
#
# # it's like, space AND completion.  Gnarlbot.
 bindkey -M viins ' ' magic-space
 bindkey -M viins 'jj' vi-cmd-mode
#
# Compact completion
setopt listpacked
# Verify hist commands
setopt histverify

setopt ZLE

fortune -s | cowsay |lolcat


