Clear-Host
##################################################
#                                                #
#   Modification 1 attribut DESCRIPTION des OU   #
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
    Foreach ($OU in $OUs)
    {
        If ($OU.DistinguishedName -like "*LabOrdinateurs*")
        {
            $OUDescription = "OU Ordinateurs"
        }
        Else
        {
            
            If ($OU.DistinguishedName -like "*LabSecurite*")
            {
                $OUDescription = "OU Securite"
            }
            Else
            {
                If ($OU.DistinguishedName -like "*LabUtilisateurs*")
                {
                    $OUDescription = "OU Utilisateurs"
                }
                Else
                {
                    $OUDescription = "OU à traiter"
                }
            }
        }
        Set-ADOrganizationalUnit -Identity $OU.DistinguishedName -Description $OUDescription
    }
}