setopt promptsubst

#zinit light romkatv/zsh-defer

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit wait lucid for \
    atinit"zicompinit; zicdreplay"  \
        zsh-users/zsh-history-substring-search \
        zdharma-continuum/fast-syntax-highlighting \
        OMZP::colored-man-pages \
        OMZP::colorize \
        OMZP::fasd \
        OMZP::vi-mode \
        djui/alias-tips \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions


#zinit light zsh-users/zsh-history-substring-search
#zinit light zdharma/fast-syntax-highlighting
#zinit snippet OMZP::colored-man-pages
#zinit snippet OMZP::colorize
#zinit snippet OMZP::fasd
#zinit snippet OMZP::vi-mode
#zinit light djui/alias-tips
