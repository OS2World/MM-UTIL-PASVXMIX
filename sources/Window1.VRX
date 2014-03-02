/*:VRX         Main
*/
/*  Main
*/
Main:
/*  Process the arguments.
    Get the parent window.
*/
    parse source . calledAs .
    parent = ""
    argCount = arg()
    argOff = 0
    if( calledAs \= "COMMAND" )then do
        if argCount >= 1 then do
            parent = arg(1)
            argCount = argCount - 1
            argOff = 1
        end
    end
    InitArgs.0 = argCount
    if( argCount > 0 )then do i = 1 to argCount
        InitArgs.i = arg( i + argOff )
    end
    drop calledAs argCount argOff

/*  Load the windows
*/
    call VRInit
    parse source . . spec
    _VREPrimaryWindowPath = ,
        VRParseFileName( spec, "dpn" ) || ".VRW"
    _VREPrimaryWindow = ,
        VRLoad( parent, _VREPrimaryWindowPath )
    drop parent spec
    if( _VREPrimaryWindow == "" )then do
        call VRMessage "", "Cannot load window:" VRError(), ,
            "Error!"
        _VREReturnValue = 32000
        signal _VRELeaveMain
    end

/*  Process events
*/
    call Init
    signal on halt
    do while( \ VRGet( _VREPrimaryWindow, "Shutdown" ) )
        _VREEvent = VREvent()
        interpret _VREEvent
    end
_VREHalt:
    _VREReturnValue = Fini()
    call VRDestroy _VREPrimaryWindow
_VRELeaveMain:
    call VRFini
exit _VREReturnValue

VRLoadSecondary: procedure
    name = arg( 1 )

    window = VRLoad( VRWindow(), VRWindowPath(), name )
    call VRMethod window, "CenterWindow"
    call VRSet window, "Visible", 1
    call VRMethod window, "Activate"
return window

/*:VRX         CB_Aux_Click
*/
CB_Aux_Click:
    i = 4
    cb = "CB_"controls.i.!vxsuffix
    spin = "SPIN_"controls.i.!vxsuffix
    cbset = VRGet( cb, "Set" )
    ok = VRSet( spin, "Enabled",  cbset)
    controls.i.!notmuted.ch = VRGet( cb, "Set" )
    if channel="" then controls.i.!notmuted.!right = controls.i.!notmuted.!left

    "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch * controls.i.!notmuted.ch

return

/*:VRX         CB_Bass_Click
*/
CB_Bass_Click:
    i = 10
    cb = "CB_"controls.i.!vxsuffix
    spin = "SPIN_"controls.i.!vxsuffix
    cbset = VRGet( cb, "Set" )
    ok = VRSet( spin, "Enabled",  cbset)
    controls.i.!notmuted.ch = VRGet( cb, "Set" )
    if channel="" then controls.i.!notmuted.!right = controls.i.!notmuted.!left

    "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch * controls.i.!notmuted.ch

return

/*:VRX         CB_CD_Click
*/
CB_CD_Click:
    i = 3
    cb = "CB_"controls.i.!vxsuffix
    spin = "SPIN_"controls.i.!vxsuffix
    cbset = VRGet( cb, "Set" )
    ok = VRSet( spin, "Enabled",  cbset)
    controls.i.!notmuted.ch = VRGet( cb, "Set" )
    if channel="" then controls.i.!notmuted.!right = controls.i.!notmuted.!left

    "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch * controls.i.!notmuted.ch

return

/*:VRX         CB_Loudness_Click
*/
CB_Loudness_Click:
    i = 13
    cb = "CB_"controls.i.!vxsuffix
    spin = "SPIN_"controls.i.!vxsuffix
    cbset = VRGet( cb, "Set" )
    ok = VRSet( spin, "Enabled",  cbset)
    controls.i.!notmuted.ch = VRGet( cb, "Set" )
    if channel="" then controls.i.!notmuted.!right = controls.i.!notmuted.!left

    "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch * controls.i.!notmuted.ch

return

/*:VRX         CB_Master_Click
*/
CB_Master_Click:
    i = 1
    cb = "CB_"controls.i.!vxsuffix
    spin = "SPIN_"controls.i.!vxsuffix
    cbset = VRGet( cb, "Set" )
    ok = VRSet( spin, "Enabled",  cbset)
    controls.i.!notmuted.ch = VRGet( cb, "Set" )
    if channel="" then controls.i.!notmuted.!right = controls.i.!notmuted.!left

    "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch * controls.i.!notmuted.ch

