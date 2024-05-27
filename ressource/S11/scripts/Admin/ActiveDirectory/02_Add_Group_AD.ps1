########################################################
#                                                      #
#          AJOUT GROUPE DANS ACTIVE DIRECTORY          #
#                                                      #
########################################################

Clear-Host

### Initialisation des paramètres génériques

$FilePath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition)
$DomainDN = (Get-ADDomain).DistinguishedName

### Pré-requis

If (-not(Get-Module -Name ActiveDirectory))
{
    Install-Module -Name ActiveDirectory   
}

### Parametres spécifiques

$DataFile = "$FilePath\Sources\Data\Data_Group_Create.csv"
$OuSecurity = "EcoT_Secure"
$OUPathSecurity = "OU=EcoT_Secure,OU=EcoT_Bordeaux,OU=EcoT_France,$DomainDN"

### Main Program

$DataGroup = Import-Csv -Path $DataFile -Header "Group"

Write-Host ""

Foreach ($Group in $DataGroup)
{
    Try
    {
        New-ADGroup -Name $Group -Path "$OUPathSecurity" -GroupScope Global -GroupCategory Security
        $EventLogTask = "Ajout du Groupe $Group dans AD"
        EventLogAD
        Write-Host "Création du GROUPE $Group dans l'OU $OuSecurity" -ForegroundColor Green
    }
    Catch
    {
        Write-Host "Le GROUPE $Group existe déjà" -ForegroundColor Yellow
    }
}

Write-Host ""