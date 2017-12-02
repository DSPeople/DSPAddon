SET addonsPath="D:\World of Warcraft\Interface\AddOns"

RMDIR /S /Q %addonsPath%\DSPAddon
MKDIR %addonsPath%\DSPAddon
XCOPY /s .\*.* %addonsPath%\DSPAddon
DEL /S /Q %addonsPath%\DSPAddon\*.bat

PAUSE