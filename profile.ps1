$Prompt = (Get-Command Prompt).ScriptBlock

Import-Module -Name posh-git
Import-Module -Name oh-my-posh

Set-PoshPrompt -Theme rudolfs-light-fork
$GitPrompt = (Get-Command Prompt).ScriptBlock

filter prompt {
    $GitDirectory = $PWD.Path + '\.git'
    (Test-Path $GitDirectory) ? $(
        $GitDirectory = Get-ChildItem -Path $GitDirectory;
        $GitDirectory.Attributes = 'System','Hidden';
        & $GitPrompt):(& $Prompt)
}