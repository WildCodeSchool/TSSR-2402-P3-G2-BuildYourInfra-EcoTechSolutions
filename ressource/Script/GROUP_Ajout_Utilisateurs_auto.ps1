Clear-Host
##############################################
#                                            #
#   Remplissage des groupe automatiquement   #
#                                            #
##############################################

### Parametre(s) à modifier

$OuLabSecurity = "LabSecurite"

### Initialisation

$DomainDN = (Get-ADDomain).DistinguishedName

### Main

$Groups = Get-ADGroup -Filter * -SearchBase "OU=$OuLabSecurity,$DomainDN" | Select-Object Name
$LabUsers = Get-ADUser -Filter * -SearchBase "OU=LabUtilisateurs,$DomainDN" | Select-Object -ExpandProperty SamAccountName
$LabComputers = Get-ADComputer -Filter * -SearchBase "OU=LabOrdinateurs,$DomainDN" | Select-Object -ExpandProperty SamAccountName

# Parcourir les groupes
Foreach ($Group in $Groups.Name)
{
    Switch ($group)
    {
        {$_ -like "*GrpUsers*"} {
        # Ajout des objets utilisateurs dans les groupes utilisateurs GrpUsers
        $LabUsers | ForEach {Add-ADGroupMember -Identity $group -Members $_}
                            }
        {$_ -like "*GrpComputers*"} {
            # Ajout des objets ordinateurs dans les groupes ordinateurs GrpComputers
            $LabComputers | ForEach {Add-ADGroupMember -Identity $group -Members $_}
                           }
        Default {Write-Warning "Groupe non reconnu : $group"}
    }
}