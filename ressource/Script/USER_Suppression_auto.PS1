#####################################################################################
#                                                                                   #
#   Suppression USER automatiquement avec fichier (Avec test d'existence du USER)   #
#                                                                                   #
#####################################################################################

$FilePath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition)

### Parametre(s) à modifier

$File = "$FilePath\USER_Suppression_auto.txt"

### Main program

Clear-Host
If (-not(Get-Module -Name activedirectory))
{
    Import-Module activedirectory
}

$Users = Import-Csv -Path $File -Delimiter ";" -Header "Prenom","Nom"
$Count = 1
Foreach ($User in $Users)
{
    Write-Progress -Activity "Création des utilisateurs dans l'OU" -Status "%effectué" -PercentComplete ($Count/$Users.Length*100)
    $Count++
    sleep -Milliseconds 100

    $Identity = $($User.Prenom.substring(0,1).tolower()) + $($User.Nom.ToLower())
    Try
    {
        If ((Get-ADUser -Identity $Identity) -ne $Null)
        {
            Remove-ADUser -Identity $(Get-ADUser -Identity $Identity) -Confirm:$false
            Write-Host "Suppression du USER $Identity" -ForegroundColor Green
        }
    }
    Catch
    {
        Write-Host "USER $Identity introuvable"
    } 
}
