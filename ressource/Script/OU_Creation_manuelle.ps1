Clear-Host
####################################################################################
#                                                                                  #
#   Création OU manuellement (avec suppression protection contre la suppression)   #
#                                                                                  #
####################################################################################


### Parametre(s) à modifier

$OU = "OU test01020"
$OUPrincipale = "OU LabUtilisateurs" #OU LabUtilisateurs / OU LabOrdinateurs / OU LabSecurite

### Initialisation

$DomainDN = (Get-ADDomain).DistinguishedName

### Main

Clear-Host
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

CreateOU -OU $OU -SearchBase $OUPrincipale