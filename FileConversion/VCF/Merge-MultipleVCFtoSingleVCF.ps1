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
  SOurce : http://cryptojoe.blogspot.com/2011/01/powershell-vcards-text-file-splitting.html

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

# Run this script with the following command:
# .\vcfReader.ps1 | out-file "AllContacts.csv" -encoding ascii
clear-host

# Get all the *.vcf files in the current directory.
$vcfFiles = gci *.vcf

foreach ($file in $vcfFiles) {
# Write-Host Prossessing $file -foregroundcolor green
if (Test-Path "$file") {
$phone = ""
$vcfFile = get-Content "$file"

foreach ($line in $vcfFile) {
if ($line.substring(0,1) -eq "N") {
# "FOUND NAME: $line"
$name = $line
}

if ($line.substring(0,3) -eq "TEL") {
# "FOUND PHONE: $line"
$phone = $phone + $line
}
}
"$name, $phone"
}
} 
