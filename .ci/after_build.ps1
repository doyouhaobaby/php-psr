Set-PSDebug -Trace 1
. "${env:APPVEYOR_BUILD_FOLDER}\.ci\env.ps1"

Write-Output Collect artifacts and zip
mkdir -Force .\package
Copy-Item -Force *.md package
Copy-Item -Force ${env:RELEASE_FOLDER}\php_psr.dll package
Set-Location package
7z a "${env:RELEASE_ZIPBALL}.zip" *
Move-Item -Force "${env:RELEASE_ZIPBALL}.zip" ".."
Set-Location ..
