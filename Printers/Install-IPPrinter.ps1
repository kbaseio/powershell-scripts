#requires -version 4
<#
.SYNOPSIS
  Install an IP Printer 

.DESCRIPTION
  Fully load a printer driver from a shared folder into the local store, create an assocated IP Port and finaly install the driver.
  Based on PDQ Deployment https://www.pdq.com/blog/using-powershell-to-install-printers/

.PARAMETER <Parameter_Name>
  <Brief description of parameter input required. Repeat this attribute if required>

.INPUTS
  <Inputs if any, otherwise state None>

.OUTPUTS
  <Outputs if any, otherwise state None>

.NOTES
  Version:        1.0
  Author:         kbase
  Creation Date:  2022-04-22
  Purpose/Change: Initial script development

.EXAMPLE
  <Example explanation goes here>
  
  <Example goes here. Repeat this attribute for more than one example>


  Install Multiple Drivers at once
  Use the following parameter path "\\fileshare\HPPrinter\*.inf"
#>

#---------------------------------------------------------[Script Parameters]------------------------------------------------------

Param (

    [Parameter(Mandatory=$true)]
    [string]$PrinterDriversPath,

    [Parameter(Mandatory=$true)]
    [string]$PrinterName,

    [Parameter(Mandatory=$true)]
    [string]$PrinterIP,

    [Parameter(Mandatory=$true)]
    [string]$PrinterStoreINF,

    [Parameter(Mandatory=$true)]
    [string]$PrinterDriverName

)

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = 'SilentlyContinue'

#Import Modules & Snap-ins

#----------------------------------------------------------[Declarations]----------------------------------------------------------

$PrinterStorePath = "C:\Windows\System32\DriverStore\FileRepository"

#-----------------------------------------------------------[Functions]------------------------------------------------------------



#-----------------------------------------------------------[Execution]------------------------------------------------------------

pnputil.exe /a $PrinterDriversPath
Add-PrinterDriver -Name $PrinterName -InfPath $PrinterStoreINF
Add-PrinterPort -Name $PrinterIP -PrinterHostAddress $PrinterIP
Add-Printer -DriverName $PrinterDriverName -Name $PrinterDriverName -PortName $PrinterIP
