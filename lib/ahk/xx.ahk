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
ToolTip, NormalMode %NormalMode%
SetTimer, RemoveToolTip, -5000
NormalMode := !NormalMode
return

normal_j:
send j
return
normal_k:
send j
return
normal_h:
send j
return
normal_l:
send j
return






; normal_j:
; if NormalMode = 1 {
;     send {Down}
; } else NormalMode = 2 {
;     send {PgDn}
; }
; return
;
; normal_k:
; if NormalMode = 1 {
;     send {Up}
; } else NormalMode = 2 {
;     send {PgUp}
; }
; return
;
; normal_h:
; if NormalMode = 1 {
;     send {Left}
; } else NormalMode = 2 {
;     ; send {PgUp}
; }
; return
;
; normal_l:
; if NormalMode = 1 {
;     send {Right}
; } else NormalMode = 2 {
;     ; send {PgUp}
; }
; return
;
