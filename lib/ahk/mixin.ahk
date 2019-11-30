#SingleInstance Force

; "firefox
#IfWinActive, ahk_exe firefox.exe 
{
    ; h::send ^{PgUp}
    ; l::send ^{PgDn}
    ; m::send ^{PgUp}
    ; n::send ^{PgDn}
    ; f::send F   ; open link in new tab
    ; s::send S   ; go back one history
    x::send ^w
    +x::send ^+T
; Beginning_Python_Games_Development_[2e,
}


#IfWinActive, ahk_class SUMATRA_PDF_FRAME
{
    j::send {PgDn}
    k::send {PgUp}
    h::send ^+{Tab}
    l::send ^{Tab}
    d::send {PgDn}
    s::send {PgUp}
    ^j::send {Down}
    ^k::send {Up}
    ^t::send {F12}
    Down::send {PgDn}
    Up::send {PgUp}
    ^m::^y
    b::
    suspend permit
    send {PgUp}
    return
    +Space::
    suspend permit
    send {PgUp}
    return
}

#IfWinActive ahk_class mintty
    ^v::
    suspend permit
    send +{Insert}
    return

