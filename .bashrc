# If not running interactively, don't do anything.
[ -z "$PS1" ] && return
case $- in
    *i*) ;;
      *) return;;
esac

# More possible paths with executables.
export PATH=/opt/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH

# Paths with extra libraries.
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# Some programs look for a default editor.
export EDITOR="nano"

# Stuff to do when starting Python.
export PYTHONSTARTUP=~/.pythonrc

# Personal TeX resources will be here.
export TEXMFHOME=~/.texmf-var

# Increase history, and don't put duplicate lines in the history. See bash(1) for more options.
export HISTCONTROL=ignoredups
export HISTSIZE=55000
export HISTFILESIZE=99000

# Append to the history file, don't overwrite it.
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files.
# See lesspipe(1) for details.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Support more colors in the terminal if possible. Not the question mark
# there, since Ubuntu will use a plus instead of a dash in terminfo.
if [ -e /usr/share/terminfo/x/xterm?256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

# Set variable identifying the chroot you work in (used in the prompt below).
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set a fancy prompt.
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir format.
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Enable color support, add color-enabled alias for ls, and define more colors.
if [ "$TERM" != "dumb" ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tbz=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.xz=01;31:*.deb=01;31:*.rpm=01;31:*.jpg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.png=01;35:*.mpg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.mp4=01;35:"
fi

# Better safe than sorry.
alias cp='cp -riv'
alias ms='mv -iv'
alias rm='rm -riv'

# Other useful aliases.
alias ds='du -h --max-depth=1'
alias l='ls'
alias la='l -a'
alias ll='l -lh'
alias lla='l -lha'
alias lsa='ls -ha'
alias lsl='ls -lh'
alias lsla='ls -lha'
alias cpf='cp -rvf'
alias mvf='mv -vf'
alias rmf='rm -rvf'

# Catching the Nth line from a stream.
get_line_row() {
  sed "${1}q;d" | awk "{ print $ $2 }"
}
alias glr=get_line_row

# Include any additional alias definitions.
[[ -r ~/.bash_aliases ]] && . ~/.bash_aliases

# Include private settings if the file exists.
[[ -r ~/.bash_private ]] && . ~/.bash_private
