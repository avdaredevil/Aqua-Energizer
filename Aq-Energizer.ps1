<#
|===============================================================================================>|
   Game-Bot To Play Aqua Energizer {Miniclip} by APoorv Verma [AP] on 3/2/2014
|===============================================================================================>|
      $) Plays from Level 1 [But can be started to play from any level 1-10]
      $) Screen Ratio Processing to enable it to work on multiple resolutions
      $) Loads Aqua-Energizer from Downloads Folder
-------------------------------------------------------------------------------------------------|
    Notes:
      $) Great resource to learn UI automation through powershell
      $) Can be used as a trainer for AI based software to learn how to play games
|===============================================================================================>|
#>
param([int]$StartLevel=1)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.2] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gQVAtUmVxdWlyZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtBbGlhcygiRnVuY3Rpb25hbGl0eSIsIkxpYnJhcnkiKV1bU3RyaW5nXSRMaWIsIFtTY3JpcHRCbG9ja10kT25GYWlsPXt9LCBbU3dpdGNoXSRQYXNzVGhydSkNCg0KICAgIFtib29sXSRTdGF0ID0gJChzd2l0Y2ggLXJlZ2V4ICgkTGliLnRyaW0oKSkgew0KICAgICAgICAiXkludGVybmV0IiAge3Rlc3QtY29ubmVjdGlvbiBnb29nbGUuY29tIC1Db3VudCAxIC1RdWlldH0NCiAgICAgICAgIl5kZXA6KC4qKSIgIHtpZiAoJE1hdGNoZXNbMV0gLW5lICJ3aGVyZSIpe0FQLVJlcXVpcmUgImRlcDp3aGVyZSIgeyRNT0RFPTJ9fWVsc2V7JE1PREU9Mn07aWYgKCRNT0RFLTIpe0dldC1XaGVyZSAkTWF0Y2hlc1sxXX1lbHNle3RyeXsmICRNYXRjaGVzWzFdICIvZmpmZGpmZHMgLS1kc2phaGRocyAtZHNqYWRqIiAyPiRudWxsOyJzdWNjIn1jYXRjaHt9fX0NCiAgICAgICAgIl5saWI6KC4qKSIgIHskRmlsZT0kTWF0Y2hlc1sxXTskTGliPUFQLUNvbnZlcnRQYXRoICI8TElCPiI7KHRlc3QtcGF0aCAtdCBsZWFmICIkTGliXCRGaWxlIikgLW9yICh0ZXN0LXBhdGggLXQgbGVhZiAiJExpYlwkRmlsZS5kbGwiKX0NCiAgICAgICAgIl5mdW5jdGlvbjooLiopIiAge2djbSAkTWF0Y2hlc1sxXSAtZWEgU2lsZW50bHlDb250aW51ZX0NCiAgICAgICAgIl5zdHJpY3RfZnVuY3Rpb246KC4qKSIgIHtUZXN0LVBhdGggIkZ1bmN0aW9uOlwkKCRNYXRjaGVzWzFdKSJ9DQogICAgfSkNCiAgICBpZiAoISRTdGF0KSB7JE9uRmFpbC5JbnZva2UoKX0NCiAgICBpZiAoJFBhc3NUaHJ1KSB7cmV0dXJuICRTdGF0fQ0KfQoKZnVuY3Rpb24gUHJvY2Vzcy1UcmFuc3BhcmVuY3kge3BhcmFtKFtBbGlhcygiVHJhbnNwYXJlbmN5IiwiSW52aXNpYmlsaXR5IiwiaSIsInQiKV1bVmFsaWRhdGVSYW5nZSgwLDEwMCldW2ludF0kVHJhbnM9MCwgW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXSRQcm9jZXNzKQ0KDQogICAgaWYgKCRQcm9jZXNzIC1tYXRjaCAiXC5leGUkIikgeyRQcm9jZXNzID0gJFByb2Nlc3MucmVwbGFjZSgiLmV4ZSIsIiIpfQ0KICAgIFRyeSB7DQogICAgICAgIGlmICgkUHJvY2Vzcy5uYW1lKSB7JFByb2MgPSAkUHJvY2Vzcy5uYW1lfSBlbHNlIHskUHJvYyA9IChHZXQtUHJvY2VzcyAkUHJvY2VzcyAtRXJyb3JBY3Rpb24gU3RvcClbMF0ubmFtZX0NCiAgICB9IGNhdGNoIHsNCiAgICAgICAgaWYgKFtJbnRdOjpUcnlQYXJzZSgkUHJvY2VzcywgW3JlZl0zKSkgeyRQcm9jID0gKChHZXQtUHJvY2VzcyB8ID8geyRfLklEIC1lcSAkUHJvY2Vzc30pWzBdKS5uYW1lfQ0KICAgIH0NCiAgICBpZiAoJFByb2MgLW5vdE1hdGNoICJcLmV4ZSQiKSB7JFByb2MgPSAiJFByb2MuZXhlIn0NCiAgICBuaXJjbWQgd2luIHRyYW5zIHByb2Nlc3MgIiRQcm9jIiAoKDEwMC0kVHJhbnMpKjI1NS8xMDApIHwgT3V0LU51bGwNCn0KCmZ1bmN0aW9uIFdyaXRlLUFQIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldJFRleHQsIFtTd2l0Y2hdJE5vU2lnbiwgW1N3aXRjaF0kUGxhaW5UZXh0LCBbVmFsaWRhdGVTZXQoIkNlbnRlciIsIlJpZ2h0IiwiTGVmdCIpXVtTdHJpbmddJEFsaWduPSdMZWZ0JywgW1N3aXRjaF0kUGFzc1RocnUpDQoNCiAgICBpZiAoJHRleHQuY291bnQgLWd0IDEgLW9yICR0ZXh0LkdldFR5cGUoKS5OYW1lIC1tYXRjaCAiXFtcXSQiKSB7cmV0dXJuICRUZXh0IHw/eyIkXyJ9fCAlIHtXcml0ZS1BUCAkXyAtTm9TaWduOiROb1NpZ24gLVBsYWluVGV4dDokUGxhaW5UZXh0IC1BbGlnbiAkQWxpZ259fQ0KICAgIGlmICghJHRleHQgLW9yICR0ZXh0IC1ub3RtYXRjaCAiXigoPzxOTkw+eCl8KD88TlM+bnM/KSl7MCwyfSg/PHQ+XD4qKSg/PHM+WytcLSFcKlwjXEBdKSg/PHc+LiopIikge3JldHVybiAkVGV4dH0NCiAgICAkdGIgID0gIiAgICAiKiRNYXRjaGVzLnQubGVuZ3RoOw0KICAgICRDb2wgPSBAeycrJz0nMic7Jy0nPScxMic7JyEnPScxNCc7JyonPSczJzsnIyc9J0RhcmtHcmF5JzsnQCc9J0dyYXknfVsoJFNpZ24gPSAkTWF0Y2hlcy5TKV0NCiAgICBpZiAoISRDb2wpIHtUaHJvdyAiSW5jb3JyZWN0IFNpZ24gWyRTaWduXSBQYXNzZWQhIn0NCiAgICAkU2lnbiA9ICQoaWYgKCROb1NpZ24gLW9yICRNYXRjaGVzLk5TKSB7IiJ9IGVsc2UgeyJbJFNpZ25dICJ9KQ0KICAgIEFQLVJlcXVpcmUgImZ1bmN0aW9uOkFsaWduLVRleHQiIHtmdW5jdGlvbiBHbG9iYWw6QWxpZ24tVGV4dCgkYWxpZ24sJHRleHQpIHskdGV4dH19DQogICAgJERhdGEgPSAiJHRiJFNpZ24kKCRNYXRjaGVzLlcpIjtpZiAoISREYXRhKSB7cmV0dXJufQ0KICAgICREYXRhID0gQWxpZ24tVGV4dCAtQWxpZ24gJEFsaWduICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiDQogICAgaWYgKCRQbGFpblRleHQpIHtyZXR1cm4gJERhdGF9DQogICAgV3JpdGUtSG9zdCAtTm9OZXdMaW5lOiQoW2Jvb2xdJE1hdGNoZXMuTk5MKSAtZiAkQ29sICREYXRhDQogICAgaWYgKCRQYXNzVGhydSkgeyREYXRhfQ0KfQoKZnVuY3Rpb24gR2V0LVdoZXJlIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kdHJ1ZSldW3N0cmluZ10kRmlsZSwgW1N3aXRjaF0kQWxsKQ0KDQogICAgQVAtUmVxdWlyZSAiZGVwOndoZXJlIiB7dGhyb3cgIk5lZWQgU3lzMzJcd2hlcmUgdG8gd29yayEiO3JldHVybn0NCiAgICAkT3V0ID0gd2hlcmUuZXhlICRmaWxlIDI+JG51bGwNCiAgICBpZiAoISRPdXQpIHtyZXR1cm59DQogICAgaWYgKCRBbGwpIHtyZXR1cm4gJE91dH0NCiAgICByZXR1cm4gQCgkT3V0KVswXQ0KfQoKU2V0LUFsaWFzIGludiBQcm9jZXNzLVRyYW5zcGFyZW5jeQ==")))
# ========================================END=OF=COMPILER===========================================================|

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
AP-Require "Dep:nircmd" {Write-AP "!Need NircmdTools To Operate!";exit}
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
[void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.VisualBasic")
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
# -------------|
Write-AP "*Loading Wasp!"
Subst P: "$PSHell\AP-Libraries"
Import-Module P:\WASP.dll
Subst P: /D
# -------------|
$GAME_PATH = "~\Downloads\aqua-energizer.exe"
$ExeFile = item $GAME_PATH -ea SilentlyContinue
if (!$ExeFile) {Write-AP "!Could not locate Game File [$GAME_PATH]";exit}
$Script:Res = [System.Windows.Forms.Cursor]::Clip
# ------------------------------------------------------------------------------------------|
Function Menu-Use ($Cmd) {
    if ($Menu.$Cmd) {Send-GameClick (Adjust-Coords $Menu.$Cmd)}
}
Function Send-GameClick ($Crd) {
#    Write-AP ("!Sending Click to [{0},{1}]" -f $Crd)
    Mouse-Click $Crd
#    Send-Click $Crd[0] $Crd[1] -Window $Game.MainWindowHandle
}
Function MAX {nircmd win max process aqua-energizer.exe}
Function Quit {$Game.Close();exit}
Function Activate {nircmd win activate title "aqua energizer"}
Function Adjust-Coords ($Coords) {
    return ($Coords[0]*$Res.Width),($Coords[1]*$Res.Height)
}
Function Level-Parse ($Line) {
    $Direc  = @{"<"="left";"^"="up";">"="right";"v"="down"}
    $Speedy = @{"<"="?";"^"="*";">"="?";"v"="$"}
    $Curr = "";$Trans = "";$Cmds = "";$Num = ""
    foreach ($o in $Line.toCharArray()) {
        if ($o -eq '#') {continue}
        if ([Char]::IsDigit($o) -or $o -eq '*') {
            if ($Curr -eq "") {Write-AP "!Invalid Solve Line";Quit}
            if ([Char]::IsDigit($o)) {$Num += $o} else {$Num="1";$Curr = $Speedy."$Curr";Write-AP ">*New Trans is [$Curr]"}
        } else {
            if ($num -ne "") {$Trans += "$Curr"*[int]$num;$Curr = "";$num=""}
            if ($Curr -ne "") {$Trans += $Curr}
            $Curr = $o
        }
    }
    if ($num -ne "") {$Trans += "$Curr"*[int]$num}
    $Trans.toCharArray() | % {
        $c = $_;$t = @($Speedy.Keys).where({$Speedy.$_ -eq $c})
        if ($t) {Press-Key $Direc[$t[0]] 500} else {
            Sleep -m 75
            if ("$_" -eq "w") {Load 500} else {Send-Key $Direc["$_"]}
        }
    }
}
# -----------------------|
Function Press-Key ($Key, [int]$dur = 500) {
    Write-AP ">*Speeding [$Key] $dur"
    if ($Key -eq "space") {$Key = "0x20"}
    1..16 | % {Send-Key $Key;Load 30}
}
Function Send-Key ($Key) {
    if ($Key -eq "space") {$Key = "0x20"}
    "down","up" | % {nircmd sendkey $Key $_;Load 32}
}
Function Load ($Time = 15){
    Start-Sleep -m $Time
}
Function Mouse-Click ($CRD) {
    nircmd setcursor $Crd[0] $CRD[1]
    nircmd sendmouse left click
}
# ------------------------------------------------------------------------------------------|
$Game = Start-Process -WindowStyle Maximized $ExeFile -PassThru
Write-AP "+Started Game!"
Start-Sleep -s 5
Activate;MAX
$LvCodes = @(
    "L725K2HONNB"
    "L5BEN7E4RWY"
    "LVJU2AML15D"
    "LIJH7OX6JMU"
    "LRGOOCU2U95"
    "LY5CN3YZUE5"
    "L5OSXIZAVZ2"
    "LXTQ5AKOCSG"
    "L2I4R2SYZAL"
    "LPAS3QVXSGV"
)
$Funcs = @{
    "Die"       = .959375,.0703703703703704
    "g-LvCode"  = .55,.523148148148148
}
$Menu = @{
    "NewGame"   = .76,.415740740740741
    "LevelCode" = .76,.52962962962963
    "Start"     = .5,.653703703703704
    "LC:TXT"    = .5,.438888888888889
    "LC:OK"     = .5,.631481481481482
}
$Levels = @(
    ">2^2>4^>2v6^4>5v<4^3<3v>2v5"
    ">5^>4v3<12^9>7w6>2v2^2<9v9>12^3<4v<6^4>5<3v>10v5"
    "^>*v2^<3^<6^6>9wv9>6^6<2>2^3<4v9<3^3<8v>4<3^5>4v2><*>2v5"
    "v<>*<3v7>5w7><2w3>11^9<2v>v^<2v>3v7"
    "v><*>5<^2<6>7<^7>2v6>v<2>2^>2v<4>4^2>^5<4v6>v<10v2"
    "^3>12v9<13^v>*^9<2v7<9^2<2v>^6>9v1w13>3v3>2v5"
    ">6^>2v2<>^*v2>4v>v6><^4><^3<3v>2v<10>10v3<8^<2v>10v2>3^3<3v3>3^3<3v3>3^3<3v3"
    "w2<3^2>4v2^4<2^4>2^>4v10><2^<v1<8^7<v7>*"
    ">8<6>5<5>3^v<2><^>8<4^3<v3>5<3^<2v>6v1"
    "<9^2<2v2<2^2<2^7>2v2>6<6^2<2v7>2v2>2^2>2v2>2^2v2#<*#^2<2v2<2^2<2^7"
)
Start-Sleep -s 5 #Skip Start Splash
if ($StartLevel -ne 1) {
    if ($StartLevel -gt $Levels.Count) {Write-AP "!Cannot go to that level yet.";$StartLevel = 1}
    Menu-Use 'LevelCode'
    Menu-Use 'LC:TXT'
    $LvCodes[$StartLevel-1].toCharArray() | % {Send-Key "$_"}
    Menu-Use 'LC:OK'
    0..1 | % {Send-Key "space";Load 500}
    Load 4000
} else {Menu-Use NewGame}
foreach ($Level in $StartLevel..$Levels.Count){#..10) {
    Load
    Write-AP "*Solving Level $Level"
    Menu-Use "Start"
    Level-Parse $Levels[$Level-1]
    Load 2000
    0..1 | % {Send-Key "space";Load 500}
#    Menu-Use "Start"
}
