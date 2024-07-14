##################################################################
#                                                                #
#             AJOUT UTILISATEUR DANS ACTIVE DIRECTORY            #
#                                                                #
##################################################################

Clear-Host

$FilePath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition)

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
                    -replace 'Direction financière', 'DirectionFinanciere' `
                    -replace 'Service Commercial', 'ServiceCommercial' `
                    -replace 'Communication interne', 'CommunicationInterne' `
                    -replace 'Relation Médias', 'RelationMedias' `
                    -replace 'Recherche et Prototype', 'RecherchePrototype' `
                    -replace 'Test et qualité', 'TestQualite' `
                    -replace 'analyse et conception', 'AnalyseConception' `
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
Write-Host "1 - Le fichier Excel existant : s14_EcoTechSolutions.xlsx"
Write-Host "2 - Le dernier fichier CSV de l'historique"
Write-Host ""

$OptionAddAD = Read-Host "Saisissez votre choix "

Write-Host ""

switch ($OptionAddAD)
{
    "1"
    {
        # Création de variable du chemin du fichier par défaut
        $FilePathToConvert = $FilePath
        $FileToConvert = "s14_EcoTechSolutions.xlsx"
        
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
            Import-Excel -Path "$filePathToConvert\$FileToConvert" | Export-Csv -Path "$filePathToConvert\$TimeStamp-s14_EcoTechSolutions.csv" -Encoding UTF8 -Delimiter ";"
            $EventLogTask = "Conversion du fichier $FileToConvert en .csv"
            EventLogAD
            # Ajout de Tracabilité des fichiers convertis dans le fichier Data_User_Create.csv
            Add-content -Path $FilePathToConvert\Data\Data_User_Create.csv -Value "$TimeStamp-s14_EcoTechSolutions.csv"
            Write-Host "Le fichier $TimeStamp-s14_EcoTechSolutions.csv est disponible dans le $filePathToConvert" -ForegroundColor Cyan
            $OptionFileConvert = Read-Host "`nSouhaitez-vous continuer et utiliser ce fichier pour l'ajout utilisateur ? (O/n) "
            if ($OptionFileConvert -eq "O")
            {
                # Import du fichier .csv
                $UsersAD = Import-Csv -Path "$filePathToConvert\$TimeStamp-s14_EcoTechSolutions.csv" -Delimiter ";" -Header "Prenom","Nom","Societe","Site","Departement","Service","Fonction","ManagerPrenom","ManagerNom","NomPC","MarquePC","Datedenaissance","TelFixe","TelMobile","Teletravail" | Select-Object -Skip 1
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
                    $Birthday          = $User.Datedenaissance
    
                    $EmailAddress      = $LittleName.ToLower() + "." + $LittleSurname.ToLower() + "@" + (Get-ADDomain).Forest

                    $ReplaceService    = ReplaceOUName $($User.Service)
                    $ReplaceDepartment = ReplaceOUName $($User.Departement)
                    $ReplaceNameGroup  = "$ReplaceDepartment`_$ReplaceService"
                    if ($ReplaceService -eq "")
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
    
                    $ExistUser = $ADUsers | Where-Object {$_.SamAccountName -eq $SamAccountName -and $_.Birthday -eq $_.Description}

                    if ($ExistUser -eq $Null)
                    {
                    try {
                        New-ADUser -Name $Name -DisplayName $DisplayName -SamAccountName $SamAccountName -UserPrincipalName $UserPrincipalName `
                        -GivenName $GivenName -Surname $Surname -OfficePhone $OfficePhone -MobilePhone $Mobile -Description $Birthday -EmailAddress $EmailAddress `
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

                        if ($ExistUser.Birthday -eq $User.Birthday -and $ExistUser.Surname -ne $Surname)
                        {
                            Set-ADUser -Identity $ExistUser -Add @{NomDeJeuneFille = $ExistUser.Surname} -Surname $Surname
                            Write-Host "Mise à jour du nom de famille de $($ExistUser.SamAccountName) à $Surname." -ForegroundColor Yellow
                        }
                        } catch {
                        Write-Host "L'utilisateur $SamAccountName existe déjà!"
                        }
                    }
                    #else

                    #{
                        # Met à jour le nom de famille en cas de mariage
                     #   if ($ExistUser.Birthday -eq $User.Birthday -and $ExistUser.Surname -ne $Surname)
                      #  {
                       #     Set-ADUser -Identity $ExistUser -Add @{NomDeJeuneFille = $ExistUser.Surname} -Surname $Surname
                        #    Write-Host "Mise à jour du nom de famille de $($ExistUser.SamAccountName) à $Surname." -ForegroundColor Yellow
                        #}

                        #Write-Host "Le USER $SamAccountName existe déjà" -ForegroundColor Red
                    #}
                    $Count++
                    Start-Sleep -Milliseconds 100
                }

                # Déplacer les utilisateurs qui ne sont plus dans le fichier CSV
                foreach ($ExistUser in $ADUsers)
                {
                    if ($ExistUser.SamAccountName -ne "Administrator" -and $ExistUser.SamAccountName -ne "Guest")
                    {
                        if (-not($UsersAD | Where-Object { ($_.Prenom -eq $ExistUser.GivenName) -and ($_.Nom -eq $ExistUser.Surname) }))
                        {
                            Move-ADObject -Identity $ExistUser -TargetPath "OU=Corbeille,OU=EcoT_Bordeaux,OU=EcoT_France,$DomainDN"
                            Write-Host "L'utilisateur $($ExistUser.SamAccountName) est déplacé dans la corbeille." -ForegroundColor Red
                        }
                    }
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
        $FilePathToImport = $FilePath
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
            $UsersAD = Import-Csv -Path $FilePathToImport\$FileToImport -Delimiter ";" -Header "Prenom","Nom","Societe","Site","Departement","Service","Fonction","ManagerPrenom","ManagerNom","NomPC","MarquePC","Datedenaissance","TelFixe","TelMobile","Teletravail" | Select-Object -Skip 1
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
                $Birthday          = $User.Datedenaissance
                $EmailAddress      = $LittleName.ToLower() + "." + $LittleSurname.ToLower() + "@" + (Get-ADDomain).Forest

                $ReplaceService    = ReplaceOUName $($User.Service)
                $ReplaceDepartment = ReplaceOUName $($User.Departement)
                $ReplaceNameGroup  = "$ReplaceDepartment`_$ReplaceService"
                if ($ReplaceService -eq "")
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

                $ExistUser = $ADUsers | Where-Object {$_.SamAccountName -eq $SamAccountName -and $_.Birthday -eq $_.Description}

                if ($ExistUser -eq $Null)
                {
                try {
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


                    # Met à jour le nom de famille en cas de mariage
                    if ($ExistUser.Birthday -eq $User.Birthday -and $ExistUser.Surname -ne $Surname)
                    {
                        Set-ADUser -Identity $ExistUser -Add @{NomDeJeuneFille = $ExistUser.Surname} -Surname $Surname -DisplayName "$GivenName $Surname"
                        Write-Host "Mise à jour du nom de famille de $($ExistUser.SamAccountName) à $Surname." -ForegroundColor Yellow
                    }

                    Write-Host "Ajout de l'utilisateur $SamAccountName" -ForegroundColor Green
                    $EventLogTask = "Ajout de l'utilisateur $SamAccountName dans AD"
                    EventLogAD
                    }catch {
                                        Write-Host "Le USER $SamAccountName existe déjà" -ForegroundColor Red
                    }
                }
                    try

                    {
                         Get-ADUser -Filter {Description -like "* *"} | Set-ADUser -Description $Birthday                   
                    }catch {
                        Write-Host "ajout de la description foiré de merde!!!!!"
                    }

                #else
                #{
                    # Met à jour le nom de famille en cas de mariage
                    #if ($ExistUser.Birthday -eq $User.Birthday -and $ExistUser.Surname -ne $Surname)
                    #{
                    #    Set-ADUser -Identity $ExistUser -Add @{NomDeJeuneFille = $ExistUser.Surname} -Surname $Surname -DisplayName "$GivenName $Surname"
                   #     Write-Host "Mise à jour du nom de famille de $($ExistUser.SamAccountName) à $Surname." -ForegroundColor Yellow
                  #  }

                 #   Write-Host "Le USER $SamAccountName existe déjà" -ForegroundColor Red
                #}
                $Count++
                Start-Sleep -Milliseconds 100
            }

            # Déplacer les utilisateurs qui ne sont plus dans le fichier CSV
            foreach ($ExistUser in $ADUsers)
            {
            if ($ExistUser.SamAccountName -ne "Administrator" -and $ExistUser.SamAccountName -ne "Guest")
                {
                    if (-not($UsersAD | Where-Object { ($_.Prenom -eq $ExistUser.GivenName) -and ($_.Nom -eq $ExistUser.Surname) }))
                    {
                        Move-ADObject -Identity $ExistUser -TargetPath "OU=Corbeille,OU=EcoT_Bordeaux,OU=EcoT_France,$DomainDN"
                        Write-Host "L'utilisateur $($ExistUser.SamAccountName) est déplacé dans la corbeille." -ForegroundColor Red
                    }
                }

            }
        }
    }
    Default
    {
        Write-Host "Ce choix n'est pas disponible" -ForegroundColor Yellow
    }
}

Write-Host ""
