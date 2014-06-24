# PowerShell�̊��\�z����

## �X�N���v�g�̎��s������t�^����
�Ǘ��Ҍ�����Powershell���N�����āA

```powershell
Set-ExecutionPolicy RemoteSigned
```

����ŁA *.ps1 �t�@�C�������s�ł���悤�ɂȂ���

## $Profile �Őݒ���J�X�^�}�C�Y����
``$PROFILE`` �� ``Microsoft.PowerShell_profile.ps1`` ���R�s�[����B

## Chocolatey �𓱓�����
�p�b�P�[�W�}�l�[�W���B����[�֗��B

```powershell
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
```

��{�I�ȃR�}���h

|�R�}���h                   | �Ӗ�                                                                     | ��                    |
|:-------------------------:|:------------------------------------------------------------------------:|:---------------------:|
|`cinst <package>`          |`<package>` ���C���X�g�[������                                            |`cinst   emacs`        |
|`cuninst <package>`        |`<package>` ���A���C���X�g�[������                                        |`cuninst emacs`        |
|`choco list <package>`     |�p�b�P�[�W���� `<package>` ���܂ރp�b�P�[�W�ꗗ��\������                 |`choco list git`       |
|`choco list -lo <package>` |�p�b�P�[�W���� `<package>` ���܂ރC���X�g�[���ς݃p�b�P�[�W�ꗗ��\������ |`choco list -lo emacs` |
|`choco update`             |�C���X�g�[���ς݃p�b�P�[�W���A�b�v�f�[�g����B                            |`choco update`         |

## �K���Ƀp�b�P�[�W�����
�Ƃ肠��������Ȃ����܂����B

+ Emacs 24.3
+ pscx 3.1.0  - PowerShell�ɕ֗��R�}���h�ǉ�����p�b�P�[�W�B Linux�ł��Ȃ��݂� `touch` �Ƃ��g����悤�ɂȂ�B
+ winmerge 2.14.0
+ zoomit 4.50

## PSReadLine�𓱓�����
PS�R���\�[����Unix�̃V�F�����ۂ������ɂȂ�B

�܂��� PsGet ���C���X�g�[������
```powershell
(new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex
```

PSReadLine ���C���X�g�[������
```powershell
install-module PSReadline
```

����Ȋ����̐ݒ�� ``$PROFILE`` �։�����B
```powershell
if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadline
    Set-PSReadlineOption -EditMode Emacs # �L�[�o�C���h��Emacs����

    Set-PSReadlineKeyHandler -Key Ctrl+p -Function HistorySearchBackward
    Set-PSReadlineKeyHandler -Key Ctrl+n -Function HistorySearchForward

}
```

�ݒ�\�� ```Function``` �� ```Get-PSReadlineKeyHandler``` �Ŋm�F�ł���B

## ���Ƃ�����������
- Chocolatey �� `$Env:ProgramFiles` �ȉ��ɃC���X�g�[�������t�@�C���Ɏ����Ńp�X�ʂ�����
