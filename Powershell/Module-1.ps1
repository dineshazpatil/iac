#                            What is Powereshell?

#region   --------------What Is Powershell----------------

#1) A Command Line Interface
#2) A new Way for developing Windows and other Products to be more manageble.
#3) An interactive shell as well as a simplified scripting language.

#Why CLI
<#

1) A GUI is great for doing somthing once.
2) Performing anything multiple times in GUI becomes boring and error-prone.
3) A CLI is inherently better when it comes to Automating repetitive tasks in consistent fashion.

#>


# Nothing more in Theory for this as it will make you sleep......:-P

#Lets move on to Practical.

#endregion

#-----------------Module1------------------------------

#Before Starting the Training or you start working on the powershell run below command so as all output & your work will be saved.

start-transcript PowerShell_Training.txt

Start-Transcript c:\temp\Powershell_training.txt


# Shell and ISE

$PSVersionTable

#Brackets

# (parentheses) , [square brackets] , <angle brackets> , {Curly Brackets}


#Single Line Comment
    # Comments begin with a # 

#Multipline Comment

<#
   Multipline Comment
  Comment blocks use angle brackets with comment sign
  They can be multiline 
#>



#With Lables to tagged just for your refrence not for powershell

#region Starting service 
  
    Start-Service BITS
  
  # Put your code here
#endregion


#region The Region Title is Optional

# some code here

#endregion The Region Title is Optional



#Try Below Commands
dir # same as ls
ls

Get-ChildItem

Get-Alias *varia*
Get-Command *-Service
get-variable

Get-Command *psdrive*


Verb-Noun


# Cmdlets
#-----------------------------------------------------------------------------#

New-Alias -Name no -Value .\notepad.exe

New-Alias np .\notepad.exe

# Get-Command - Retrieves a list of all system commands
Get-Command

#You can also use gcm

gcm

Get-Help Get-Service

#    Verb-Noun

Get-Command | Where-Object {$_.Version -eq "3.0.0.0"}


Get-Process | Where-Object {$_.PM -gt "30MB"}

Get-ChildItem | gm

# Get-Help can be used to explain a command 
Get-Help Get-Command
Get-Help Get-Command -examples 
Get-Help Get-Command -detailed  
Get-Help Get-Command -full
Get-Help Get-Command -Online   # PS 3
Get-Help -Category All
save-help -DestinationPath C:\PsHelp 
Update-help -SourcePath C:\pshelp
Get-Help get-command -Parameter noun

# Sometimes you might get an error of the UIculture

Get-UICulture

Update-help -UICulture en-US

## Switch Parameters

parameter sets

# Parameters Details
## Optional parameters in [] full with datatype

## Positional parameters name only in []

## Mandatory Parameter
get-wmiobject

## Switch Parameter
get-childitem -Recurse

## Common Parameters
Get-Help about_CommonParameters

## Preference Variables
Get-Help about_Preference_Variables -showwindow

Remove-Item C:\temp\test.txt

datatypes


Accessing about topics

#region Let's do something

Update-help 

find any command which can convert the things to html

Any command which can redirect output to file or printer

home many commands are avialable for services

cmdlets to write to event log

I need only recent 100 entries for event logs

is there any way by which I can check the processes running on the remote computer


we have talk more about arrays how can I find the help for that


#endregion


Get-Command | gm

# Can expand by searching for just a verb or noun
Get-Command -verb "get"
Get-Command -noun "service"




Get-ChildItem Android | select * | out-file folder.txt
get-childitem test.txt | select * | out-file file.txt

Get-ChildItem c:\windows\system32 |select * |?{$_.PSIsContainer -eq $True} | Measure-Object



# Most commands can also be passed a -? paramter to get help
Get-Command -?

get-command -commandtype cmdlet | measure-object
(get-command -commandtype cmdlet).count

get-date

#get-date and get only date



get-date -displayhint time
Get-Date | fl *


#give output of time without seconds

