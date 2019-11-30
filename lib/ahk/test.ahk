SetTitleMatchMode, RegEx

; TitleToSwitch := ["-bash","chrome","ahk_exe SumatraPDF.exe"]
TitleToSwitch := ["-bash","firefox"," - gvim"]
bash_first = 1
NormalMode := 0
WhichNormalMode = 1
ResizeMode := 0

#Include window.ahk

SendNormal(key_orig, key_1, key_2) {
global NormalMode, WhichNormalMode
if NormalMode {
    if (WhichNormalMode = 1) {
        Send % key_1
    } else if (WhichNormalMode = 2) {
        Send % key_2
    } else {
        Send Wrong
    }
    ; MsgBox % WhichNormalMode
} else {
    Send % key_orig
}
return
}

; ~LAlt up:: return
; ~LAlt:: return
; $LAlt up:: return
; $LAlt:: return

#e::
; MsgBox %ResizeMode%
; HotKey, j, off, UseErrorLevel
; HotKey, k, off, UseErrorLevel
; HotKey, h, off, UseErrorLevel
; HotKey, l, off, UseErrorLevel
if ResizeMode {
; gosub lable_h
; MsgBox turn off
HotKey, j, off, UseErrorLevel
HotKey, k, off, UseErrorLevel
HotKey, h, lable_h, off
HotKey, l, lable_l, off
; HotKey, h, off, UseErrorLevel
; HotKey, l, off, UseErrorLevel
HotKey, `,, off, UseErrorLevel
HotKey, `., off, UseErrorLevel
} else {
; gosub lable_l
; MsgBox turn on
HotKey, j, lable_j, on
HotKey, k, lable_k, on
HotKey, h, lable_h, on
HotKey, l, lable_l, on
HotKey, `,, lable_comma, on
HotKey, `., lable_dot, on
}
ResizeMode := !ResizeMode
return

lable_comma:
WinGetPos, x, y, w, h, A
x := x+50
; x := 0
w := w-50
WinMove, A, , x, y, w, h
return

lable_dot:
WinGetPos, x, y, w, h, A
w := w+50
WinMove, A, , x, y, w, h
return

lable_j:
WinGetPos, x, y, w, h, A
y := y+50
WinMove, A, , x, y
return

lable_k:
WinGetPos, x, y, w, h, A
y := y-50
WinMove, A, , x, y
return

lable_h:
WinGetPos, x, y, w, h, A
x := x-50
WinMove, A, , x, y
return

lable_l:
WinGetPos, x, y, w, h, A
x := x+50
WinMove, A, , x, y
return



#p::
; !p::
; SelectTmuxWindow()
; return

RemoveToolTip:
ToolTip
return

#q::
if NormalMode {
    HotKey, j, off, UseErrorLevel
        HotKey, k, off, UseErrorLevel
        HotKey, h, off, UseErrorLevel
        HotKey, l, off, UseErrorLevel
} else {
    HotKey, j, normal_j, on
        HotKey, k, normal_k, on
        HotKey, h, normal_h, on
        HotKey, l, normal_l, on
}
NormalMode := !NormalMode
ToolTip, NormalMode %NormalMode%
SetTimer, RemoveToolTip, -5000
return

normal_j:
if (NormalMode = 1) {
    send {Down}
} else if (NormalMode = 2) {
    send {PgDn}
}
return

normal_k:
if (NormalMode = 1) {
    send {Up}
} else if (NormalMode == 2) {
    send {PgUp}
}
return

normal_h:
if (NormalMode = 1) {
    send {Left}
} else if (NormalMode = 2) {
    ; send {PgUp}
}
return

normal_l:
if (NormalMode = 1) {
    send {Right}
} else if (NormalMode = 2) {
    ; send {PgUp}
}
return

; normal_j:
; send j
; return
; normal_k:
; send j
; return
; normal_h:
; send j
; return
; normal_l:
; send j
; return

; works after type win+Tab, and explorer
; $j::SendNormal("j", "{Down}", "{PgDn}")
; $k::SendNormal("k", "{Up}", "{PgUp}")
$^j::SendNormal("^j", "{WheelUp 1}", "{Down}")
$^k::SendNormal("^k", "{WheelUp 1}", "{Up}")
; $h::SendNormal("h", "{Left}")
; $l::SendNormal("l", "{Right}")

; $h::
; ; send !d9
; send !d:selectw -t 11{Enter}
; return

; not work, maybe reset by app?
~!o::
; WinGetActiveTitle, OldTitle
Input, OutputVar, L10 M, {Enter};{Esc}
; WinSetTitle, %OldTitle%, %OutputVar%
WinSetTitle, %OutputVar%
MsgBox %OutputVar%
return

!i::
#i::
Suspend permit
; Input, OutputVar, L10 M V, {Enter}.{Esc}
Input, OutputVar, L10 M, {Enter};{Esc}
; MsgBox %OutputVar%
if (OutputVar = "r") {
    Reload  ; https://autohotkey.com/docs/commands/Reload.htm
; } else if {
} else if (OutputVar = "s") {
    Suspend
} else if (RegExMatch(OutputVar, "^m([12])$", Match)) {
    WhichNormalMode := Match1
    MsgBox % WhichNormalMode
} else if (RegExMatch(OutputVar, "^([1-3])[= ](.*)", Match)) {
    TitleToSwitch[Match1] := Match2
    MsgBox %Match1% %Match2%
} else if (RegExMatch(OutputVar, "^[01]$", Match)) {
    bash_first := OutputVar
} else {
    WinActivateBottom i)%OutputVar%
}
return

