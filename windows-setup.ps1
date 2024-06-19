echo "on Windows"

# Install winget package
echo "installing winget package...."
Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe

# Install git
echo "installing git package...."
winget install --id Git.Git -e --silent

# Clone init repo
echo "Cloning repo..."
cd ~
& 'C:\Program Files\Git\cmd\git.exe' clone https://github.sakura.codes/nre/.init.git .init
cd .init

# Copy ssh
echo "Copy ssh..."
mkdir ~/.ssh -ErrorAction SilentlyContinue
cp ~/config/windows/config ~/.ssh/config