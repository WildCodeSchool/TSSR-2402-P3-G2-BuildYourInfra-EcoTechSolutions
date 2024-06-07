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
$OUSecurity = "EcoT_Secure"
$OUPathSecurity = "OU=EcoT_Secure,OU=EcoT_Bordeaux,OU=EcoT_France,$DomainDN"

### Main Program

$DataGroup = Import-Csv -Path $DataFile -Delimiter ";" -Header "DataGroup"

Write-Host ""

Foreach ($Group in $DataGroup)
{

$GroupName = $Group.DataGroup

    Try
    {
        New-ADGroup -Name $GroupName -Path "$OUPathSecurity" -GroupScope Global -GroupCategory Security
        $EventLogTask = "Ajout du Groupe $GroupName dans AD"
        EventLogAD
        Write-Host "Création du GROUPE $GroupName dans l'OU $OUSecurity" -ForegroundColor Green
    }
    Catch
    {
        Write-Host "Le GROUPE $GroupName existe déjà" -ForegroundColor Yellow
    }
}

Write-Host ""