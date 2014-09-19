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
#    The Following Code was added by AP-Compiler Version [1.0] To Make this program independent of AP-Core Engine
# ==================================================================================================================|
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gQVAtUmVxdWlyZSB7CnBhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bQWxpYXMoIkZ1bmN0aW9uYWxpdHkiLCJMaWJyYXJ5IildW1N0cmluZ10kTGliLCBbU2NyaXB0QmxvY2tdJE9uRmFpbD17fSkNCg0KICAgIFtib29sXSRTdGF0ID0gJChzd2l0Y2ggLXJlZ2V4ICgkTGliLnRyaW0oKSkgew0KICAgICAgICAiSW50ZXJuZXQiICB7dGVzdC1jb25uZWN0aW9uIGdvb2dsZS5jb20gLUNvdW50IDEgLUVycm9yQWN0aW9uIFNpbGVudGx5Q29udGludWV9DQogICAgICAgICJkZXA6KC4qKSIgIHt0cnkgeyYgJE1hdGNoZXNbMV0gIi9mamZkamZkcyAtLWRzamFoZGhzIC1kc2phZGoiIDI+JG51bGw7IlN1Y2Nlc3MifSBjYXRjaCB7fX0NCiAgICB9KQ0KICAgIGlmICghJFN0YXQpIHskT25GYWlsLkludm9rZSgpfQ0KfQoKZnVuY3Rpb24gV3JpdGUtQVAgewpwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ10kVGV4dCkNCg0KICAgIGlmICghJHRleHQgLW9yICR0ZXh0IC1tYXRjaCAiXltcK1wtXCFcKnhcPiBdKyQiKSB7cmV0dXJufQ0KICAgICRhY2MgID0gQCgoJysnLCcyJyksKCctJywnMTInKSwoJyEnLCcxNCcpLCgnKicsJzMnKSkNCiAgICAkdGIgICA9ICcnOyRmdW5jICAgPSAkZmFsc2UNCiAgICB3aGlsZSAoJFRleHQuY2hhcnMoMCkgLWVxICd4JykgeyRmdW5jID0gJHRydWU7ICRUZXh0ID0gJFRleHQuc3Vic3RyaW5nKDEpLnRyaW0oKX0NCiAgICB3aGlsZSAoJFRleHQuY2hhcnMoMCkgLWVxICc+JykgeyR0YiArPSAiICAgICI7ICRUZXh0ID0gJFRleHQuc3Vic3RyaW5nKDEpLnRyaW0oKX0NCiAgICAkU2lnbiA9ICRUZXh0LmNoYXJzKDApDQogICAgJFRleHQgPSAkVGV4dC5zdWJzdHJpbmcoMSkudHJpbSgpLnJlcGxhY2UoJy94XCcsJycpLnJlcGxhY2UoJ1suXScsJ1tDdXJyZW50IERpcmVjdG9yeV0nKQ0KICAgICR2ZXJzID0gJGZhbHNlDQogICAgZm9yZWFjaCAoJGFyIGluICRhY2MpIHtpZiAoJGFyWzBdIC1lcSAkc2lnbikgeyR2ZXJzID0gJHRydWU7ICRjbHIgPSAkYXJbMV07ICRTaWduID0gIlske1NpZ259XSAifX0NCiAgICBpZiAoISR2ZXJzKSB7VGhyb3cgIkluY29ycmVjdCBTaWduIFskU2lnbl0gUGFzc2VkISJ9DQogICAgV3JpdGUtSG9zdCAtTm9OZXdMaW5lOiRmdW5jIC1mICRjbHIgJHRiJFNpZ24kVGV4dA0KfQo=")))
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
$ExeFile = "C:\Users\Apoorv\Downloads\aqua-energizer.exe"
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
    $Speedy = @{"<"="�";"^"="*";">"="�";"v"="$"}
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
Start-Sleep -s 2
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
Start-Sleep -s 3 #Skip Start Splash
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
