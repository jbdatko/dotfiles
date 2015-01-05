# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gentoo"

# aliases are in .aliases to maintain consistency in zsh and bash
source ~/.aliases

#just for fun, but only in interactive shells
if [[ -o interactive && -t 0 ]]; then
    fortune
    # Get the number of CryptoCapes
    alias getccq='python ~/bin/get_cc_quantity.py'
fi


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git svn screen colored-man gpg-agent autojump brew debian pip ssh-agent osx)

source $ZSH/oh-my-zsh.sh
source ~/.shellrc

# Customize to your needs...
export PATH=$PATH:~/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/sbin:/usr/games:/usr/textbin

bindkey '\C-w' kill-region

setopt autocd notify incappendhistory histignoredups extendedhistory autopushd
setopt pushdminus pushdsilent pushdtohome extendedglob

#Report time for commands longer than 10 seconds
REPORTTIME=10


# functions
gentags(){
    echo ***/(*.h|*.c|*.cpp|*.cc) | xargs etags
}

# AVR dude command for the pocket program.  Just specify the file
pp(){
    sudo avrdude -c usbtiny -B 1 -p atmega328p -U flash:w:$1 -v
}


dragon(){
    avrdude  -v -v -v -v -patmega328p -cdragon_isp -Pusb -Uflash:w:$1:i
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# BeagleBone Black Stuff

# .zshrc ends here