return

/*:VRX         CB_Mic_Click
*/
CB_Mic_Click:
    i = 5
    cb = "CB_"controls.i.!vxsuffix
    spin = "SPIN_"controls.i.!vxsuffix
    cbset = VRGet( cb, "Set" )
    ok = VRSet( spin, "Enabled",  cbset)
    controls.i.!notmuted.ch = VRGet( cb, "Set" )
    if channel="" then controls.i.!notmuted.!right = controls.i.!notmuted.!left

    "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch * controls.i.!notmuted.ch

return

/*:VRX         CB_PAS_DAC_Click
*/
CB_PAS_DAC_Click:
    i = 2
    cb = "CB_"controls.i.!vxsuffix
    spin = "SPIN_"controls.i.!vxsuffix
    cbset = VRGet( cb, "Set" )
    ok = VRSet( spin, "Enabled",  cbset)
    controls.i.!notmuted.ch = VRGet( cb, "Set" )
    if channel="" then controls.i.!notmuted.!right = controls.i.!notmuted.!left

    "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch * controls.i.!notmuted.ch
return

/*:VRX         CB_PC_Click
*/
CB_PC_Click:
    i = 8
    cb = "CB_"controls.i.!vxsuffix
    spin = "SPIN_"controls.i.!vxsuffix
    cbset = VRGet( cb, "Set" )
    ok = VRSet( spin, "Enabled",  cbset)
    controls.i.!notmuted.ch = VRGet( cb, "Set" )
    if channel="" then controls.i.!notmuted.!right = controls.i.!notmuted.!left

    "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch * controls.i.!notmuted.ch

return

/*:VRX         CB_Rec_monitor_Click
*/
CB_Rec_monitor_Click:
    i = 9
    cb = "CB_"controls.i.!vxsuffix
    spin = "SPIN_"controls.i.!vxsuffix
    cbset = VRGet( cb, "Set" )
    ok = VRSet( spin, "Enabled",  cbset)
    controls.i.!notmuted.ch = VRGet( cb, "Set" )
    if channel="" then controls.i.!notmuted.!right = controls.i.!notmuted.!left

    "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch * controls.i.!notmuted.ch

return

/*:VRX         CB_SB_DAC_Click
*/
CB_SB_DAC_Click:
    i = 7
    cb = "CB_"controls.i.!vxsuffix
    spin = "SPIN_"controls.i.!vxsuffix
    cbset = VRGet( cb, "Set" )
    ok = VRSet( spin, "Enabled",  cbset)
    controls.i.!notmuted.ch = VRGet( cb, "Set" )
    if channel="" then controls.i.!notmuted.!right = controls.i.!notmuted.!left

    "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch * controls.i.!notmuted.ch

return

/*:VRX         CB_Stereo_Enh_Click
*/
CB_Stereo_Enh_Click:
    i = 12
    cb = "CB_"controls.i.!vxsuffix
    spin = "SPIN_"controls.i.!vxsuffix
    cbset = VRGet( cb, "Set" )
    ok = VRSet( spin, "Enabled",  cbset)
    controls.i.!notmuted.ch = VRGet( cb, "Set" )
    if channel="" then controls.i.!notmuted.!right = controls.i.!notmuted.!left

    "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch * controls.i.!notmuted.ch
return

/*:VRX         CB_Synth_Click
*/
CB_Synth_Click:
    i = 6
    cb = "CB_"controls.i.!vxsuffix
    spin = "SPIN_"controls.i.!vxsuffix
    cbset = VRGet( cb, "Set" )
    ok = VRSet( spin, "Enabled",  cbset)
    controls.i.!notmuted.ch = VRGet( cb, "Set" )
    if channel="" then controls.i.!notmuted.!right = controls.i.!notmuted.!left

    "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch * controls.i.!notmuted.ch

return

