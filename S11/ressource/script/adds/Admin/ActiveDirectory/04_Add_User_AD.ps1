##################################################################
#                                                                #
#             AJOUT UTILISATEUR DANS ACTIVE DIRECTORY            #
#                                                                #
##################################################################

Clear-Host

### Initialisation des paramètres génériques

$DomainDN = (Get-ADDomain).DistinguishedName

# Pré-requis

if (-not(Get-Module -Name ImportExcel))
{
    Install-Module -Name ImportExcel -RequiredVersion 7.8.4
}

if (-not(Get-Module -Name ActiveDirectory))
{
    Install-Module -Name ActiveDirectory   
}

### Fonction Remplacement Accent et caractères spéciaux
function RemoveStringSpecialCharacters
{
    
    Param([string]$StringToConvert)

    $StringToConvert -replace 'é', 'e' `
                    -replace 'è', 'e' `
                    -replace 'ë', 'e' `
                    -replace 'ê', 'e' `
                    -replace 'à', 'a' `
                    -replace 'á', 'a' `
                    -replace 'ä', 'a' `
                    -replace 'â', 'a' `
                    -replace 'ì', 'i' `
                    -replace 'í', 'i' `
                    -replace 'ï', 'i' `
                    -replace 'î', 'i' `
                    -replace 'ù', 'u' `
                    -replace 'ú', 'u' `
                    -replace 'ü', 'u' `
                    -replace 'û', 'u' `
                    -replace 'ò', 'o' `
                    -replace 'ó', 'o' `
                    -replace 'ö', 'o' `
                    -replace 'ô', 'o' `
                    -replace '-', '' `
                    -replace '/', '' `
                    -replace '\*', '' `
                    -replace ' ', '' `
                    -replace "’", '' `
                    -replace 'ç', 'c'
}

### Fonction Remplacement des Noms de Service/Département pour les OU

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

### Paramètres spécifiques

$OUPathUsers = "OU=EcoT_Users,OU=EcoT_Bordeaux,OU=EcoT_France,$DomainDN"


### Main Program

Start-Sleep -Milliseconds 100

Write-Host "A partir de quelle fichier souhaitez-vous ajouter des utilisateurs ? "
Write-Host ""
Write-Host "1 - Le fichier Excel existant : Ecotech-Listing.xlsx"
Write-Host "2 - Le dernier fichier CSV de l'historique"
Write-Host ""

$OptionAddAD = Read-Host "Saisissez votre choix "

Write-Host ""

switch ($OptionAddAD)
{
    "1"
    {
        # Création de variable du chemin du fichier par défaut
        $FilePathToConvert = "C:\Admin\ActiveDirectory\Sources"
        $FileToConvert = "Ecotech-Listing.xlsx"
        
        # Vérification de l'existence du fichier avec extensions .xlsx
        if (-not(Test-Path -Path "$filePathToConvert\$FileToConvert"))
        {
            # Si le fichier n'existe pas
            Write-Host "Le fichier $FileToConvert n'existe pas" -ForegroundColor Yellow
        }
        else
        {
            $TimeStamp = "$(Get-Date -Format yyyyMMdd)-$(Get-Date -Format HHmmss)"
            # Si le fichier existe >> Conversion du fichier .xlsx en fichier .csv avec Nomenclature <Horodatage>-Ecotech-Listing.csv
            Import-Excel -Path "$filePathToConvert\$FileToConvert" | Export-Csv -Path "$filePathToConvert\$TimeStamp-Ecotech-Listing.csv" -Encoding UTF8 -Delimiter ";"
            $EventLogTask = "Conversion du fichier $FileToConvert en .csv"
            EventLogAD
            # Ajout de Tracabilité des fichiers convertis dans le fichier Data_User_Create.csv
            Add-content -Path $FilePathToConvert\Data\Data_User_Create.csv -Value "$TimeStamp-Ecotech-Listing.csv"
            Write-Host "Le fichier $TimeStamp-Ecotech-Listing.csv est disponible dans le $filePathToConvert" -ForegroundColor Cyan
            $OptionFileConvert = Read-Host "`nSouhaitez-vous continuer et utiliser ce fichier pour l'ajout utilisateur ? (O/n) "
            if ($OptionFileConvert = "O")
            {
                # Import du fichier .csv
                $UsersAD = Import-Csv -Path "$filePathToConvert\$TimeStamp-Ecotech-Listing.csv" -Delimiter ";" -Header "Prenom","Nom","Societe","Site","Departement","Service","Fonction","ManagerPrenom","ManagerNom","NomPC","MarquePC","Anniversaire","TelFixe","TelMobile","Teletravail" | Select-Object -Skip 1
                $ADUsers = Get-ADUser -Filter * -Properties *
                $count = 1
                Foreach ($User in $UsersAD)
                {
                    Write-Progress -Activity "Création des utilisateurs dans l'OU" -Status "%effectué" -PercentComplete ($Count/$UsersAD.Length*100)
                    $Name              = "$($User.Prenom) $($User.Nom)"
                    $DisplayName       = "$($User.Prenom) $($User.Nom)"
                    $GivenName         = $User.Prenom
                    $LittleName        = RemoveStringSpecialCharacters $($User.Prenom)
                    $Surname           = $User.Nom
                    $LittleSurname     = RemoveStringSpecialCharacters $($User.Nom)
    
                    $SamAccountName    = $($LittleName.substring(0,1).ToLower()) + $($LittleSurname.ToLower())
                    $UserPrincipalName = $($LittleName.substring(0,1).ToLower()) + $($LittleSurname.ToLower()) + "@" + (Get-ADDomain).Forest
                    
                    $OfficePhone       = $User.TelFixe
                    $Mobile            = $User.TelMobile
    
                    $EmailAddress      = $LittleName.ToLower() + "." + $LittleSurname.ToLower() + "@" + (Get-ADDomain).Forest

                    $ReplaceService    = ReplaceOUName $($User.Service)
                    $ReplaceDepartment = ReplaceOUName $($User.Departement)
                    $ReplaceNameGroup  = "$ReplaceDepartment`_$ReplaceService"
                    if ($ReplaceService -eq "-")
                    {
                        $Path              = "OU=$ReplaceDepartment,$OUPathUsers"
                    }
                    else
                    {
                        $Path              = "OU=$ReplaceService,OU=$ReplaceDepartment,$OUPathUsers"
                    }
    
                    $Location          = $($User.Site)
                    $Title             = $($User.Fonction)
                    $Department        = "$($User.Departement) -  $($User.Service)"
                    $Company           = $($User.Societe)
                    $Manager           = "$($User.ManagerPrenom) $($User.ManagerNom)"
    
                    if (($ADUsers | Where {$_.SamAccountName -eq $SamAccountName}) -eq $Null)
                    {
                        New-ADUser -Name $Name -DisplayName $DisplayName -SamAccountName $SamAccountName -UserPrincipalName $UserPrincipalName `
                        -GivenName $GivenName -Surname $Surname -OfficePhone $OfficePhone -MobilePhone $Mobile -EmailAddress $EmailAddress `
                        -Path $Path -AccountPassword (ConvertTo-SecureString -AsPlainText Azerty1* -Force) -Enabled $True `
                        -Office $Location -Title $Title -Company $Company -Department $Department `
                        -ChangePasswordAtLogon $True #-Manager $Manager

                        # Ajout de l'utilisateur créé dans les groupes dédiés Users / Département / Service (si existant)
                        Add-ADGroupMember -Identity GRP_EcoT_Users -Members $SamAccountName
                        Add-ADGroupMember -Identity GRP_EcoT_Users_$ReplaceDepartment -Members $SamAccountName
                        if ($ReplaceService -ne "-")
                        {
                            Add-ADGroupMember -Identity GRP_EcoT_Users_$ReplaceNameGroup -Members $SamAccountName
                        }
            
                        Write-Host "Ajout de l'utilisateur $SamAccountName" -ForegroundColor Green
                        $EventLogTask = "Ajout de l'utilisateur $SamAccountName dans AD"
                        EventLogAD
                    }
                    else
                    {
                        Write-Host "Le USER $SamAccountName existe déjà" -ForegroundColor Red
                    }
                    $Count++
                    Start-Sleep -Milliseconds 100
                }
            }
            else
            {
                Write-Host "`nVous n'avez pas confirmé votre choix" -ForegroundColor Yellow
            }
        }
    }
    
    "2"
    {
        # Création de variable du chemin du fichier par défaut
        $FilePathToImport = "C:\Admin\ActiveDirectory\Sources"
        $DataFileToImport = "Data\Data_User_Create.csv"
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
            $count = 1
            Foreach ($User in $UsersAD)
            {
                Write-Progress -Activity "Création des utilisateurs dans l'OU" -Status "%effectué" -PercentComplete ($Count/$UsersAD.Length*100)
                $Name              = "$($User.Prenom) $($User.Nom)"
                $DisplayName       = "$($User.Prenom) $($User.Nom)"
                $GivenName         = $User.Prenom
                $LittleName        = RemoveStringSpecialCharacters $($User.Prenom)
                $Surname           = $User.Nom
                $LittleSurname     = RemoveStringSpecialCharacters $($User.Nom)

                $SamAccountName    = $($LittleName.substring(0,1).ToLower()) + $($LittleSurname.ToLower())
                $UserPrincipalName = $($LittleName.substring(0,1).ToLower()) + $($LittleSurname.ToLower()) + "@" + (Get-ADDomain).Forest
                
                $OfficePhone       = $User.TelFixe
                $Mobile            = $User.TelMobile

                $EmailAddress      = $LittleName.ToLower() + "." + $LittleSurname.ToLower() + "@" + (Get-ADDomain).Forest

                $ReplaceService    = ReplaceOUName $($User.Service)
                $ReplaceDepartment = ReplaceOUName $($User.Departement)
                $ReplaceNameGroup  = "$ReplaceDepartment`_$ReplaceService"
                if ($ReplaceService -eq "-")
                {
                    $Path              = "OU=$ReplaceDepartment,$OUPathUsers"
                }
                else
                {
                    $Path              = "OU=$ReplaceService,OU=$ReplaceDepartment,$OUPathUsers"
                }
                $Location          = $($User.Site)
                $Title             = $($User.Fonction)
                $Department        = "$($User.Departement) -  $($User.Service)"
                $Company           = $($User.Societe)
                $Manager           = "$($User.ManagerPrenom) $($User.ManagerNom)"

                if (($ADUsers | Where {$_.SamAccountName -eq $SamAccountName}) -eq $Null)
                {
                    New-ADUser -Name $Name -DisplayName $DisplayName -SamAccountName $SamAccountName -UserPrincipalName $UserPrincipalName `
                    -GivenName $GivenName -Surname $Surname -OfficePhone $OfficePhone -MobilePhone $Mobile -EmailAddress $EmailAddress `
                    -Path $Path -AccountPassword (ConvertTo-SecureString -AsPlainText Azerty1* -Force) -Enabled $True `
                    -Office $Location -Title $Title -Company $Company -Department $Department `
                    -ChangePasswordAtLogon $True #-Manager $Manager

                    # Ajout de l'utilisateur créé dans les groupes dédiés Users / Département / Service (si existant)
                    Add-ADGroupMember -Identity GRP_EcoT_Users -Members $SamAccountName
                    Add-ADGroupMember -Identity GRP_EcoT_Users_$ReplaceDepartment -Members $SamAccountName
                    if ($ReplaceService -ne "-")
                    {
                        Add-ADGroupMember -Identity GRP_EcoT_Users_$ReplaceNameGroup -Members $SamAccountName
                    }

        
                    Write-Host "Ajout de l'utilisateur $SamAccountName" -ForegroundColor Green
                    $EventLogTask = "Ajout de l'utilisateur $SamAccountName dans AD"
                    EventLogAD
                }
                else
                {
                    Write-Host "Le USER $SamAccountName existe déjà" -ForegroundColor Red
                }
                $Count++
                Start-Sleep -Milliseconds 100
            }
        }
    }
    Default
    {
        Write-Host "Ce choix n'est pas disponible" -ForegroundColor Yellow
    }
}

Write-Host ""