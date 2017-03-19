import XMonad
import XMonad.Config.Xfce
import XMonad.Util.EZConfig 

main = xmonad $ xfceConfig
	{
	  borderWidth = 1
	, terminal = "xterm"
	, normalBorderColor = colorBlackAlt
	, focusedBorderColor = colorWhiteAlt
	} `additionalKeys` myKeys

colorWhiteAlt = "#b5b3b3"
colorBlackAlt = "#1c1c1c"

myLauncher = "rofi -show run -modi run, window -sidebar-mode -lines 6 -width 400"
myKeys = [ ((mod1Mask, xK_p), spawn myLauncher) ]
