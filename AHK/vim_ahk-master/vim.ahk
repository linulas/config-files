; Auto-execute section
VimGroup := "ahk_exe chrome.exe,ahk_exe firefox.exe, ahk_exe typora.exe, ahk_exe brave.exe"
Vim := new VimAhk()
Return

#Include %A_LineFile%\..\lib\vim_ahk.ahk
