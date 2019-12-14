
case $- in *i*)
[ -n "$zprof" ] && zmodload zsh/zprof
    source "$RCROOT/profile.interactive"
    source "$RCROOT/profile.interactive.zsh"
[ -n "$zprof" ] && zprof || :
esac

