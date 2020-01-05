
case $- in *i*)
[ -n "$zprof" ] && zmodload zsh/zprof
    source "$RCROOT/profile.interactive"
    source "$RCROOT/profile.interactive.zsh"
    [ -z "$platform" ] && read platform < "$RCROOT/platform"
    [ -n "$platform" ] && export platform && source "$RCROOT/profile.platform.$platform"
    for file in $RCROOT/fpath/[a-z]*(N.:t); do autoload -Uz $file; done
[ -n "$zprof" ] && zprof || :
esac

