;           __________                                 
;         .'----------`.                              
;         | .--------. |                             
;         | |#Azumar#| |       __________              
;         | |########| |      /__________\             
;.--------| `--------' |------|    --=-- |-------------.
;|        `----,-.-----'      |o ======  |             | 
;|       ______|_|_______     |__________|             | 
;|      /  %%%%%%%%%%%%  \                             | 
;|     /  %%%%%%%%%%%%%%  \    <Ascension Calculator>  | 
;|     ^^^^^^^^^^^^^^^^^^^^       <Version 0.9.1>      | 
;+-----------------------------------------------------+
;|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
SendMode Input
#NoEnv
SetWorkingDir %A_ScriptDir%
logo = %A_ScriptDir%\data\logo.png
GUITITLE := "Legends Ascension Calc"
Menu, Tray, NoStandard
Menu Tray, Tip, %GUITITLE%
transparent := 220			;GUI transparancy
color1:="682808"			;title background color
color2:="682808"			;titletopborder1
color3:="682808"			;titletopborder2
color4:="682808"			;titlebottomborder
color5:="682808"			;leftinsideborder
color6:="682808"			;leftoutsideborder
color7:="682808"			;rightinsideborder
color8:="682808"			;rightoutsideborder
color9:="682808"			;S_B top edge color (h=3px w=maxGUIwidth)
color10:="682808"			;S_B partCover1, to cover vertical lines 
color11:="682808"			;S_B partCover2, same as above
color12:="f6f6f6"			;Title & Text
color13:="181818"  			;Gui background color
color14:="682808"			;Statusbarcolor
width:= "800"  			;change to desired GUI width
height:= "550"				;and GUI height
; -----------------------------------------------------------------------------
W1:= width - 7
w2:= width - 5
w3:= width - 3
w4:= width - 72
w6:= width -50
w7:= width - 34
w5:= (width-72) //2
h1:= height - 50
h3:= height - 20
h2:= height - 17
sbpart:= (width-70) //2
; -------------------------------------------------------------------------------
gui, destroy
gui, +lastfound 
Gui, Margin, 0, 0
gui, color, %color13%, %color13%
WinSet, Transparent,%transparent%
gui, -caption 
Gui, Add, Progress,+E0x20 x-1 y0 w%width%+2 h26 Background%color1% Disabled ;title
Gui, Add, Progress,+E0x20 x-1 y-1 w%width% h3 Background%color2% Disabled 	;titletopborder1
Gui, Add, Progress,+E0x20 x-1 y1 w%width% h2 Background%color3% Disabled 	;titletopborder2
Gui, Add, Progress,+E0x20 x2 y30 w%w2% h3 Background%color4% Disabled 		;titlebottomborder
Gui, Add, Progress,+E0x20 x2 y30 w2 h%h1% Background%color5% Disabled 		;leftinsideborder
Gui, Add, Progress,+E0x20 x0 y3 w2 h%height% Background%color6% Disabled 	;leftoutsideborder
Gui, Add, Progress,+E0x20 x%w2% y30 w2 h%h1% Background%color7% Disabled 	;rightinsideborder
Gui, Add, Progress,+E0x20 x%w3% y3 w2 h%height% Background%color8% Disabled ;rightoutsideborder
Gui, Add, Progress,+E0x20 x2 y%h3% w%w2% h3 Background%color9% Disabled 	;S_B top edge
Gui, Add, Progress,+E0x20 x%w4% y%h2% w5 h33 Background%color10% Disabled 	;S_B part Cover1  
Gui, Add, Progress,+E0x20 x%w5%-72 y%h2% w4 h25 Background%color11% Disabled ;S_B part Cover2
gui, font, Q5 c%color12% bold s14,  										;color & size of following 
Gui, Add, Text, +E0x20 0x200 x%w7% y6 w15 h15 BackgroundTrans Center gguiclose , x  ;x to close gui
Gui, Add, Text, +E0x20 0x200 x%w6% y10 w15 h15 BackgroundTrans Center gminimize , -	 ; - to min gui
gui, font, Q5 c%color12% bold s14,  										;color & size GuiTitle
Gui, Add, Text, +E0x20 0x200 x0 y0 w%width% h22 BackgroundTrans Center gGuiMove , %guititle%   
gui, Font, Q5 s09 w500, Verdana 					;Menu-text color/font
Gui, Add, Picture, x0 y0, %logo%					;Upper 2/3 logo (800 x 350)
; ----------------------------------------------------------------------------------------
;--------------------------------------Window code----------------------------------------
; ----------------------------------------------------------------------------------------
Gui, font, s11 bold, Sitka Small
Gui, Add, Text, x10 y339, Base HP:
Gui, Add, Edit, x140 y339 w160 h25 vBHP, 0
Gui, Add, Text, x350 y339, Base MP:
Gui, Add, Edit, x510 y339 w160 h25 vBMP, 0
Gui, Add, Text, x10 y379, New Base(HP):
Gui, Add, Edit, x140 y379 w160 h25 vDHP, 0
Gui, Add, Text, x350 y379, New Base(MP):
Gui, Add, Edit, x510 y379 w160 h25 vDMP, 0
Gui, Add, Text, x10 y430, Exp(hp):
Gui, Add, Edit, x100 y430 w200 h25 vEXPhp, 
Gui, Add, Text, x350 y430, Exp(mp):
Gui, Add, Edit, x470 y430 w200 h25 vEXPmp, 
Gui, Add, Text, x200 y480, Exp(Total):
Gui, Add, Edit, x330 y480 w250 h25 vEXPTot, 
Gui, Add, Button, x728 y490 w60 h24 gCalculate, Calc
Gui, Show
Return