/*:VRX         CB_Treble_Click
*/
CB_Treble_Click:
    i = 11
    cb = "CB_"controls.i.!vxsuffix
    spin = "SPIN_"controls.i.!vxsuffix
    cbset = VRGet( cb, "Set" )
    ok = VRSet( spin, "Enabled",  cbset)
    controls.i.!notmuted.ch = VRGet( cb, "Set" )
    if channel="" then controls.i.!notmuted.!right = controls.i.!notmuted.!left

    "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch * controls.i.!notmuted.ch

return

/*:VRX         Fini
*/
Fini:
    window = VRWindow()
    call VRSet window, "Visible", 0
    drop window
return 0

/*:VRX         Get_Settings
*/
Get_Settings:
    temp="disposable_temporary_file"
    "pas get "controls.1.!uname" >"temp
    do i = 2 to controls.0
        "pas get "controls.i.!uname" >>"temp
    end

    i = 1
    do while Lines(temp)>0 & i<=controls.0
        ln = LineIn(temp)
        if controls.i.!stereo=1 then do
            parse upper var ln level of xxx is vb"% (L:"vl"% R:"vr"%)"rest
            controls.i.!value.!left=vl
            controls.i.!value.!right=vr
        end
        else do
            parse upper var ln level of xxx is vb"%"
            controls.i.!value.!left=vb
            controls.i.!value.!right=vb
        end
        i=i+1
    end

    ok = VRSet( "RB_Both", "Set", 1 )
    refresh = 1
    call RB_Both_Click

return

/*:VRX         Halt
*/
Halt:
    signal _VREHalt
return

/*:VRX         Init
*/
Init:

    window = VRWindow()
/*    call VRMethod window, "CenterWindow" */
    call VRSet window, "Visible", 1
    call VRMethod window, "Activate"
    drop window

    Hundred.0 = 101
    do index = 1 to 101
        Hundred.index = index-1
    end
    
    controls.0 = 13

    i = 1
    controls.i.!uname = "VOLUME"
    controls.i.!vxsuffix = "Master"
    controls.i.!stereo = 1
    i = 2
    controls.i.!uname = "PCM"
    controls.i.!vxsuffix = "PAS_DAC"
    controls.i.!stereo = 1
    i = 3
    controls.i.!uname = "CD"
    controls.i.!vxsuffix = "CD"
    controls.i.!stereo = 1
    i = 4
    controls.i.!uname = "AUX"
    controls.i.!vxsuffix = "Aux"
    controls.i.!stereo = 1
    i = 5
    controls.i.!uname = "MIC"
    controls.i.!vxsuffix = "Mic"
    controls.i.!stereo = 1
    i = 6
    controls.i.!uname = "FM"
    controls.i.!vxsuffix = "Synth"
    controls.i.!stereo = 1
    i = 7
    controls.i.!uname = "SB"
    controls.i.!vxsuffix = "SB_DAC"
    controls.i.!stereo = 1
    i = 8
    controls.i.!uname = "SPKR"
    controls.i.!vxsuffix = "PC"
    controls.i.!stereo = 1
    i = 9
    controls.i.!uname = "MON"
    controls.i.!vxsuffix = "Rec_monitor"
    controls.i.!stereo = 1
    i = 10
    controls.i.!uname = "BASS"
    controls.i.!vxsuffix = "Bass"
    controls.i.!stereo = 0
    i = 11
    controls.i.!uname = "TREBLE"
    controls.i.!vxsuffix = "Treble"
    controls.i.!stereo = 0
    i = 12
    controls.i.!uname = "ENHANCE"
    controls.i.!vxsuffix = "Stereo_Enh"
    controls.i.!stereo = 0
    i = 13
    controls.i.!uname = "LOUDNESS"
    controls.i.!vxsuffix = "Loudness"
    controls.i.!stereo = 0

    do i = 1 to controls.0
        spin = "SPIN_"controls.i.!vxsuffix
        ok = VRMethod( spin, "SetStringList", "Hundred." )

        controls.i.!notmuted.!left = 1
        controls.i.!notmuted.!right = 1
    end

    savefilename = "Boot_settings.cmd"
    call Get_Settings
    ok = VRSet( "DT_1", "Visible", 0 )
    ok = VRSet( "GB_Volume", "Visible", 1 )
    ok = VRSet( "GB_Options", "Visible", 1 )

    channel = ""
    ch="!LEFT"
    /* ch should be !LEFT when channel is not right */

return

