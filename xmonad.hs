{- Joeys Xmonad config
Running Xmonad Darcs & Contrib Darcs
Requires atleast Xmonad 0.9 & mobar 0.8
Include .xmobarrc + ~/bin
 -}
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Layout.Named
import XMonad.Layout.PerWorkspace
import XMonad.Layout.NoBorders
 
myManageHook = composeAll
    [ className =? "Gimp" --> doFloat
    , className =? "Vncviewer" --> doFloat
    ]
    
myWorkspaces = ["term", "web", "code", "irc", "media", "music", "else"]

myLayoutHook = onWorkspace "media" myFullscreen $ onWorkspace "web" myBorderless $ myLayout
	where
		myFullscreen = noBorders ( Full )
		myBorderless = noBorders (avoidStruts  $  layoutHook defaultConfig)
		myLayout = avoidStruts  $  layoutHook defaultConfig


main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/jpg/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook defaultConfig
        , layoutHook = myLayoutHook
	, workspaces = myWorkspaces
	, normalBorderColor = "#000000"
	, focusedBorderColor = "#1793d1"
	, terminal = "terminator"
        , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        }`additionalKeys`[
		((mod4Mask, xK_p), spawn "dmenu_run")
		]
