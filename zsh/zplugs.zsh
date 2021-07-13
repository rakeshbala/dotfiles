if [[ "$NO_ZPLUG" != true ]]; then
    # Syntax highlighting bundle.
    zplug "zsh-users/zsh-syntax-highlighting"
    zplug "zsh-users/zsh-history-substring-search"
    zplug "zsh-users/zsh-completions"

    # Load the theme.
    #zplug "themes/bureau", from:oh-my-zsh
    #zplug bhilburn/powerlevel9k, from:github, as:theme
    zplug romkatv/powerlevel10k, from:github, as:theme, depth:1

    #my choices
    zplug "plugins/colored-man-pages", from:oh-my-zsh
    zplug "plugins/colorize", from:oh-my-zsh
    zplug "plugins/fasd", from:oh-my-zsh
    zplug "plugins/vi-mode", from:oh-my-zsh

    zplug "djui/alias-tips"
    zplug "zplug/zplug"

    # Tell zplug that you're done.
    zplug load
    if ! zplug check --verbose; then
        zplug install
    fi
fi


