if [[ "$NO_ZPLUG" != true ]]; then
    export ZPLUG_HOME="$HOME/.zplug"
    source $ZPLUG_HOME/init.zsh

    # Syntax highlighting bundle.
    zplug "zsh-users/zsh-syntax-highlighting"
    zplug "zsh-users/zsh-history-substring-search"

    # Load the theme.
    zplug "themes/bureau", from:oh-my-zsh

    #my choices
    zplug "plugins/colored-man-pages", from:oh-my-zsh
    zplug "plugins/colorize", from:oh-my-zsh
    zplug "plugins/fasd", from:oh-my-zsh
    zplug "plugins/vi-mode", from:oh-my-zsh

    zplug "arzzen/calc.plugin.zsh"
    zplug "djui/alias-tips"
    zplug "zplug/zplug"

    # Tell zplug that you're done.
    zplug load
    #
    if ! zplug check; then
        zplug install
    fi
fi


