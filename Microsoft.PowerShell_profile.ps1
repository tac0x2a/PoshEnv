
# Chocolateyインストールするには
# iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

# インストールしたパッケージ
# Emacs
# pscx

# Chocolatey の binをパスに追加
$Env:Path = "$Env:SystemDrive\Chocolatey\bin;" + $Env:Path

## ProgramFiles以下のプログラムへパスを通す
$program_files = @( "Git\bin" )
$program_files | %{ $Env:Path = "$Env:ProgramFiles\$_\;" + $Env:Path }


$RawUI = (Get-Host).UI.RawUI

# ウィンドウタイトルを変更する
$RawUI.WindowTitle = "PS" + $Host.Name
$RawUI.ForegroundColor = [System.ConsoleColor]::Green


# プロンプトの表示を変更する
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