/*:VRX         PB_Load_Click
*/
PB_Load_Click:
    ctrl = 1
    ln = LineIn(savefilename,1)

    start ' "Setting PAS-16 sound levels" /C /B /MIN ' savefilename ' >nul'
    
    do while Lines(savefilename)>0 & ctrl<=controls.0
        ln = LineIn(savefilename)
        parse upper var ln word1 check vl vr ml mr
        if check="PASVXMIX:" then do
/*            ok = VRSet( "CB_"controls.ctrl.!vxsuffix, "Enabled", 0 )*/
            controls.ctrl.!value.!left=vl
            controls.ctrl.!value.!right=vr
            controls.ctrl.!notmuted.!left=ml
            controls.ctrl.!notmuted.!right=mr
            ctrl=ctrl+1
        end
    end

    ok = VRSet( "RB_Both", "Set", 1 )
    refresh = 1
    call RB_Both_Click
    
return

/*:VRX         PB_Save_Click
*/
PB_Save_Click:
    call LineOut savefilename, "rem This is a script to configure the PAS-16 unsing pas.exe", 1
    call LineOut savefilename, "rem It also acts as a savefile for PASVXMIX"
    call LineOut savefilename, "echo off"

    call LineOut savefilename, ""
    call LineOut savefilename, "rem Status information for PASVXMIX"
    do i = 1 to controls.0
        status = controls.i.!value.!left " " controls.i.!value.!right " " controls.i.!notmuted.!left " " controls.i.!notmuted.!right
        call LineOut savefilename, "rem PASVXMIX: "status
    end

    call LineOut savefilename, ""
    call LineOut savefilename, "rem Script to configure the PAS-16 using PAS.EXE without launching PASVXMIX"
    do i = 1 to controls.0
        vl = controls.i.!value.!left * controls.i.!notmuted.!left
        vr = controls.i.!value.!right * controls.i.!notmuted.!right
        if controls.i.!stereo = 1 & \(vl=vr) then do
            cl = "left " controls.i.!uname " to " vl
            cr = "right " controls.i.!uname " to " vr
            call LineOut savefilename, "pas set "cl
            call LineOut savefilename, "pas set "cr
        end
        else do
            c = controls.i.!uname " to " vl
            call LineOut savefilename, "pas set "c
        end
    end
    /* now add some blank line to overwrite a possible larger previous version */
    do l = 1 to 15
        call LineOut savefilename, "                                                                        "
    end
return

/*:VRX         Quit
*/
Quit:
    window = VRWindow()
    call VRSet window, "Shutdown", 1
    drop window
return

/*:VRX         RB_Alt_Settings_1_Click
*/
RB_Alt_Settings_1_Click:
  savefilename = "Alt_settings_1.cmd"
return

/*:VRX         RB_Alt_settings_2_Click
*/
RB_Alt_settings_2_Click:
  savefilename = "Alt_settings_2.cmd"
return

/*:VRX         RB_Boot_settings_Click
*/
RB_Boot_settings_Click:
  savefilename = "Boot_settings.cmd"
return

/*:VRX         RB_Both_Click
*/
RB_Both_Click:
    if \(channel="") | refresh=1 then do
        refresh=0
        do i = 1 to controls.0
            ok = VRSet( "SPIN_"controls.i.!vxsuffix, "Enabled", 1 )
            ok = VRSet( "CB_"controls.i.!vxsuffix, "Enabled", 1 )

            controls.i.!nextchangevisualonly = 1
            ok = VRSet( "SPIN_"controls.i.!vxsuffix, "Value", trunc((controls.i.!value.!left + controls.i.!value.!right)/2))

            if controls.i.!notmuted.!right = 1 | controls.i.!notmuted.!left = 1 then do
                bit = 1
            end
            else do
                bit = 0
            end
            ok = VRSet( "CB_"controls.i.!vxsuffix, "Set", bit )
            ok = VRSet( "SPIN_"controls.i.!vxsuffix, "Enabled", bit)
        end
    end
    channel = ""
    ch="!LEFT"
return

