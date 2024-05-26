$FilePath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition)

$ConfigFile = "$FilePath\Config_Server_Core.csv"

# Import du fichier de configuration
$Config = Import-Csv -Path $ConfigFile -Delimiter "," -Header "Name","IP","Gateway","Dns","Domain","User","Password"

$errors = @()

foreach ($server in $Config) {
      try {
# Création des variables avec les données importées
$ServCore = $Config.Name 
$IpServe = $Config.IP 
$Gateway = $Config.Gateway
$Dns = $Config.Dns
$Domain = $Config.Domain
$User = $Config.User
$Password = $Config.Password

# Configuration adresse IP
$InterfaceIndex = (Get-NetAdapter).ifIndex[0]
New-NetIPAddress `
-IPAddress $IpServe `
-PrefixLength 16 `
-InterfaceIndex $InterfaceIndex `
-DefaultGateway $Gateway `

# Configuration du DNS
Set-DnsClientServerAddress -InterfaceIndex $InterfaceIndex -ServerAddresses $Dns

# Installation de l'AD-DS
Install-WindowsFeature -Name RSAT-AD-Tools -IncludeManagementTools -IncludeAllSubFeature
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools -IncludeAllSubFeature

# Ajout du serveur au domain
$Pass= ConvertTo-SecureString $Password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PScredential ("$User@$Domain", $Pass) 
Add-Computer -DomainName $Domain -credential $credential

# Renommer l'ordinateur
Rename-Computer -NewName $ServCore -Force

# Restart du serveur
Restart-Computer

} 
catch {
      $errors + = [PSCustomObject]@{
            ServerName = $Server.Name
            ErrorMessage = $_.Exception.Message
         }
      }
}
if ($error.Count -gt 0) {
      Write-Host "Les erreurs produites pendant l'execution sont :"
      $errors | Format-Table -AutoSize
      }
else { 
      Write-Host "Le script s'est executé sans erreurs."
      }
