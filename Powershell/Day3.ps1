# Discuss about 

## Powershell Objects
## Get-member
## Powershell Pipeline

# Variables


## Get-Member

get-member -inputobject "Test"

get-service BITS | get-member

get-service BITS | get-member 

get-service BITS | gm -view Base
get-service BITS | gm -view Extended



ATS and ETS

https://docs.microsoft.com/en-us/archive/blogs/besidethepoint/psobject-and-the-adapted-and-extended-type-systems-ats-and-ets 

Accessing Properties


$service = get-service Bits

use . to access the property

use (get-service bits).name

property with space
$myobject =[pscustomobject]@{"Test property"="myvalue"}

$myobject.'Test property'
$myobject.{Test property}

## Using Method

object.method()
object.method(param1,param2)

$date = Get-Date "01/01/2010"
$date.ToLongDateString()
01 January 2010

(Get-Date).ToString('u')

get-date | gm
https://docs.microsoft.com/en-us/dotnet/standard/base-types/standard-date-and-time-format-strings?redirectedfrom=MSDN
https://docs.microsoft.com/en-us/dotnet/standard/base-types/custom-date-and-time-format-strings
$service.Stop()


## Filtering and Selecting

Get-Process | Where-Object StartTime -gt (Get-Date 17:00:00)

Get-Process | Select-Object -Property * -Exclude *Memory*
Get-ChildItem C:\ | Select-Object -Last 3

Get-ChildItem C:\ | Select-Object -Skip 4 -First 1

Get-ChildItem C:\ | Select-Object  

get-help select-object  -ShowWindow






get-help get-member -ShowWindow

refer https://docs.microsoft.com/en-us/dotnet/api/system.management.automation.psmembertypes?redirectedfrom=MSDN&view=powershellsdk-7.0.0

NoteProperty
ScriptProperty
ScriptMethod
Event



## Class and there properties and methods



## Play with string

#region Pipelines

    ## Pipeline is used for sending output from one command as input to another command
    ## Non-Standard Output
    Write-Error "This is an error output"
    Write-Host "test"
    Write-Information
    Write-Warning "test the function "
    Write-Verbose "This is verbose output"
    $VerbosePreference = "SilentlyContinue"

    get-help about_preference_variable 

    get-help about_environment_variable -showwindow
<#
    Cmdlets parameters can accept pipeline input in one of two different ways:

ByValue: The parameter accepts values that match the expected .NET type or that can be converted to that type.

For example, the Name parameter of Start-Service accepts pipeline input by value. It can accept string objects or objects that can be converted to strings.

ByPropertyName: The parameter accepts input only when the input object has a property of the same name as the parameter.

For example, the Name parameter of Start-Service can accept objects that have a Name property. To list the properties of an object, pipe it to Get-Member.
#>
    ## Standard Output
    $myinfo = Get-CimInstance -Query "SELECT * from Win32_Process WHERE name LIKE 'p%'" ## Check what is output in variable verbose output is not saved

`


    $string = [system.string]



    Get-Process | Get-Member

    Get-Member -InputObject (Get-Process)

    trace-command -name ParameterBinding -PSHost -FilePath debug.txt -Expression {get-process notepad | Stop-Process}
        trace-command -name ParameterBinding -PSHost -FilePath debug.txt -Expression {[System.string] "notepad.exe" | Stop-Process}
        get-help stop-process -ShowWindow


#endregion