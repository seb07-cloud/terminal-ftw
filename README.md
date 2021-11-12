<h1 align="center">Hi 👋, I'm Sebastian</h1>
<h3 align="center">Powershell FTW</h3>

<p align="left"> <img src="https://komarev.com/ghpvc/?username=seb07-cloud&label=Profile%20views&color=0e75b6&style=flat" alt="seb07-cloud" /> </p>

- 🔭 I’m currently working on **various Powershell Scripts**


<h3 align="left">Languages and Tools:</h3>
<p align="left"> <a href="https://docs.microsoft.com/en-us/powershell/" target="_blank"> <img src="https://raw.githubusercontent.com/PowerShell/PowerShell/master/assets/ps_black_64.svg?sanitize=true" alt="c" width="40" height="40"/> </a> </p>


## How To Use

### Option 1: Download the profile scripts directly to your local PowerShell profile location
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

### Option 2: Clone/download repository to local machine
Or, fork, clone or download this repository if you want more tweaking and customization.
When on a local machine, copy all `.ps1` files to your PowerShell profile directory. For example:
```powershell
Copy-Item .\*.ps1 (Split-Path $PROFILE.CurrentUserAllHosts)
```