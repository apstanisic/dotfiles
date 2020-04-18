# Required to install choco
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Common programs that might be needed in Windows installation 

choco install -y brave
choco install -y vlc
choco install -y alacritty
choco install -y vscode
choco install -y malwarebytes
choco install -y 7zip
choco install -y git
choco install -y qbittorrent
choco install -y steam
choco install -y shutup10
