Clear-Host
###########################################
#                                         #
#   Suppression sous-OU automatiquement   #
#                                         #
###########################################

### Initialisation

$DomainDN = (Get-ADDomain).DistinguishedName

### Main

$OUBaseListe = Get-ADOrganizationalUnit -Filter * -SearchBase $DomainDN -SearchScope OneLevel | Where-Object {$_.Name -notlike "*Domain Controllers*"}
$Count = 1
Foreach ($OUBase in $OUBaseListe)
{
    Write-Progress -Activity "Suppression des sous-OU" -Status "%effectué" -PercentComplete ($Count/$OUBaseListe.Length*100)
    $Count++
    sleep -Milliseconds 500

    $SousOUs = Get-ADOrganizationalUnit -Filter * -SearchBase $OUBase.DistinguishedName -SearchScope OneLevel
    Foreach ($SousOU in $SousOUs)
    {
        Get-ADObject -SearchBase $SousOU.DistinguishedName -Filter * | Move-ADObject -TargetPath $OUBase.DistinguishedName
        Remove-ADOrganizationalUnit -Identity $SousOU.DistinguishedName -Confirm:$false
    }
}