!0::WinActivate ahk_exe mintty.exe
!1::WinActivate ahk_exe firefox.exe
!2::WinActivate ahk_exe gvim.exe
!8::WinActivate ahk_exe NutstoreClient.exe
!3::
WinActivate i)chrome
; t2 =  % "i)" . TitleToSwitch[2]
;     WinActivate %t2%
return

!j::
Suspend permit
; Input, OutputVar, L10 M, {Enter};{Esc}
if bash_first {
; MsgBox %bash_first%
t1 = % "i)" . TitleToSwitch[1]
t2 =  % "i)" . TitleToSwitch[2]
} else {
t2 = % "i)" . TitleToSwitch[1]
t1 =  % "i)" . TitleToSwitch[2]
}
IfWinNotActive %t1%
{
    WinActivate %t1%
}
else
{
    WinActivate %t2%
}
return
; IfWinNotActive i) {
;
WinGetTitle, text, A
MsgBox %text%
return

; !k::SelectTmuxWindow()
!k::
Suspend permit
; Input, OutputVar, L10 M, {Enter};{Esc}
if bash_first {
t1 = % "i)" . TitleToSwitch[1]
t2 =  % "i)" . TitleToSwitch[3]
} else {
t2 = % "i)" . TitleToSwitch[1]
t1 =  % "i)" . TitleToSwitch[3]
}
IfWinNotActive %t1%
{
    WinActivate %t1%
}
else
{
    WinActivate %t2%
}
return
; IfWinNotActive i) {
;
WinGetTitle, text, A
MsgBox %text%
return



SelectTmuxWindow() {
Input, OutputVar, L10 M, {Enter};{Esc}
 if (RegExMatch(OutputVar, "^\d*$")) {
    OutputVar := (OutputVar = "") ? "!" : OutputVar
    run E:/cygwin64/bin/tmux.exe selectw -t %OutputVar%,,Hide
    return
}
fileRead, TmuxWindows, E:/cygwin64/home/zyq3e/xx
pat =  m`n)^(\d+) (.*%OutputVar%)
if (RegExMatch(TmuxWindows, pat, Match)) {
    ; MsgBox %OutputVar% %pat% {%Match%} [%Match1%] run E:/cygwin64/bin/tmux.exe selectw -t 9,,Hide[%Match2%]
    ; MsgBox % TmuxWindows
    run E:/cygwin64/bin/tmux.exe selectw -t %Match1%,,Hide
}
return
; Loop, Read, E:/cygwin64/home/zyq3e/xx
; {
; kv := StrSplit(A_LoopReadLine, " ")
; MsgBox % kv[1]
; }
}

; !k::
; Input, OutputVar, L10 M, {Enter};{Esc}
; if (RegExMatch(OutputVar, "^$", Match)) {
;     Value := TitleToSwitch[1]
;     ; MsgBox %Value%
;     ; MsgBox %Value%
;     MsgBox % TitleToSwitch[1] " " TitleToSwitch[2]
; } else if (RegExMatch(OutputVar, "^([12])[= ](.*)", Match)) {
;     TitleToSwitch[Match1] := Match2
;     MsgBox %Match1% %Match2%
; }
; return
; ; ToolTip hi fred
; ; MsgBox hello

!e::
WinGetClass, cls, A
WinActivateBottom, ahk_class %cls%
return

#o::    ; toggle below max and restore. from https://superuser.com/a/403017/487198
suspend permit
WinGet, MX, MinMax, A
if MX
WinRestore, A
else WinMaximize, A
return

; ahk_class Qt5QWindowIcon ahk_exe calibre.exe
; ahk_class Qt5QWindowIcon ahk_exe calibre-parallel.exe
; "calibre ebook-viewer, slow start.
; "epub, see "" fm
; #IfWinActive ahk_class Qt5QWindowIcon ahk_exe calibre-parallel.exe
; #IfWinActive ahk_class Qt5QWindowIcon ahk_exe ebook-viewer.exe
#IfWinActive ahk_class Qt5QWindowIcon ahk_exe calibre-parallel.exe
{
    !e::
    suspend permit
    WinActivateBottom ahk_exe calibre-parallel.exe
    return
    h::send {Home}  ; Chapter Begin
    l::send {End}   ; Chapter End
    t::send ^t      ; hide|show sidebar
    d::send j
    s::send k
    ^o::send !{Left}
    ^h::send ^{F11}
    ^g::
    {
    send ^{F11}
    click 46,22
    sleep 50
    send ^A
    }
    space::send j
    !space::send k
    +space::send k
} ; calibre ebook-viewer

#IfWinActive ahk_exe SumatraPDF.exe
; LAlt:: return
; ~LAlt up:: return
    j::send {PgDn}
    k::send {PgUp}
l::
    ; suspend permit
    send ^{Tab}
    return
h::
    ; suspend permit
    send ^+{Tab}
    return
x::send ^w


#IfWinActive 
    ^v::
    suspend permit
    send +{Insert}
    return

; test.ahk ahk_exe AutoHotkey.exe