; ----------------------------------------------------------------------------------------
gui, Font, Q5 s9 bold w670,							;S_B Font   
Gui, add, StatusBar, background%color14% -theme    	;S_B-backgroundcolor -theme is crutial
SB_SetParts(sbpart, sbpart)							;S_B split into 3 parts, 
SB_SetText("Ver 0.8.2" ,3)							;S_B set Version of your project here
SB_SetText("  Discord @ Azumar#7642"a,1)						
SB_SetText("",2)									
Menu, tray, Color, %color13%						;Tray menu bg-color same as background
winset, region, w%width% h%height%+5 0-0 R20-20		;Trim GUI Borders and round of corners 20px radius  
gui, show, w%width% h%height%						;Make Gui Visible.
gui, +lastfound 
return
; --SUB Minimize Gui ----------------------------------------------------------------
minimize:
winminimize,
return
; --SUB Destroy GUI, doubleclick trayicon to open (new) GUI--------------------------
GuiClose:
exitapp
return
; --SUB Move window with text control in Title by click and drag-----------------------
GuiMove:     		
PostMessage, 0xA1, 2
sleep 75
winset, redraw
WB.Navigate(page)  ; --- IF YOU TESTED THE ACTIVEX CONTOL MOVING GUI WILL REQ REDRAW OF CONTROL 
return

Calculate:
Gui, Submit
;--HP--
BaseHP := BHP
Base1 := basehp
HPInterval := 50
NewBaseHP := BHP
Desiredhp := DHP
XP1 := 
TotalXP1 :=
;------
;--MP--
BaseMP := BMP
Base2 := basemp
MPInterval := 25
NewBaseMP := BMP
Desiredmp := DMP
XP2 := 
TotalXP2 :=

Loop, {
	XP1 := NewBaseHP*500
	NewBaseHP += HPInterval
	BaseHP += HPInterval
	TotalXP1 += XP1
	if (BaseHP >= Desiredhp)
		break	
}

Loop, {
	XP2 := NewBaseMP*500
	NewBaseMP += MPInterval
	BaseMP += MPInterval
	TotalXP2 += XP2
	if (BaseMP >= Desiredmp)
		break	
}

GuiControl,, BHP, 
GuiControl,, DHP, %NewBaseHP%
GuiControl,, EXPhp, %TotalXP1% 

GuiControl,, BMP, 
GuiControl,, DMP, %NewBaseMP% 
GuiControl,, EXPmp, %TotalXP2% 
Total := TotalXP1 += TotalXP2
GuiControl,, EXPTot, %Total%
Gui, Show
Return