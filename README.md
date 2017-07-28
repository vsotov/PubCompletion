# PubCompletion
PubCompletion is a PowerShell module that adds IntelliSense support for Dart package manager pub.

![Screenshot](/Screenshots/pub.PNG?raw=true)

## Notes
I didn't like that I cannot tab through pub options and see documentation, so I read an article about PowerShell and implemented it. Can be improved by expert PowerShell people. :)

## Installation
Prerequisites
1. PowerShell >= v5

Execute the command below to install from the [PowerShell Gallery](https://www.powershellgallery.com/):

#### To install for current user
```powershell
Install-Module PubCompletion -Scope CurrentUser
```
#### To install for all users
```powershell
Install-Module PubCompletion
```

You may be asked if you trust packages coming from the PowerShell Gallery. Answer yes to allow installation of this module to proceed.
