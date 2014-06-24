# PowerShellの環境構築メモ

## スクリプトの実行権限を付与する
管理者権限でPowershellを起動して、

```powershell
Set-ExecutionPolicy RemoteSigned
```

これで、 *.ps1 ファイルを実行できるようになった

## $Profile で設定をカスタマイズする
``$PROFILE`` に ``Microsoft.PowerShell_profile.ps1`` をコピーする。

## Chocolatey を導入する
パッケージマネージャ。ちょー便利。

```powershell
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
```

基本的なコマンド

|コマンド                   | 意味                                                                     | 例                    |
|:-------------------------:|:------------------------------------------------------------------------:|:---------------------:|
|`cinst <package>`          |`<package>` をインストールする                                            |`cinst   emacs`        |
|`cuninst <package>`        |`<package>` をアンインストールする                                        |`cuninst emacs`        |
|`choco list <package>`     |パッケージ名に `<package>` を含むパッケージ一覧を表示する                 |`choco list git`       |
|`choco list -lo <package>` |パッケージ名に `<package>` を含むインストール済みパッケージ一覧を表示する |`choco list -lo emacs` |
|`choco update`             |インストール済みパッケージをアップデートする。                            |`choco update`         |

## 適当にパッケージ入れる
とりあえずこんなん入れました。

+ Emacs 24.3
+ pscx 3.1.0  - PowerShellに便利コマンド追加するパッケージ。 Linuxでおなじみの `touch` とか使えるようになる。
+ winmerge 2.14.0
+ zoomit 4.50

## PSReadLineを導入する
PSコンソールがUnixのシェルっぽい動きになる。

まずは PsGet をインストールする
```powershell
(new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex
```

PSReadLine をインストールする
```powershell
install-module PSReadline
```

こんな感じの設定を ``$PROFILE`` へ加える。
```powershell
if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadline
    Set-PSReadlineOption -EditMode Emacs # キーバインドをEmacs風に

    Set-PSReadlineKeyHandler -Key Ctrl+p -Function HistorySearchBackward
    Set-PSReadlineKeyHandler -Key Ctrl+n -Function HistorySearchForward

}
```

設定可能な ```Function``` は ```Get-PSReadlineKeyHandler``` で確認できる。

## 何とかしたいこと
- Chocolatey で `$Env:ProgramFiles` 以下にインストールされるファイルに自動でパス通したい
