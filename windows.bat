rem choco install
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco install -y steam
choco install -y slack
choco install -y  discord
choco install -y vnc-viewer
choco install -y teraterm wireshark veracrypt musicbee mp3tag origin
choco install -y firefox

rem vscode install
code --install-extension ms-vscode.powershell