/*:VRX         RB_Left_Click
*/
RB_Left_Click:
    if \(channel="left") then do
        do i = 1 to controls.0
            ok = VRSet( "SPIN_"controls.i.!vxsuffix, "Enabled", controls.i.!stereo )
            ok = VRSet( "CB_"controls.i.!vxsuffix, "Enabled", controls.i.!stereo )
            if controls.i.!stereo=1 then do
                controls.i.!nextchangevisualonly = 1
                ok = VRSet( "SPIN_"controls.i.!vxsuffix, "Value", controls.i.!value.!left)

                ok = VRSet( "CB_"controls.i.!vxsuffix, "Set", controls.i.!notmuted.!left )
                ok = VRSet( "SPIN_"controls.i.!vxsuffix, "Enabled", controls.i.!notmuted.!left )
            end
        end
    end 
    channel = "left"
    ch = "!LEFT"
return

/*:VRX         RB_Right_Click
*/
RB_Right_Click:
    if \(channel="right") then do
        do i = 1 to controls.0
            ok = VRSet( "SPIN_"controls.i.!vxsuffix, "Enabled", controls.i.!stereo )
            ok = VRSet( "CB_"controls.i.!vxsuffix, "Enabled", controls.i.!stereo )

            if controls.i.!stereo=1 then do
                controls.i.!nextchangevisualonly = 1
                ok = VRSet( "SPIN_"controls.i.!vxsuffix, "Value", controls.i.!value.!right)

                ok = VRSet( "CB_"controls.i.!vxsuffix, "Set", controls.i.!notmuted.!right )
                ok = VRSet( "SPIN_"controls.i.!vxsuffix, "Enabled", controls.i.!notmuted.!right )
            end
        end
    end 
    channel = "right"
    ch = "!RIGHT"
return

/*:VRX         SPIN_Aux_Change
*/
SPIN_Aux_Change:
    i = 4
    if controls.i.!nextchangevisualonly = 1 then controls.i.!nextchangevisualonly = 0
    else do
        spin = "SPIN_"controls.i.!vxsuffix
        controls.i.!value.ch = VRGet( spin, "Value" )
        if channel="" then controls.i.!value.!right = controls.i.!value.!left

        "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch
        controls.i.!notmuted.!left=1;
        controls.i.!notmuted.!right=1;
    end

return

/*:VRX         SPIN_Bass_Change
*/
SPIN_Bass_Change:
    i = 10
    if controls.i.!nextchangevisualonly = 1 then controls.i.!nextchangevisualonly = 0
    else do
        spin = "SPIN_"controls.i.!vxsuffix
        controls.i.!value.ch = VRGet( spin, "Value" )
        if channel="" then controls.i.!value.!right = controls.i.!value.!left

        "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch
        controls.i.!notmuted.!left=1;
        controls.i.!notmuted.!right=1;
    end

return

/*:VRX         SPIN_CD_Change
*/
SPIN_CD_Change:
    i = 3
    if controls.i.!nextchangevisualonly = 1 then controls.i.!nextchangevisualonly = 0
    else do
        spin = "SPIN_"controls.i.!vxsuffix
        controls.i.!value.ch = VRGet( spin, "Value" )
        if channel="" then controls.i.!value.!right = controls.i.!value.!left

        "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch
        controls.i.!notmuted.!left=1;
        controls.i.!notmuted.!right=1;
    end

return

/*:VRX         SPIN_Loudness_Change
*/
SPIN_Loudness_Change:
    i = 13
    if controls.i.!nextchangevisualonly = 1 then controls.i.!nextchangevisualonly = 0
    else do
        spin = "SPIN_"controls.i.!vxsuffix
        controls.i.!value.ch = VRGet( spin, "Value" )
        if channel="" then controls.i.!value.!right = controls.i.!value.!left

        "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch
        controls.i.!notmuted.!left=1;
        controls.i.!notmuted.!right=1;
    end

return

/*:VRX         SPIN_Master_Change
*/
SPIN_Master_Change:
    i = 1
    if controls.i.!nextchangevisualonly = 1 then controls.i.!nextchangevisualonly = 0
    else do
        spin = "SPIN_"controls.i.!vxsuffix
        controls.i.!value.ch = VRGet( spin, "Value" )
        if channel="" then controls.i.!value.!right = controls.i.!value.!left

        "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch
        controls.i.!notmuted.!left=1;
        controls.i.!notmuted.!right=1;
    end
return

