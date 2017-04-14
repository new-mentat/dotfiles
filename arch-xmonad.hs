import XMonad
import XMonad.Layout.NoBorders
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO


myLauncher = "rofi -show run -modi run, window -sidebar-mode -lines 6 -width 400"
myWindow= "rofi -show window -modi window, window -sidebar-mode -lines 6 -width 800"

main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ ewmh def
        { manageHook = manageDocks <+> manageHook def
        , layoutHook = avoidStruts $ layoutHook def
        , handleEventHook = ewmhDesktopsEventHook
        , borderWidth = 1
        , normalBorderColor = colorBlackAlt
        , focusedBorderColor = colorWhiteAlt
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        } `additionalKeys` myKeys



myKeys = 
  [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")
  , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
  , ((0, xK_Print), spawn "scrot ~/Pictures/Screenshots/%b%d::%H%M%S.png")
  , ((mod1Mask, xK_p), spawn myLauncher)
  , ((mod1Mask, xK_w), spawn myWindow)
  , ((mod1Mask, xK_b     ), sendMessage ToggleStruts)
  ]

colorWhiteAlt = "#b5b3b3"
colorBlackAlt = "#1c1c1c"
