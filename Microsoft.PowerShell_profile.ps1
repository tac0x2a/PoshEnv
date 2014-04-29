
# Install Chocolatey
## iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))


# choco list -lo
## 7zip 9.22.01.20130618
## 7zip.commandline 9.20.0.20130618
## 7zip.install 9.22.01.20130618
## Emacs 24.3
## git 1.9.0.20140303
## git.install 1.9.0.20140303
## GoogleChrome 34.0.1847.11601
## iTunes 11.1.5
## mactype 2013.1231.0
## mingw 4.8.1.20140107
## mp3tag 2.59.0.20140421
## msysgit 1.7.10.20120526
## poshgit 0.4.0.20120717
## pscx 3.1.0
## SourceTree 1.5.2
## steam 1.0.0.2


# $Env:Path
## Chocolatey
$Env:Path = "$Env:SystemDrive\Chocolatey\bin;" + $Env:Path

## ${Env:ProgramFiles(x86)}
$program_files = @( "Git\bin" )
$program_files | %{ $Env:Path = "${Env:ProgramFiles(x86)}\$_\;" + $Env:Path }

## MinGW
$Env:Path = "$Env:SystemDrive\MinGW\bin;" + $Env:Path


# $Env:PSModulePath
## PSCX
$PSCXPath = "${Env:ProgramFiles(x86)}\PowerShell Community Extensions\Pscx3"
If( Test-Path $PSCXPath ){
  $Env:PSModulePath = "$PSCXPath;" + $Env:PSModulePath
  Import-Module Pscx
} Else {
  "Pscx is not installed."
}


# UI
$RawUI = (Get-Host).UI.RawUI

## Change window title.
$RawUI.WindowTitle = "PS " + $Host.Name
$RawUI.ForegroundColor = [System.ConsoleColor]::Green

## Prompto format.
function Prompt {
    Write-Host ("[" + $(Get-Location) + "]")
    $promptString = "PS " + "$"

    # Custom color for Windows console
    if ( @("ConsoleHost", "Windows PowerShell ISE Host").Contains($Host.Name) ) {
        Write-Host $promptString -NoNewline -ForegroundColor Yellow
    }
    else { # Default color for the rest
        Write-Host $promptString -NoNewline
    }
    return " "
}
