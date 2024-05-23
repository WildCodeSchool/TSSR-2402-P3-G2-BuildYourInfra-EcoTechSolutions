######################################################################################################
#                                                                                                    #
#   Création USER automatiquement avec fichier (avec suppression protection contre la suppression)   #
#                                                                                                    #
######################################################################################################

$FilePath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition)

### Parametre(s) à modifier

$File = "$FilePath\s09_EcoTechSolutions-Listing.txt"

# Supprime les accents du fichier tout en minuscule
Function ManageAccentsAndCapitalLetters
{
    param ([String]$String)

    $StringWithoutAccent = $String -replace '[éèêë]', 'e' -replace '[àâä]', 'a' -replace '[îï]', 'i' -replace '[ôö]', 'o' -replace '[ùûü]', 'u'
    $StringWithoutAccentAndCapitalLetters = $StringWithoutAccent.ToLower()
    $StringWithoutAccentAndCapitalLetters
}

### Main program

Clear-Host
If (-not(Get-Module -Name activedirectory))
{
    Import-Module activedirectory
}

$Users = Import-Csv -Path $File -Delimiter "," -Header "Prenom","Nom","Nom complet","Societe","Site","Departement","Service","Fonction","Date_de_naissance","Telephone_fixe","Telephone_portable" | Select-Object -skip 1 
$ADUsers = Get-ADUser -Filter * -Properties *
$count = 1
Foreach ($User in $Users)
{
    Write-Progress -Activity "Création des utilisateurs dans l'OU" -Status "%effectué" -PercentComplete ($Count/$Users.Length*100)
    $Name              = ManageAccentsAndCapitalLetters "$($User.Nom) $($User.Prenom)"
    $DisplayName       = ManageAccentsAndCapitalLetters "$($User.Nom) $($User.Prenom)"
    $SamAccountName    = ManageAccentsAndCapitalLetters $($User.Prenom.substring(0,1).tolower()) + $($User.Nom.ToLower())
    $UserPrincipalName = (($User.prenom.tolower() + $User.nom.ToLower()) + "@" + (Get-ADDomain).Forest)
    $GivenName         = $User.Prenom
    $Surname           = $User.Nom
    $Site              = $User.Site
    $Fonction          = $User.Fonction
    $Service           = $User.Service
    $Birthday          = $User.Date_de_naissance
    $OfficePhone       = $User.Telephone_fixe
    $Mobile            = $User.Telephone_portable
    $EmailAddress      = $UserPrincipalName
    $Path              = "ou=$($User.Service),ou=$($User.Departement),ou=EcoT_Users,ou=$($User.Site),ou=EcoT_France,dc=ecotechsolutions,dc=fr"
    $Company           = "EcoTechSolutions"
    $Department        = "$($User.Departement)"
    
    If (($ADUsers | Where-Object {$_.SamAccountName -eq $SamAccountName}) -eq $Null)
    {
        New-ADUser -Name $Name -DisplayName $DisplayName -SamAccountName $SamAccountName -UserPrincipalName $UserPrincipalName `
        -Site $Site -Mobile $Mobile -Fonction $Fonction -Service $Service -Birthday $Birthday `
        -GivenName $GivenName -Surname $Surname -OfficePhone $OfficePhone -EmailAddress $EmailAddress `
        -Path $Path -AccountPassword (ConvertTo-SecureString -AsPlainText Azerty1* -Force) -Enabled $True `
        -OtherAttributes @{Company = $Company;Department = $Department} -ChangePasswordAtLogon $True
        
        Write-Host "Création du USER $SamAccountName" -ForegroundColor Green
    }
    Else
    {
        Write-Host "Le USER $SamAccountName existe déjà" -ForegroundColor Black -BackgroundColor Yellow
    }
    $Count++
    Start-Sleep -Milliseconds 100
}