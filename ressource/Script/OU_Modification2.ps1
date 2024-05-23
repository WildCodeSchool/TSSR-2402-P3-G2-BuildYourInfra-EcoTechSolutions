Clear-Host
##################################################
#                                                #
#   Modification 2 attribut DESCRIPTION des OU   #
#                                                #
##################################################

### Initialisation

$DomainDN = (Get-ADDomain).DistinguishedName

### Main

$OUBaseListe = Get-ADOrganizationalUnit -Filter * -SearchBase $DomainDN -SearchScope OneLevel | Where-Object {$_.Name -notlike "*Domain Controllers*"}
$Count = 1
Foreach ($OUBase in $OUBaseListe)
{
    Write-Progress -Activity "Modification des sous-OU" -Status "%effectué" -PercentComplete ($Count/$OUBaseListe.Length*100)
    $Count++
    sleep -Milliseconds 500

    $OUs = Get-ADOrganizationalUnit -Filter * -SearchBase $OUBase.DistinguishedName -SearchScope OneLevel
    $DateFixe = Get-Date -UFormat %Y%m%d-%Hh%M
    Foreach ($OU in $OUs)
    {
        Set-ADOrganizationalUnit -Identity $OU.DistinguishedName -Description "Derniere modification $DateFixe"
    }
}