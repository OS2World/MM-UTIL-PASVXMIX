/* REXX */

Call RxFuncAdd 'SysLoadFuncs','RexxUtil','SysLoadFuncs'
Signal on Syntax Name Test
Call SysLoadFuncs
Test:
if rc=43 then do
        Say "Cannot load rexxutils, is REXXUTIL.DLL in your libpath ?"
        Exit
end
Signal off Syntax

result=SysCreateObject('WPShadow', 'Allo', '<WP_START>', 'SHADOWID='directory()'\Boot_settings.cmd;OBJECTID=<Test>;', 'F')
if result=0 then do
        Say "It didn't work. Try doing it manually by"
        Say "placing a shadow of Boot_settings.cmd in"
        Say "your startup folder."
end
else do
        Say "It worked. A shadow of Boot_settings.cmd"
        Say "has been placed in your startup folder."
end
                                                                        
