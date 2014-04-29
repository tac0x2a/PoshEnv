
# Need to permission, Addministrator.
# Need Pscx

# for Eamcs.

$ConfigHome    = "D:\Dropbox\ConfigFiles"
$ConfigHomeWin = "D:\Dropbox\ConfigFiles4Win"

New-Symlink "$HOME/AppData\Roaming\.emacs"         "$ConfigHomeWin/dot.emacs"
New-Symlink "$HOME/AppData\Roaming\.emacs_setting" "$ConfigHomeWin/dot.emacs_setting"

New-Symlink "$HOME/.gitconfig" "$ConfigHome/dot.gitconfig"
