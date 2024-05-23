Clear-Host
####################################################################################################
#                                                                                                  #
#   Création OU automatiquement avec fichier (avec suppression protection contre la suppression)   #
#                                                                                                  #
####################################################################################################

### Parametre(s) à modifier

$File = "$FilePath\OU_Creation_auto.txt"

### Initialisation

$FilePath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition)
$DomainDN = (Get-ADDomain).DistinguishedName

### Main

function CreateOU
{
    param ([Parameter(Mandatory=$True, Position=0)][String]$OU,
            [Parameter(Mandatory=$True, Position=1)][ValidateSet("OU LabOrdinateurs","OU LabUtilisateurs","OU LabSecurite")][String]$SearchBase)
    
    Switch ($SearchBase)
    {
        "OU LabOrdinateurs" {$DNSearchBase = "OU=LabOrdinateurs,$DomainDN"}
        "OU LabUtilisateurs" {$DNSearchBase = "OU=LabUtilisateurs,$DomainDN"}
        "OU LabSecurite" {$DNSearchBase = "OU=LabSecurite,$DomainDN"}
        default {$DNSearchBase = "OU=LabUtilisateurs,$DomainDN"}
    }

    If((Get-ADOrganizationalUnit -Filter {Name -like $ou} -SearchBase $DNSearchBase) -eq $Null)
    {
        New-ADOrganizationalUnit -Name $OU -Path $DNSearchBase
        $OUObj = Get-ADOrganizationalUnit "ou=$OU,$DNSearchBase"
        $OUObj | Set-ADOrganizationalUnit -ProtectedFromAccidentalDeletion:$False
        Write-Host "Création de l'OU $($OUObj.DistinguishedName)" -ForegroundColor Green
    }
    Else
    {
        Write-Host "L'OU `"ou=$OU,$DNSearchBase`" existe déjà" -ForegroundColor Red
    }
}

If (-not(Get-Module -Name activedirectory))
{
    Import-Module activedirectory
}

$OUs = Import-Csv -Path $File -Delimiter ";" -Header "OUServices","OUPrincipales"

Foreach ($OU in $OUs)
{
    CreateOU -OU $OU.OUServices -SearchBase $OU.OUPrincipales
}

