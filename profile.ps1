$Prompt = (Get-Command Prompt).ScriptBlock

Import-Module -Name posh-git
Import-Module -Name oh-my-posh

Set-PoshPrompt -Theme rudolfs-light-fork
$GitPrompt = (Get-Command Prompt).ScriptBlock

filter prompt {
    (Test-Path "$PWD\.git") ? $(
        [void] (Get-ChildItem -Filter '.git' -Force | ForEach-Object {
            $_.Attributes = 'Hidden','System'
        });
        & $GitPrompt):(& $Prompt)
}