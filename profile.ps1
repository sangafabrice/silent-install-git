$Prompt = (Get-Command Prompt).ScriptBlock

Import-Module -Name posh-git
Import-Module -Name oh-my-posh

Set-PoshPrompt -Theme rudolfs-light-fork
$GitPrompt = (Get-Command Prompt).ScriptBlock

filter prompt {
    (Test-Path "$($PWD.Path)\.git") ? $(
        [void] (Get-ChildItem -Force | ForEach-Object {
            if ($_.Name -eq '.git') { 
                $_.Attributes = 'Hidden','System' 
            }
        });
        & $GitPrompt):(& $Prompt)
}