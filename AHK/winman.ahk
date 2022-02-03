#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

; virtual desktops
#l::^#Right
#h::^#Left
#RButton::^#Right
#LButton::^#Left

; Window management

~LWin up::
    Send {LAlt Up}{LShift Up}
return

~LWin & j::
    Send {AltDown}{Tab}
return

~LWin & k:: 
    Send {LAlt Down}{LShift Down}{Tab}
return