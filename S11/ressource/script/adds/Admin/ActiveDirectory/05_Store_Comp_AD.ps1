###################################################################
#                                                                 #
#            RANGEMENT COMPUTER DANS ACTIVE DIRECTORY             #
#                                                                 #
###################################################################

Clear-Host

### Initialisation des paramètres génériques

$DomainDN = (Get-ADDomain).DistinguishedName

### Pré-requis

If (-not(Get-Module -Name ActiveDirectory))
{
    Install-Module -Name ActiveDirectory   
}

function ReplaceOUName
{
    
    Param([string]$StringOUToConvert)

    $StringOUToConvert -replace 'Développement', 'Developpement' `
                    -replace 'Direction des Ressources Humaines', 'DirectionRessourcesHumaines' `
                    -replace 'Finance et Comptabilité', 'FinanceComptabilite' `
                    -replace 'Service Commercial', 'ServiceCommercial' `
                    -replace 'Communication interne', 'CommunicationInterne' `
                    -replace 'Relation Médias', 'RelationMedias' `
                    -replace 'Recherche et Prototype', 'RecherchePrototype' `
                    -replace 'Test et qualité', 'TestQualite' `
                    -replace 'analyse et conception', 'AnalyseConception' `
                    -replace 'Fiscalité', 'Fiscalite' `
                    -replace 'Service Comptabilité', 'ServiceComptabilite' `
                    -replace 'Service achat', 'ServiceAchat' `
                    -replace 'Service Client', 'ServiceClient'
}

### Parametres spécifiques

$OUComputers = "EcoT_Computers"
$OUPathComputers = "OU=EcoT_Computers,OU=EcoT_Bordeaux,OU=EcoT_France,$DomainDN"

# Création de variable du chemin du fichier par défaut
$FilePathToImport = "C:\Admin\ActiveDirectory\Sources"
$DataFileToImport = "Data\Data_User_Create.csv"
$DataComp = "Data\Data_Comp_Create.csv"
# Prise en compte de la dernière ligne du fichier uniquement
$FileToImport = (Get-Content -Path $FilePathToImport\$DataFileToImport -Tail 1)

Write-Host "Le fichier le plus récent disponible est $FileToImport"

Write-Host ""

# Vérification de l'existence du fichier
if (-not(Test-Path -Path $FilePathToImport\$FileToImport))
{
    # Si le fichier n'existe pas
    Write-Host "Le fichier $FileToImport est introuvable" -ForegroundColor Red
}
else
{
    # Si le fichier existe >> Import du fichier
    $UsersAD = Import-Csv -Path $FilePathToImport\$FileToImport -Delimiter ";" -Header "Prenom","Nom","Societe","Site","Departement","Service","Fonction","ManagerPrenom","ManagerNom","NomPC","MarquePC","Anniversaire","TelFixe","TelMobile","Teletravail" | Select-Object -Skip 1
    $ADUsers = Get-ADUser -Filter * -Properties *
    $Count = 1

    foreach ($User in $UsersAD)
    {
        Write-Progress -Activity "Création des utilisateurs dans l'OU" -Status "%effectué" -PercentComplete ($Count/$UsersAD.Length*100)

        $ReplaceService    = ReplaceOUName $($User.Service)
        $ReplaceDepartment = ReplaceOUName $($User.Departement)
        $ReplaceNameGroup  = "$ReplaceDepartment`_$ReplaceService"
        if ($ReplaceService -eq "-")
        {
            $Path              = "OU=$ReplaceDepartment,$OUPathComputers"
            $OUGoal            = $ReplaceDepartment
        }
        else
        {
            $Path              = "OU=$ReplaceService,OU=$ReplaceDepartment,$OUPathComputers"
            $OUGoal            = $ReplaceService
        }

        
        If ($Count -lt 10)
        {
            $ComputerName = "ECO-LP-00$Count"
        }

        If (($Count -ge 10) -and ($count -lt 100))
        {
            $ComputerName = "ECO-LP-0$Count"
        }

        If (($Count -ge 100) -and ($count -lt 1000))
        {
        $ComputerName = "ECO-LP-$Count"
        }

        Get-ADComputer $ComputerName | Move-ADObject -TargetPath $Path

        $SamAccountName = Get-ADComputer $ComputerName | Select-Object -ExpandProperty SamAccountName

        # Ajout de l'utilisateur créé dans les groupes dédiés Users / Département / Service (si existant)
        Add-ADGroupMember -Identity GRP_EcoT_Computers -Members $SamAccountName
        Add-ADGroupMember -Identity GRP_EcoT_Computers_$ReplaceDepartment -Members $SamAccountName
        if ($ReplaceService -ne "-")
        {
            Add-ADGroupMember -Identity GRP_EcoT_Computers_$ReplaceNameGroup -Members $SamAccountName
        }

        Write-Host "Le COMPUTER $ComputerName a été déplacé avec succés dans l'OU $OUGoal" -ForegroundColor Green
        $EventLogTask = "Rangement du COMPUTER $ComputerName dans l'OU $OUGoal"
        EventLogAD

        $Count++
        Start-Sleep -Milliseconds 100
    }
}