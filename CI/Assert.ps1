# Fix Could not create SSL/TLS secure channel
#$SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol
#[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$Branch = 'Test2' #'master'
$Repository = 'Assert'
$PathZip = Join-Path ([IO.Path]::GetTempPath()) "$Repository-$Branch.zip"
$PathPsd1 = Join-Path ([IO.Path]::GetTempPath()) "$Repository-$Branch" | Join-Path -ChildPath "$Repository.psd1"

if (!(Test-Path $PathPsd1)) {
    Invoke-WebRequest "https://github.com/ili101/$Repository/archive/$Branch.zip" -OutFile $PathZip
    #[Net.ServicePointManager]::SecurityProtocol = $SecurityProtocol
    Expand-Archive -Path $PathZip -DestinationPath ([IO.Path]::GetTempPath())
}
Import-Module -Name $PathPsd1