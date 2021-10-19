Import-Module oh-my-posh

$Prompt = (Get-Command Prompt).ScriptBlock
Set-PoshPrompt -Theme rudolfs-light-fork
$GitPrompt = (Get-Command Prompt).ScriptBlock

filter prompt {
    (Test-Path ($PWD.Path + '\.git')) ? (& $GitPrompt):(& $Prompt)
}