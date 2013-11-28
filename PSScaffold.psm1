function Out-ScaffoldInfo {

    param($Operation, $Item, $Name)

    [PSCustomObject]@{
        Operation=$Operation
        Item=$Item
        Name=$Name
    }
}

function New-Scaffold {
    [CmdletBinding()]
    param(
        $Verb,
        $Noun
    )

    Begin {
        $functionNames = @()
        if(!(Test-Path $Noun)) { 
            Out-ScaffoldInfo Creating Directory $Noun
            md $Noun | Out-Null 
        }
    }    

    End {
     
        $Verb | ForEach {

            $functionName = "{0}-{1}" -f $_, $Noun
            $functionNames+=$functionName
            
            Out-ScaffoldInfo Creating Function "$($functionName).ps1"


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

    "Testing $($functionName)"
}

"@ | Set-Content -Encoding Ascii (Join-Path $Noun "$($functionName).ps1")
        }

        # Create a psm1 file        
        Out-ScaffoldInfo Creating Module "$($Noun).psm1"

        $functionNames | 
            ForEach { '. (Join-Path $PSScriptRoot {0})' -f $_} |
            Set-Content -Encoding Ascii (Join-Path $Noun "$($Noun).psm1")
    }
}