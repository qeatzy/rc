
stty -ixon # on cygwin, without this, ctrl-q not work, in both bash and vim.
           # https://github.com/mintty/mintty/wiki/Tips
case $- in *i*)
    source "$RCROOT/profile.interactive"
    source "$RCROOT/profile.interactive.bash"
    [ -z "$platform" ] && read -n 10 platform < "$RCROOT/platform"
    [ -n "$platform" ] && export platform && source "$RCROOT/profile.platform.$platform"
esac

