Clear-Host
#######################################
#                                     #
#   Création GROUPE automatiquement   #
#                                     #
#######################################

### Parametre(s) à modifier

$OuLabSecurity = "LabSecurite"
$Groups = "GrpComputers7Zip","GrpUsersChrome","GrpComputersFirefox","GrpUsersWallpaper",`            "GrpUsersWindowsRestrictions","GrpUsers","GrpComputers","GrpAdmins","GrpTEST"

### Initialisation

$DomainDN = (Get-ADDomain).DistinguishedName

### Main program

Foreach ($Group in $Groups)
{
    Try
    {
        New-AdGroup -Name $Group -Path "ou=$OuLabSecurity,$DomainDN" -GroupScope Global -GroupCategory Security
        Write-Host "Création du GROUPE $Group dans l'OU ou=$OuLabSecurity,$DomainDN"-ForegroundColor Green
    }
    Catch
    {
        Write-Host "Le GROUPE $Group existe déjà" -ForegroundColor Yellow -BackgroundColor Black
    }
}
