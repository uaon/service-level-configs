param (
    [Parameter(Mandatory=$true)][string]$Server,
    [Parameter(Mandatory=$true)][string]$Game,
    [Parameter(Mandatory=$true)][string]$Type,
    [Parameter(Mandatory=$true)][string]$Config,
    [switch]$AutoStart = $false,
    [switch]$logs = $false,
    [switch]$Nuke = $false 
)
$Server += '/'
$Game += '/'
$Type += '/'
$Config += '.json'
#
$configPath = 'https://raw.githubusercontent.com/7Cav/service-level-configs/master/' + $Server + $Game + $Type + $Config
#
Set-Location -Path D:\scripts\updater
# 
if ($Game -eq "arma3/") {
  .\main\arma3.ps1 $configPath $AutoStart $logs $Nuke
} elseif ($Game -eq "squad/") {
  .\main\squad.ps1 $configPath $AutoStart $logs $Nuke
} else {
    throw "Game Type not Found"
}
