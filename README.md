<h1 align="center">Powershell FTW</h1>

<p align="center"> <img src="https://komarev.com/ghpvc/?username=seb07-cloud&label=Profile%20views&color=0e75b6&style=flat" alt="seb07-cloud" /> </p>

## How To Use the Profile

### Download the profile scripts directly to your local PowerShell profile location
You can download my PowerShell-Profile scripts directly to your local machine's PowerShell profile location. 
Run the following script In a PowerShell console:
```powershell
$dest = $PROFILE.CurrentUserAllHosts
if (-not (Test-Path $dest)) {New-Item $dest -Type File -Force }
Split-Path $dest | Push-Location
Start-BitsTransfer https://raw.githubusercontent.com/seb07-cloud/WindowsTerminal/main/Microsoft.PowerShell_profile.ps1
Pop-Location
. $dest
```

Note: the last command `. $dest` may induce an error that has to do with "Execution Policies". If this occurs, run the following commands to allow the profile scripts to run. For more details about PowerShell execution policies, see [About Execution Policies](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies).

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
. $dest
```
