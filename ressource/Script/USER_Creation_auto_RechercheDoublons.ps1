############################
#                          #
#   Recherche de doublon   #
#                          #
############################

$FilePath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition)

### Parametre(s) à modifier

$File     = "$FilePath\USER_Creation_auto_Liste.txt"
$FileCsv  = "$FilePath\USER_Creation_auto_ListeDoublons.csv"

### Main program

Clear-Host
Import-Csv -Path $File -Delimiter ";" -Header "Prenom","Nom","Tel","Service" | Sort-Object -Property Nom | Export-Csv -Path $FileCsv -Force
$Csv = Import-Csv $FileCsv
Compare-Object $Csv $($Csv | Select-Object -Property Nom -Unique) -Property Nom