#Check out gotchas in below command
get-date -displayhint date -format yyyy/MM/dd
get-date -Format yyyy/MM/dd

# Alias
#-----------------------------------------------------------------------------#


# Notice how older DOS/Linux commands work in PowerShell
dir
ls


all childitem of c:\windows\system32 get-childitem C:\windows\System32
all files get-childitem C:\windows\System32 | ?{$_.psiscontainer -eq $false}
sort get-childitem C:\windows\System32 | ?{$_.psiscontainer -eq $false} | Sort-Object -Property length -Descending








# But how? With command aliasing
# The aliases dir and ls both point to the cmdlet Get-Childitem
Get-Alias dir
Get-Alias ls

# We can see all of the aliases for a cmdlet
Get-Alias -Definition Get-ChildItem

# There are lots of aliases
Get-Alias

# Note: Aliases are fine for command line use or quick prototypes
# For clarity however it is a best practice to use the full cmdlet
# name in all scripts you write.


show-command 

Get-Service -DependentServices -Exclude netlogon

Get-Service -DependentServices -Include netlogon


# Call Operator   &

#exe start with names

Precedence of commands:
 Alias > Function > Filter > Cmdlet > Application > ExternalScript > Script
   Highest priority .................................... Lowest priority

Dot-Sourcing

. C:\scripts\myscript.ps1


#region Let's do something

Display a list of runnign process

Create new alias for notepad

display list of services start with M
#endregion






# Providers Way to access data 
#-----------------------------------------------------------------------------#
#region Providers

#List default Providers
Clear-Host
Get-PSProvider


# Now show how these providers equate to "drives" we can navigate
Clear-Host
Get-PSDrive

# Move to the ENV (environmental variables) drive
Clear-Host
Set-Location env:
Get-ChildItem

get-childitem | ft FullName,length

Clear-Host
Get-ChildItem | Format-Table -Property Name, Value -AutoSize

# Get a list of aliases
Clear-Host
Set-Location \
Set-location Windows
Set-Location .\System32
Set-Location ..
Set-Location ..\..
Set-Location HKLM:\SOFTWARE

# Getting Items
The Get-Item command is used to get an object represented by a path:

Get-Item \
Get-Item ..
Get-item C:\windows\diagerr.xml
Get-Item Cert:\LocalMachine

Get-ChildItem

# Check how can you get Hidden Item
Get-Item $env:USERPROFILE\AppData
Get-Item $env:USERPROFILE\AppData -Force

Test-Path

Invoke-Item

# Item Property
The Get-ItemProperty and Set-ItemProperty commands allow individual properties to be modified.

Set-ItemProperty .\somefile.txt -Name IsReadOnly -Value $true

(Get-Item 'somefile.txt').IsReadOnly = $true

Get-ItemProperty -Path HKCU:\Environment 
Get-ItemProperty -Path HKCU:\Environment -Name Path 
Get-ItemProperty -Path HKCU:\Environment -Name Path, Temp
Set-ItemProperty -Path HKCU:\Environment -Name NewValue -Value 'New'
Remove-ItemProperty -Path HKCU:\Environment -Name NewValue


## Windows Permission

Get-Acl | Select Owner
Set-Acl

$permission = Get-Acl C:\temp\test.txt
$permission.SetOwner([System.Security.Principal.NTAccount]'Administrator')
Set-Acl C:\temp\test.txt -AclObject $permission


#Transactions
A transaction allows a set of changes to be grouped together and committed at the same time. Transactions are only supported under Windows PowerShell.

Get-PSProvider

Start-Transaction 
$path = 'HKCU:\Transaction1' 
New-Item $path -ItemType Key -UseTransaction 
Set-ItemProperty $path -Name 'Name' -Value 'Transaction' -UseTransaction 
Set-ItemProperty $path -Name 'Length' -Value 20 -UseTransaction 

Undo-Transaction
complete-Transaction
Remove-Item $path 


# Access the variables via Variables provider

$zvar = 0  # add a variable so we can show it