/*:VRX         SPIN_Mic_Change
*/
SPIN_Mic_Change:
    i = 5
    if controls.i.!nextchangevisualonly = 1 then controls.i.!nextchangevisualonly = 0
    else do
        spin = "SPIN_"controls.i.!vxsuffix
        controls.i.!value.ch = VRGet( spin, "Value" )
        if channel="" then controls.i.!value.!right = controls.i.!value.!left

        "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch
        controls.i.!notmuted.!left=1;
        controls.i.!notmuted.!right=1;
    end

return

/*:VRX         SPIN_PAS_DAC_Change
*/
SPIN_PAS_DAC_Change:
    i = 2
    if controls.i.!nextchangevisualonly = 1 then controls.i.!nextchangevisualonly = 0
    else do
        spin = "SPIN_"controls.i.!vxsuffix
        controls.i.!value.ch = VRGet( spin, "Value" )
        if channel="" then controls.i.!value.!right = controls.i.!value.!left

        "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch
        controls.i.!notmuted.!left=1;
        controls.i.!notmuted.!right=1;
    end

return

/*:VRX         SPIN_PC_Change
*/
SPIN_PC_Change:
    i = 8
    if controls.i.!nextchangevisualonly = 1 then controls.i.!nextchangevisualonly = 0
    else do
        spin = "SPIN_"controls.i.!vxsuffix
        controls.i.!value.ch = VRGet( spin, "Value" )
        if channel="" then controls.i.!value.!right = controls.i.!value.!left

        "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch
        controls.i.!notmuted.!left=1;
        controls.i.!notmuted.!right=1;
    end

return

/*:VRX         SPIN_Rec_monitor_Change
*/
SPIN_Rec_monitor_Change:
    i = 9
    if controls.i.!nextchangevisualonly = 1 then controls.i.!nextchangevisualonly = 0
    else do
        spin = "SPIN_"controls.i.!vxsuffix
        controls.i.!value.ch = VRGet( spin, "Value" )
        if channel="" then controls.i.!value.!right = controls.i.!value.!left

        "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch
        controls.i.!notmuted.!left=1;
        controls.i.!notmuted.!right=1;
    end

return

/*:VRX         SPIN_SB_DAC_Change
*/
SPIN_SB_DAC_Change:
    i = 7
    if controls.i.!nextchangevisualonly = 1 then controls.i.!nextchangevisualonly = 0
    else do
        spin = "SPIN_"controls.i.!vxsuffix
        controls.i.!value.ch = VRGet( spin, "Value" )
        if channel="" then controls.i.!value.!right = controls.i.!value.!left

        "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch
        controls.i.!notmuted.!left=1;
        controls.i.!notmuted.!right=1;
    end

return

/*:VRX         SPIN_Stereo_Enh_Change
*/
SPIN_Stereo_Enh_Change:
    i = 12
    if controls.i.!nextchangevisualonly = 1 then controls.i.!nextchangevisualonly = 0
    else do
        spin = "SPIN_"controls.i.!vxsuffix
        controls.i.!value.ch = VRGet( spin, "Value" )
        if channel="" then controls.i.!value.!right = controls.i.!value.!left

        "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch
        controls.i.!notmuted.!left=1;
        controls.i.!notmuted.!right=1;
    end

return

/*:VRX         SPIN_Synth_Change
*/
SPIN_Synth_Change:
    i = 6
    if controls.i.!nextchangevisualonly = 1 then controls.i.!nextchangevisualonly = 0
    else do
        spin = "SPIN_"controls.i.!vxsuffix
        controls.i.!value.ch = VRGet( spin, "Value" )
        if channel="" then controls.i.!value.!right = controls.i.!value.!left

        "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch
        controls.i.!notmuted.!left=1;
        controls.i.!notmuted.!right=1;
    end

return

/*:VRX         SPIN_Treble_Change
*/
SPIN_Treble_Change:
    i = 11
    if controls.i.!nextchangevisualonly = 1 then controls.i.!nextchangevisualonly = 0
    else do
        spin = "SPIN_"controls.i.!vxsuffix
        controls.i.!value.ch = VRGet( spin, "Value" )
        if channel="" then controls.i.!value.!right = controls.i.!value.!left

        "pas set " channel " " controls.i.!uname " to " controls.i.!value.ch
        controls.i.!notmuted.!left=1;
        controls.i.!notmuted.!right=1;
    end

return

/*:VRX         Window1_Close
*/
Window1_Close:
    call Quit
return

