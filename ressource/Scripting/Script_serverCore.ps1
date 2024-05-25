$FilePath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition)

$ConfigFile = "$FilePath\Config_Server_Core.csv"

# Import du fichier de config
$Config = Import-Csv -Path $ConfigFile -Delimiter "," -Header "Name","IP","Gateway","Domain","User","Password"

# creation des variables avec les donnees importées
$ServCore = $Config.Name 
$IpServe = $Config.IP 
$gateway = $Config.Gateway
$Domain = $Config.Domain
$User = $Config.User
$Password = $Config.Password

# Config adresse IP
$interfaceIndex = (Get-NetAdapter).ifIndex
New-NetIPAddress `
-IPAddress $IpServe `
-PrefixLength 16 `
-InterfaceIndex $interfaceIndex `
-DefaultGateway $gateway

# Installation de l'AD-DS
Install-WindowsFeature -Name RSAT-AD-Tools -IncludeManagementTools -IncludeAllSubFeature
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools -IncludeAllSubFeature

# Ajout le serveur au domain
$Pass= ConvertTo-SecureString $Password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PScredential ("$User@$Domain", $Pass) 
Add-Computer -DomainName $Domain -credential $credential

# Renommer l'ordinateur
Rename-Computer -NewName $ServCore -Force

# Restart du serveur
Restart-Computer