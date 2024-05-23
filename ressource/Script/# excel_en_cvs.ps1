# Installation du Module ImportExcel (uniquement pour l'Utilisateur actuel)
Install-Module -Name ImportExcel -Scope CurrentUser

Start-sleep 1

# Création de variable du chemin du fichier par défaut
$filePathToConvert = "C:\Users\Shanks\Documents\Dossier_Tssr\Script"

# Requête du nom de fichier à convertir
Write-Host "`nLe chemin par défaut du fichier est $filePathToConvert" -ForegroundColor Cyan
Write-Host "`nVous souhaitez convertir un fichier .xlsx en fichier .csv"

# Création de variable en lien avec le nom du fichier
$fileToConvert = "$FilePathToConvert\s09_EcoTechSolutions-Listing.txt"
# Read-Host "`nSaisissez le nom du fichier SANS l'extension"

# Supprime les accents du fichier tout en minuscule
Function ManageAccentsAndCapitalLetters
{
    param ([String]$String)

    $StringWithoutAccent = $String -replace '[éèêë]', 'e' -replace '[àâä]', 'a' -replace '[îï]', 'i' -replace '[ôö]', 'o' -replace '[ùûü]', 'u'
    $StringWithoutAccentAndCapitalLetters = $StringWithoutAccent.ToLower()
    $StringWithoutAccentAndCapitalLetters
}

# Vérification de l'existence du fichier avec extensions .xlsx
if (Test-Path -Path "$filePathToConvert\$fileToConvert.xlsx") {
    # Si OK >> Continue
    # Vérification de l'existence du fichier avec extension .csv
    if (Test-Path -Path "$filePathToConvert\$fileToConvert.csv") {
        # Si le fichier existe déjà
        Write-Host "`nLe fichier $fileToConvert.csv existe déjà" -ForegroundColor Yellow
    }

    else {
        # Si le fichier n'existe pas
        # Conversion du fichier .xlsx en fichier .csv 
        Import-Excel -Path "$filePathToConvert\$fileToConvert.xlsx" | Export-Csv -Path "$filePathToConvert\$fileToConvert.csv" -Encoding UTF8 -Delimiter ManageAccentsAndCapitalLetters;
        Start-sleep 1
        # Modification du nom apporté au fichier pour standardisation : Horodatage-Ecotech-Listing.csv
        Rename-Item -Path "$filePathToConvert\$fileToConvert.csv" -NewName "$filePathToConvert\$(Get-Date -Format yyyyMMdd)-$(Get-Date -Format HHmmss)-Ecotech-Listing.csv"

        Write-Host "`nLe fichier $fileToConvert.xlsx a été converti avec succés" -ForegroundColor Cyan
        Write-Host "`nLe fichier $(Get-Date -Format yyyyMMdd)-$(Get-Date -Format HHmmss)-Ecotech-Listing.csv est disponible dans le $filePathToConvert" -ForegroundColor Cyan
    }
}

else {
    # Sinon 
    Write-Host "`nLe fichier $fileToConvert.xlsx n'existe pas" -ForegroundColor Yellow
}