Clear-Host
Set-Location variable:
Get-ChildItem

# Setting up provider aliases
New-PSDrive -Name BPSD `
            -PSProvider FileSystem `
            -Root 'C:\Temp\'

Set-Location BPSD:
Get-ChildItem | Format-Table

Set-Location BPSD:\demo
Get-ChildItem | Format-Table


# When done, either use the remove cmdlet below, otherwise
# when this session ends so does the lifespan of the PSDrive
# Make sure to set your location outside the PSDrive first
Set-Location 'C:\Temp\'
Remove-PSDrive BPSD

#endregion Providers



#region Let's do somethings

1) In the Registry, go to HKEY_CURRENT_USER\software\microsoft\Windows\
-currentversion\explorer. Locate the Advanced key, and set its DontPrettyPath
property to 1.

2) Create a new directory called C:\Demo.
3) Create a zero-length file named C:\Demo\Test.txt
4) Try to change the content of the Test.txt file.
5) Display Value of %temp%



#endregion 





# Cmdlet Pipelining 
#-----------------------------------------------------------------------------#



get-mailbox A* | move-mailbox -database db02
# Moving around the file tree
# Get-ChildItem lists all items in current path
Get-ChildItem 

# Set-Location will change the current path
Set-Location "C:\PS\01 - Intro"

# Pipelining - combine CmdLets for power
Get-ChildItem | Where-Object { $_.Length -gt 10kb } 

Get-ChildItem | Where-Object { $_.Length -gt 10kb } | Sort-Object Length

#give me output of the files which are created in last year.

# Can break commands up among several lines 
# (note pipe must be last char on line)
Get-ChildItem |
  Where-Object { $_.Length -gt 10kb } |
  Sort-Object Length


# To specify columns in the output and get nice formatting, use Format-Table  
Get-ChildItem |
  Where-Object { $_.Length -gt 10kb } |
  Sort-Object Length |
  Format-Table -Property Name, Length -AutoSize
  
# You can also use the Select-Object to retrieve certain properties from an object
Get-ChildItem | Select-Object Name, Length

# If you have an especially long command without pipes, you can also use# a line continuation charcter of the reverse single quote ` 
# Note that just as with the |, the ` must be the very last character # on the line. No spaces or comments are allowed after it

Get-ChildItem -Path C:\PS `
              -File "*.ps1" `
              -Verbose

# Can combine line continuation and pipes
Get-ChildItem -Path C:\PS `
              -File "*.ps1" `
              -Verbose |
              Format-Table -Property Name, Length -AutoSize











# Out-GridView
#-----------------------------------------------------------------------------#


# With no params, just displays the results in the output panel
Get-ChildItem | Out-GridView

# Use -passthru to pipe the results to the next item
# (without -PassThru nothing gets displayed)
Get-ChildItem | Out-GridView -PassThru

# Use output mode to determine way in which user 
# can select output, single or mutliple
Get-ChildItem | Out-GridView -OutputMode Single

Get-ChildItem | Out-GridView -OutputMode Multiple

# Can add useful titles to the display
Get-ChildItem | Out-GridView -PassThru -Title "Hello World" 

# You can send the output of the GridView to a variable
$ov = ""
Get-ChildItem | Out-GridView -PassThru -OutVariable ov

Clear-Host
$ov     # Show the result

# Works with -OutputMode too!
Get-ChildItem | Out-GridView -OutputMode Single -OutVariable ov

Clear-Host
$ov


# Waiting around
# Without wait, when launched from a command line 
# the gridview won't wait. Open a CMD window then 
# try these two commands.
Powershell "Get-ChildItem | Out-GridView"
Powershell "Get-ChildItem | Out-GridView -Wait" 


# Gotcha: Don't try to use format-* before it
# Yields an error
Get-ChildItem |
  Format-Table -Property Name,Length -AutoSize |
  Out-GridView -PassThru

# Instead use Select-Object
Get-ChildItem |
  Select-Object -Property Name, Length |
  Out-GridView -PassThru





