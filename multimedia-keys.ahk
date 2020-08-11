AppsKey & a::
send, ä
return

#If Getkeystate("AppsKey","p")
Shift & a::send Ä
return

AppsKey & i::
send, ï
return

#If Getkeystate("AppsKey","p")
Shift & I::
send, Ï
return

AppsKey & o::
send, ö
return

#If Getkeystate("AppsKey","p")
Shift & O::
send, Ö
return

AppsKey & s::
send, ß
return

AppsKey & u::
send, ü
return

#If Getkeystate("AppsKey","p")
Shift & U::
send, Ü
return

#If
#n::
run, notepad
return

#s::
DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
return

;Mouse buttons
XButton2::send,{Volume_Up}
XButton1::send,{Volume_Down}

#F1::
send, {Media_Play_Pause}
return

#F2::
send, {Media_Prev}
return

#F3::
send, {Media_Next}
return

#F4::
send, {Volume_Mute}
return

#F5::
send, {Volume_Down}
return

#F6::
send, {Volume_Up}
return

#F9::
Run, calc ;Launches calculator
return

toggle=0

#F10::
autoclick:=!autoclick
return

~$*LButton::
While (GetKeyState("Lbutton", "P") and autoclick){
    Click
    Sleep 4
}
return

~$*RButton::
While (GetKeyState("Rbutton", "P") and autoclick){
    Click, right
    Sleep 4
}
return

disableMousePS := "C:\Scripts\disable-mouse.ps1"

#F11::
RunWait, PowerShell.exe -File C:\Scripts\disable-mouse.ps1
;Run PowerShell.exe "%disableMousePS%"
return

helpVisible=0

#F12::
helpVisible:=!helpVisible
If helpVisible
{
	helpText =
(
F1: Play/Pause
F2: Previous
F3: Next
F4: Toggle Mute
F5: Volume Down
F6: Volume Up
F9: Calculator
F10: Toggle Auto-Clicker
F12: Toggle Help
Pause: Task Manager
)
	Gui +LastFound +AlwaysOnTop -Caption +ToolWindow
	GuiHelpId := WinExist()
	Gui, Color, Default, Default
	Gui, Font, s14
	Gui, Add, Text,, %helpText%
	WinSet, Transparent, 255
	Gui, Show, x10 y10 NoActivate
}
Else
	Gui Destroy
Return

Pause::
Run, taskmgr
return