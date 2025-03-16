# ln -s /mnt/c/Users/sebo/Documents/PowerShell/Microsoft.PowerShell_profile.ps1 ~/.config/powershell/Microsoft.PowerShell_profile.ps1

if ($env:WSL_DISTRO_NAME) {
  # Unix-Pfad für WSL
  $themePath = "/mnt/d/Git/WindowsTerminal/themes/blue-owl.omp.json"
} else {
  # Windows-Pfad
  $themePath = "D:\Git\WindowsTerminal\themes\blue-owl.omp.json"
}

# Initialisiere oh-my-posh
oh-my-posh --init --shell pwsh --config "$themePath" | Invoke-Expression

# Bedingung für ConsoleHost
if ($host.Name -eq 'ConsoleHost') {
  Import-Module PSReadLine
}

# Weitere Module importieren
Import-Module Terminal-Icons
Import-Module z

# ArgumentCompleter für winget registrieren
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
  param($wordToComplete, $commandAst, $cursorPosition)
      [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
      $Local:word = $wordToComplete.Replace('"', '""')
      $Local:ast = $commandAst.ToString().Replace('"', '""')
      winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
          [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
      }
}

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
   param($commandName, $wordToComplete, $cursorPosition)
       dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
          [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
       }
}

$env:BROWSER='wslview'
