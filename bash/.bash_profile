export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home"
export PATH="$PATH:~/bin"
export PATH="$PATH:~/Library/Android/sdk/platform-tools"
export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

#aliases
source ~/Projects/dotfiles/.aliases
alias vi="vim"
alias sbp="source ~/.bash_profile"
alias ebp="vi ~/.bash_profile"

#bash prompt
source ~/Projects/dotfiles/.bash_prompt
source ~/Projects/dotfiles/git-completion.bash
source ~/Projects/dotfiles/.b_profile

#vi mode
set -o vi

#Better cd
complete -d cd
##
# Your previous /Users/rakesh/.bash_profile file was backed up as /Users/rakesh/.bash_profile.macports-saved_2015-12-11_at_04:07:50
##

# MacPorts Installer addition on 2015-12-11_at_04:07:50: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

