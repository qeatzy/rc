
hfull := 1080
wfull := 1920
; x=.35
; v := x + 0
; MsgBox, %v%
; return
#=::
suspend permit
    ; InputBox, input, Resize, Height/width/x/y:, , 140, 130
    InputBox, input, Resize, Height/width/x/y:, , 140, 95
    input := trim(input)
        WinGetPos, xt,yt,wt,ht,A    ; t tmp
        xi := xt, yi := yt, wi := wt, hi := ht
; input:="x+3,y-4,h-8,w1920"
arr:=strsplit(input,[","," "])
nitem := arr.MaxIndex()
loop % arr.MaxIndex()
{
    item := arr[A_Index]
    if (strlen(item) < 2 && !instr("fxy",item)) {
        nitem -= 1
        continue
    }
    c1 := SubStr(item,1,1)
    c2 := SubStr(item,2,1)
    set := 0
    if ("0" <= c2 && c2 <= "9") {
        set := 1     ; MsgBox, %A_Index% %c1% %c2% %item%
    }
    if (c2 = "*" || c2 = "/") {
        value := SubStr(item,3)
    } else {
        value := SubStr(item,2) + 0
    }
    if (c1 = "h") {
        hi := (c2 = "." || c2 = "*") ? hi*value : (c2 = "/") ? hi/value : set ? value : hi + value
    } else if (c1 = "w") {
        wi := (c2 = "." || c2 = "*") ? wi*value : (c2 = "/") ? wi/value : set ? value : wi + value
    } else if (c1 = "x") {
        xi := (c2 = "") ? 0 : (c2 = "x") ? 1920-wi : (c2 = "c") ? (1920-wi)/2 :  set ? value : xi + value
    } else if (c1 = "y") {
        yi := (c2 = "") ? 0 : (c2 = "y") ? 1080-hi : (c2 = "c") ? (1080-hi)/2 :  set ? value : yi + value
    } else if (c1 = "c") { ; } else if (c1 = "c" && !set) {
        xi := xi + value
        wi := wi - 2 * value
    } else if (c1 = "d") {
        yi := yi + value
        hi := hi - 2 * value
    } else if (c1 = "f") {
        if (c2 = "w") {
            xi := 0, wi := 1920
        } else if (c2 = "h") {
            yi := 0, hi := 1080
        } else {
            xi := 0, yi := 0, wi := 1920, hi := 1080
        }
    } else {
    nitem -= 1
    }
    ; MsgBox, %A_Index% %c1% %c2% %item% value %value% size %xi% %yi% %wi% %hi% 
}
    if (input = "b") {
        xi := xt, yi := yt, wi := wt, hi := ht
        xt := xo, yt := yo, wt := wo, ht := ho
        xo := xi, yo := yi, wo := wi, ho := hi
        ; xo := xi, yo := yi, wo := wi, ho := hi
        ; xi := xo, yi := yo, wi := wo, hi := ho
        ; WinMove, A, , xi, yi, wi, hi
        WinMove, A, , xt, yt, wt, ht
    } else if (nitem) {
        ; xo := xi, yo := yi, wo := wi, ho := hi
        xo := xt, yo := yt, wo := wt, ho := ht
        xt := xi, yt := yi, wt := wi, ht := hi
        WinMove, A, , xt, yt, wt, ht
        ; MsgBox, %xo% %yo% %wo% %ho% new %xi% %yi% %wi% %hi% input %input% nitem %nitem%
    } else {
        MsgBox, %xi% %yi% %wi% %hi%
        return
    }
return

