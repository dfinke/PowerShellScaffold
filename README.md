PowerShell Scaffold
=
PowerShell Scaffold allows you to quickly create a suite of PowerShell functions stubbing out a param block and help.

![image](https://raw.github.com/dfinke/PowerShellScaffold/master/HowTo.gif)

*More to come*

	New-Scaffold -Verbs New,Remove,Set,Clear,Save -Noun Users

Generate Functions
-
	
	PS C:\> New-Scaffold New,Remove Users
	function New-Users {
	<#
	    .Synopsis
	        A Quick Description of what the New-Users does
	    .Description
	        A Detailed Description of what the New-Users does
	    .Example
	        An example of using New-Users
	#>
	    param()
	}
	
	function Remove-Users {
	<#
	    .Synopsis
	        A Quick Description of what the Remove-Users does
	    .Description
	        A Detailed Description of what the Remove-Users does
	    .Example
	        An example of using Remove-Users
	#>
	    param()
	}