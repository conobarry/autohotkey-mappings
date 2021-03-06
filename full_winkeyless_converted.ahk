#SingleInstance Force

#If

; For the following hotkeys, remember that Ctrl+Alt is AltGr

; Win+Ctrl+Alt+a sends �
#^!a::
send, �
return

; Win+Ctrl+Alt+Shift+a sends �
#^!+a::
send, �
return

; Win+Ctrl+Alt+o sends �
#^!o::
send, �
return

; Win+Ctrl+Alt+Shift+o sends �
#^!+o::
send, �
return

; Win+Ctrl+Alt+u sends �
#^!u::
send, �
return

; Win+Ctrl+Alt+Shift+u sends �
#^!+u::
send, �
return

; Win+Ctrl+Alt+s sends �
#^!s::
send, �
return

; Win+Ctrl+Alt+Shift+s sends �
#^!+s::
send, �
return

; Win+N launches notepad
#n::
run, notepad
return

; Win+S sleeps
#s::
DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
return

; ----- Autoclicker ----- 

toggle=0

; Win+F10 toggles autoclicker
#F10::
autoclick:=!autoclick
return

; Rapidly clicks left while left click is held
~$*LButton::
While (GetKeyState("Lbutton", "P") and autoclick){
    Click
    Sleep 4
}
return

; Rapidly clicks right while right click is held
~$*RButton::
While (GetKeyState("Rbutton", "P") and autoclick){
    Click, right
    Sleep 4
}
return

; ----- GUI -----

helpVisible=0

; Win+F12 toggles the help GUI
#F12::
helpVisible:=!helpVisible
If helpVisible
{
	helpText =
(
F1: 	Play/Pause
F2: 	Previous
F3: 	Next
F4: 	Toggle Mute
F5: 	Volume Down
F6: 	Volume Up
F9: 	Calculator
F10: 	Toggle Auto-Clicker
F12: 	Toggle Help
Pause: 	Task Manager
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