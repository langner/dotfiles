# If not running interactively, don't do anything.
[ -z "$PS1" ] && return

# Don't put duplicate lines in the history. See bash(1) for more options.
export HISTCONTROL=ignoredups
export HISTFILESIZE=99000

# Split output only by newlines.
#export IFS=$'\n'

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files.
# See lesspipe(1) for details.
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# Set variable identifying the chroot you work in (used in the prompt below).
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set a fancy prompt.
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# if this is an xterm set the title to user@host:dir format.
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Enable color support of ls and also add handy aliases.
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias l='ls --color=yes'
    export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tbz=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jpg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.png=01;35:*.mpg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.mp4=01;35:"
fi

# Better safe than sorry.
alias cp='cp -riv'
alias ms='mv -iv'
alias rm='rm -riv'

# Other common aliases I use.
alias ds='du -h --max-depth=1'
alias la='l -a'
alias ll='l -l'
alias lla='l -la'
alias lsa='ls -a'
alias lsl='ls -l'
alias lsla='ls -la'
alias cpf='cp -rvf'
alias mvf='mv -vf'
alias rmf='rm -rvf'

# Paths with executables.
export PATH=/opt/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH

# Paths with extra libraries.
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# Some programs look for a default editor.
export EDITOR="nano"

# Stuff to do when starting Python.
export PYTHONSTARTUP=~/.pythonrc

# Include private settings if it exists.
[[ -r ~/.bash_private ]] && . ~/.bash_private
