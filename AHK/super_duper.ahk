; Handle super-duper mode -----------------------
$d::
	superIsDown := GetKeyState("s", "P")
	if(superIsDown == 1) {
		super_duper = true
		KeyWait s
	} else {
		Send d
	}
	super_duper = false;
return

$s::
	Sleep 25
	duperIsDown := GetKeyState("d", "P")
	if(duperIsDown == 1) {
		super_duper = true
		KeyWait d
	} else {
		Send s
	}
	super_duper = false;
return

; Add keymaps -----------------------------------

; Vim arrow keys
$j::
	if(super_duper == "true")
		Send {Down}
	else
		Send j 
return

$k::
	if(super_duper == "true")
		Send {Up}
	else
		Send k 
return

$h::
	if(super_duper == "true")
		Send {Left}
	else
		Send h 
return

$l::
	if(super_duper == "true")
		Send {Right}
	else
		Send l 
return

; Tabbing
$i::
	if(super_duper == "true") {
		Send {CtrlDown}{ShiftDown}{Tab}
		Send {ShiftUp}
		Send {CtrlUp}
	}
	else     
		Send i
return

$o::
	if(super_duper == "true") {
		Send {CtrlDown}{Tab}
		Send {CtrlUp}
	}
	else
		Send o 
return

; Modkeys
; $f::
; 	if(super_duper == "true") {
; 		Send {CtrlDown}
; 		KeyWait s
; 	}
; return

; f up::
; 	Send {CtrlUp}
; return

; $a::
; 	if(super_duper == "true") {
; 		Send {AltDown}
; 	}
; 	else
; 		Send a
; return

; ~a up::
; 	Send {AltUp}
; return

; $Space::
; 	if(super_duper == "true") {
; 		Send {ShiftDown}
; 	}
; 	else
; 		Send {Space} 
; return

; ~Space up::
; 	Send {ShiftUp}
; return