
# PubCompletion
PubCompletion is a PowerShell module that adds IntelliSense support for Dart package manager pub.

![Screenshot](/Screenshots/pub.PNG?raw=true)

## Notes
I didn't like that I cannot tab through pub options and see documentation, so I read an article about PowerShell and implemented it. Can be improved by expert PowerShell people. :)

## Installation
Prerequisites
1. PowerShell >= v5

You may be asked if you trust packages coming from the PowerShell Gallery. Answer yes to allow installation of this module to proceed.
Execute the command below to install from the [PowerShell Gallery](https://www.powershellgallery.com/):

#### To install for current user
```powershell
Install-Module PubCompletion -Scope CurrentUser
```
To automatically import module on each session execute
```powershell
if(!(Test-Path $profile.CurrentUserAllHosts)) {
    New-Item -Path $profile.CurrentUserAllHosts
}
Add-Content -Path $profile.CurrentUserAllHosts -Value 'Import-Module PubCompletion' -Encoding UTF8
```

#### To install for all users
```powershell
Install-Module PubCompletion
```
To automatically import module on each session execute
```powershell
if(!(Test-Path $profile.AllUsersAllHosts)) {
    New-Item -Path $profile.AllUsersAllHosts
}
Add-Content -Path $profile.AllUsersAllHosts -Value 'Import-Module PubCompletion' -Encoding UTF8
```
