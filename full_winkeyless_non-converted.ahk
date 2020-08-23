#SingleInstance Force

SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff

RCtrl::LWin
NumLock::BackSpace
ScrollLock::NumLock

F24::
MsgBox, F24
return

CapsLock & s::
send, {Media_Play_Pause}
return

CapsLock & a::
send, {Media_Prev}
return

CapsLock & d::
send, {Media_Next}
return

CapsLock & w::
send, {Volume_Mute}
return

CapsLock & q::
send, {Volume_Down}
return

CapsLock & e::
send, {Volume_Up}
return

CapsLock & i::
send, {Up}
return

CapsLock & j::
send, {Left}
return

CapsLock & k::
send, {Down}
return

CapsLock & l::
send, {Right}
return

CapsLock & y::
send, {PGUP}
return

CapsLock & h::
send, {PGDN}
return

CapsLock & p::
send, {Home}
return

CapsLock & `;::
send, {End}
return

; CapsLock+F9 launches calculator
CapsLock & F9::
send, {Launch_App2}
return

CapsLock & NumpadAdd::
send, =
return

CapsLock & NumpadDot::
send, `,
return

CapsLock & Numpad0::
send, 00
return

; For the following hotkeys, remember that Ctrl+Alt is AltGr

; Win+Ctrl+Alt+a sends ä
#^!a::
send, ä
return

; Win+Ctrl+Alt+Shift+a sends Ä
#^!+a::
send, Ä
return

; Win+Ctrl+Alt+o sends ö
#^!o::
send, ö
return

; Win+Ctrl+Alt+Shift+o sends Ö
#^!+o::
send, Ö
return

; Win+Ctrl+Alt+u sends ü
#^!u::
send, ü
return

; Win+Ctrl+Alt+Shift+u sends Ü
#^!+u::
send, Ü
return

; Win+Ctrl+Alt+s sends ß
#^!s::
send, ß
return

; Win+Ctrl+Alt+Shift+s sends ß
#^!+s::
send, ß
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