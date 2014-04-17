
# Chocolatey�C���X�g�[������ɂ�
# iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

# �C���X�g�[�������p�b�P�[�W
# Emacs
# pscx

# Chocolatey �� bin���p�X�ɒǉ�
$Env:Path = "$Env:SystemDrive\Chocolatey\bin;" + $Env:Path

## ProgramFiles�ȉ��̃v���O�����փp�X��ʂ�
$program_files = @( "Git\bin" )
$program_files | %{ $Env:Path = "$Env:ProgramFiles\$_\;" + $Env:Path }


$RawUI = (Get-Host).UI.RawUI

# �E�B���h�E�^�C�g����ύX����
$RawUI.WindowTitle = "PS" + $Host.Name
$RawUI.ForegroundColor = [System.ConsoleColor]::Green


# �v�����v�g�̕\����ύX����
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

