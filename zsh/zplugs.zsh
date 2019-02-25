if [[ "$NO_ZPLUG" != true ]]; then
    # Syntax highlighting bundle.
    zplug "zsh-users/zsh-syntax-highlighting"
    zplug "zsh-users/zsh-history-substring-search"
    zplug "zsh-users/zsh-completions"
    #zplug "zsh-users/zsh-autosuggestions"
    #zplug "zsh-users/zsh-apple-touchbar"

    # Load the theme.
    #zplug "themes/bureau", from:oh-my-zsh
    #zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
    zplug bhilburn/powerlevel9k, from:github, as:theme

    #my choices
    zplug "plugins/colored-man-pages", from:oh-my-zsh
    zplug "plugins/colorize", from:oh-my-zsh
    zplug "plugins/fasd", from:oh-my-zsh
    zplug "plugins/vi-mode", from:oh-my-zsh
    zplug "plugins/docker", from:oh-my-zsh

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


