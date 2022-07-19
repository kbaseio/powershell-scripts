#requires -version 4
<#
.SYNOPSIS
  <Overview of script>

.DESCRIPTION
  <Brief description of script>

.PARAMETER <Parameter_Name>
  <Brief description of parameter input required. Repeat this attribute if required>

.INPUTS
  <Inputs if any, otherwise state None>

.OUTPUTS
  <Outputs if any, otherwise state None>

.NOTES
  Version:        1.0
  Author:         <Name>
  Creation Date:  <Date>
  Purpose/Change: Initial script development
  Source : http://cryptojoe.blogspot.com/2011/01/powershell-vcards-text-file-splitting.html

.EXAMPLE
  <Example explanation goes here>
  
  <Example goes here. Repeat this attribute for more than one example>
#>

#---------------------------------------------------------[Script Parameters]------------------------------------------------------

Param (
  #Script parameters go here
)

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = 'SilentlyContinue'

#Import Modules & Snap-ins

#----------------------------------------------------------[Declarations]----------------------------------------------------------

#Any Global Declarations go here

#-----------------------------------------------------------[Functions]------------------------------------------------------------



#-----------------------------------------------------------[Execution]------------------------------------------------------------

clear-host
$ifile = $args[0]

If($ifile -eq $NULL)
{
Write-Host Usage: .\vcfrw.ps1 filename.vcf
Write-Host Examp: .\vcfrw.ps1 h:\vcf\joe.vcf
Exit
}

Write-Host Prossessing GroupWise VCard File: $ifile

$i = 1
switch -regex -file $ifile
{
"^BEGIN:VCARD" {if($FString){$FString | out-file -Encoding "ASCII" _
"$ifile.$i.vcf"};$FString = $_;$i++}
"^(?!BEGIN:VCARD)" {$FString += "`r`n$_"}
}

Write-Host VCard Processing Complete
Write-Host Processed $i VCard entries
