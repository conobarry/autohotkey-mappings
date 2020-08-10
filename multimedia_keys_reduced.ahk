#If
#n::
run, notepad
return

#s::
DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
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