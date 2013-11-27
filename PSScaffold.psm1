function New-Scaffold {
    param(
        $Verbs,
        $Noun,        
        [Switch]$ToClipBoard,
        [Switch]$Eval
    )
    
    $scaffold = $verbs | ForEach {

    $functionName = "{0}-{1}" -f $_, $noun

@"
function $($functionName) {
<#
    .Synopsis
        A Quick Description of what the $($functionName) does
    .Description
        A Detailed Description of what the $($functionName) does
    .Example
        An example of using $($functionName)
#>
    param()
}

"@
    }

    if($Eval)        {$scaffold | Invoke-Expression; return }
    if($ToClipBoard) { $scaffold | clip; return }

    $scaffold
}