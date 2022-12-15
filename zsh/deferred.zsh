# Use null plugin to run commands asynchronously. Work-around for https://github.com/zdharma/zplugin/issues/68
# Faster and non-interactive version of `zplugin create null`
#_null_plug_dir=${ZPLGM[PLUGINS_DIR]}/_local---null
#_null_plug_dir=$HOME/.zinit/plugins/_local---null
#if [[ ! -d $_null_plug_dir ]]; then
  #echo "Creating zplugin 'null' plugin directory at: $_null_plug_dir"
  #mkdir -p -- "$_null_plug_dir"
#fi
#unset _null_plug_dir


# Run these slow commands asynchronously via null plugin
__zplg_async_run () {

   source "$HOME/.dotfile_local/zshrc.local" 2>/dev/null

   # Colorize a bunch of stuff
   source "`brew --prefix`/etc/grc.bashrc"

   #iterm integration
   test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
}


# Run commands in __zplg_async_run asynchronously
zplugin ice wait'0' lucid atload'__zplg_async_run'
zplugin light zdharma-continuum/null  # create with `zplugin create null`, see https://github.com/zdharma/zplugin/issues/68
