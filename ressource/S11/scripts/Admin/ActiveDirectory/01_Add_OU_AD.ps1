################################################################
#                                                              #
#               GESTION OU DANS ACTIVE DIRECTORY               #
#                                                              #
################################################################

Clear-Host

# Fonction Logs
function EventLogAD {

    # Chemin du dossier de Logs
    $LogFolder = "C:\Admin\Logs"

    #Test du chemin pour le Dossier
    if (-not(Test-Path $LogFolder)) {
        # Si il n'existe pas >> Continue
        New-Item -ItemType Directory $LogFolder | Out-Null # Création du dossier sans affichage du résultat
    }
    Add-Content -Path $LogFolder\$LogFile -value "$(Get-Date -Format yyyyMMdd)-$(Get-Date -Format HHmmss) - $env:USERNAME - $TypeLogTask - $EventLogTask"
}

### Initialisation des paramètres génériques

$DomainDN = (Get-ADDomain).DistinguishedName

### Pré-requis

If (-not(Get-Module -Name ActiveDirectory))
{
    Install-Module -Name ActiveDirectory   
}

# Chemin du fichier de Logs
$LogFile = "Logs_AD_OU.log"

### Parametres spécifiques

$DataMainOU = "C:\Admin\Sources\00_Main_OU.csv"
$DataDepartOU = "C:\Admin\Sources\00_Department_OU.csv"
$DataServOU = "C:\Admin\Sources\00_Service_OU.csv"

# Boucle pour le choix du Menu
while ($true)
{
    Write-Host "Gestion des OU dans Active Directory" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1 - Création OU"
    Write-Host "2 - Modification OU"
    Write-Host "3 - Suppression OU"
    Write-Host ""
    Write-Host "B - Retour au Menu AD"
    Write-Host ""

    # Prompt de la Boucle
    $OptionMenuOU = Read-Host "Veuillez saisir votre choix dans le Menu"
    Write-Host ""

    switch ($OptionMenuOU)
    {
        "1"
        {
            $TypeLogTask = "INFO"
            $EventLogTask = "--- Option Add OU ---"
            EventLogAD

            ### Création des OU principales

            ## Création de l'OU "Country"

            $FirstOU = "ECO_France"

            # Vérification de l'existence de l'OU
            If((Get-ADOrganizationalUnit -Filter {Name -like $FirstOU} -SearchBase $DomainDN) -eq $Null)
            {
                New-ADOrganizationalUnit -Name $FirstOU -Path $DomainDN
                $OUObj = Get-ADOrganizationalUnit "OU=$FirstOU,$DomainDN"
                $OUObj | Set-ADOrganizationalUnit -Description "Last Modified on $(Get-Date -UFormat %Y%m%d-%Hh%M)"

                $TypeLogTask = "ACTION"
                $EventLogTask = "OU $FirstOU added to AD"
                EventLogAD
        
                Write-Host "Création de l'OU `"OU=$FirstOU,$DomainDN`"" -ForegroundColor Green
                Write-Host ""
            }
            Else
            {
                $TypeLogTask = "WARNING"
                $EventLogTask = "OU $FirstOU already exists in AD"
                EventLogAD

                Write-Warning "L'OU `"OU=$FirstOU,$DomainDN`" existe déjà"
                Write-Host ""
            }

            ## Création de l'OU "City"

            $SecondOU = "ECO_Bordeaux"
            $SecondPathOU = "OU=$FirstOU,$DomainDN"

            # Vérification de l'existence de l'OU
            If((Get-ADOrganizationalUnit -Filter {Name -like $SecondOU} -SearchBase $SecondPathOU) -eq $Null)
            {
                New-ADOrganizationalUnit -Name $SecondOU -Path $SecondPathOU
                $OUObj = Get-ADOrganizationalUnit "OU=$SecondOU,$SecondPathOU"
                $OUObj | Set-ADOrganizationalUnit -Description "Last Modified on $(Get-Date -UFormat %Y%m%d-%Hh%M)"

                $TypeLogTask = "ACTION"
                $EventLogTask = "OU $SecondOU added to AD"
                EventLogAD
        
                Write-Host "Création de l'OU `"OU=$SecondOU,$SecondPathOU`"" -ForegroundColor Green
                Write-Host ""
            }
            Else
            {
                $TypeLogTask = "WARNING"
                $EventLogTask = "OU $SecondOU already exists in AD"
                EventLogAD

                Write-Warning "L'OU `"OU=$SecondOU,$SecondPathOU`" existe déjà"
                Write-Host ""
            }

            ## Création des OU "Utility"

            # Import des données du fichier .csv
            $DataMainOU = "C:\Admin\Sources\00_Main_OU.csv"

            $MainOUs = Import-Csv -Path $DataMainOU -Delimiter ";" -Header "Name"

            Foreach ($MainOU in $MainOUs)
            {
                # Nom des OUs
                $Utility = $MainOU.Name

                # Chemin des OU "Utility"
                $MainPathOU = "OU=$SecondOU,OU=$FirstOU,$DomainDN"

                # Vérification de l'existence de l'OU
                If((Get-ADOrganizationalUnit -Filter {Name -like $Utility} -SearchBase $MainPathOU) -eq $Null)
                {
                    New-ADOrganizationalUnit -Name $Utility -Path $MainPathOU
                    $OUObj = Get-ADOrganizationalUnit "OU=$Utility,$MainPathOU"
                    $OUObj | Set-ADOrganizationalUnit -Description "Last Modified on $(Get-Date -UFormat %Y%m%d-%Hh%M)"

                    $TypeLogTask = "ACTION"
                    $EventLogTask = "OU $Utility added to AD"
                    EventLogAD
        
                    Write-Host "Création de l'OU `"OU=$Utility,$MainPathOU`"" -ForegroundColor Green
                    Write-Host ""
                }
                Else
                {
                    $TypeLogTask = "WARNING"
                    $EventLogTask = "OU $Utility already exists in AD"
                    EventLogAD

                    Write-Warning "L'OU `"OU=$Utility,$MainPathOU`" existe déjà"
                    Write-Host ""
                }
            }

            ## Création des OU "Departement"

            # Import des données du fichier .csv

            $DepartmentOUs = Import-Csv -Path $DataDepartOU -Delimiter ";" -Header "Departement"

            Foreach ($DepartmentOU in $DepartmentOUs)
            {
                # Nom des OUs
                $Department = $DepartmentOU.Departement

                # Chemin des OU "Department"
                $ComputersOU = "ECO_Computers"
                $UsersOU = "ECO_Users"

                $DepartmentPathOU = "OU=$SecondOU,OU=$FirstOU,$DomainDN"

                # Vérification de l'existence de l'OU dans "ECO_Computers"
                If((Get-ADOrganizationalUnit -Filter {Name -like $Department} -SearchBase "OU=$ComputersOU,$DepartmentPathOU") -eq $Null)
                {
                    New-ADOrganizationalUnit -Name $Department -Path "OU=$ComputersOU,$DepartmentPathOU"
                    $OUObj = Get-ADOrganizationalUnit "OU=$Department,OU=$ComputersOU,$DepartmentPathOU"
                    $OUObj | Set-ADOrganizationalUnit -Description "Last Modified on $(Get-Date -UFormat %Y%m%d-%Hh%M)"

                    $TypeLogTask = "ACTION"
                    $EventLogTask = "OU $Department added to AD"
                    EventLogAD
        
                    Write-Host "Création de l'OU `"OU=$Department,OU=$ComputersOU,$DepartmentPathOU`"" -ForegroundColor Green
                    Write-Host ""
                }
                Else
                {
                    $TypeLogTask = "WARNING"
                    $EventLogTask = "OU $Department already exists in AD"
                    EventLogAD

                    Write-Warning "L'OU `"OU=$Department,OU=$ComputersOU,$DepartmentPathOU`" existe déjà"
                    Write-Host ""
                }

                    # Vérification de l'existence de l'OU dans "ECO_Users"
                    If((Get-ADOrganizationalUnit -Filter {Name -like $Department} -SearchBase "OU=$UsersOU,$DepartmentPathOU") -eq $Null)
                {
                    New-ADOrganizationalUnit -Name $Department -Path "OU=$UsersOU,$DepartmentPathOU"
                    $OUObj = Get-ADOrganizationalUnit "OU=$Department,OU=$UsersOU,$DepartmentPathOU"
                    $OUObj | Set-ADOrganizationalUnit -Description "Last Modified on $(Get-Date -UFormat %Y%m%d-%Hh%M)"

                    $TypeLogTask = "ACTION"
                    $EventLogTask = "OU $Department added to AD"
                    EventLogAD
        
                    Write-Host "Création de l'OU `"OU=$Department,OU=$UsersOU,$DepartmentPathOU`"" -ForegroundColor Green
                    Write-Host ""
                }
                Else
                {
                    $TypeLogTask = "WARNING"
                    $EventLogTask = "OU $Department already exists in AD"
                    EventLogAD

                    Write-Warning "L'OU `"OU=$Department,OU=$UsersOU,$DepartmentPathOU`" existe déjà"
                    Write-Host ""
                }
            }

            ## Création des OU "Service"

            # Import des données du fichier .csv

            $ServiceOUs = Import-Csv -Path $DataServOU -Delimiter ";" -Header "Departement","Service"

            Foreach ($ServiceOU in $ServiceOUs)
            {
                # Nom des OUs
                $Departement = $ServiceOU.Departement
                $Service = $ServiceOU.Service

                # Chemin des OU "Department"
                $ComputersOU = "ECO_Computers"
                $UsersOU = "ECO_Users"

                $ServicePathOU = "OU=$SecondOU,OU=$FirstOU,$DomainDN"

                # Vérification de l'existence de l'OU dans "ECO_Computers"
                If((Get-ADOrganizationalUnit -Filter {Name -like $Service} -SearchBase "OU=$Departement,OU=$ComputersOU,$ServicePathOU") -eq $Null)
                {
                    New-ADOrganizationalUnit -Name $Service -Path "OU=$Departement,OU=$ComputersOU,$ServicePathOU"
                    $OUObj = Get-ADOrganizationalUnit "OU=$Service,OU=$Departement,OU=$ComputersOU,$ServicePathOU"
                    $OUObj | Set-ADOrganizationalUnit -Description "Last Modified on $(Get-Date -UFormat %Y%m%d-%Hh%M)"

                    $TypeLogTask = "ACTION"
                    $EventLogTask = "OU $Service added to AD"
                    EventLogAD
        
                    Write-Host "Création de l'OU `"OU=$Service,OU=$Departement,OU=$ComputersOU,$ServicePathOU`"" -ForegroundColor Green
                    Write-Host ""
                }
                Else
                {
                    $TypeLogTask = "WARNING"
                    $EventLogTask = "OU $Service already exists in AD"
                    EventLogAD

                    Write-Warning "L'OU `"OU=$Service,OU=$Departement,OU=$ComputersOU,$ServicePathOU`" existe déjà"
                    Write-Host ""
                }

                    # Vérification de l'existence de l'OU dans "ECO_Users"
                    If((Get-ADOrganizationalUnit -Filter {Name -like $Service} -SearchBase "OU=$Departement,OU=$UsersOU,$ServicePathOU") -eq $Null)
                {
                    New-ADOrganizationalUnit -Name $Service -Path "OU=$Departement,OU=$UsersOU,$ServicePathOU"
                    $OUObj = Get-ADOrganizationalUnit "OU=$Service,OU=$Departement,OU=$UsersOU,$ServicePathOU"
                    $OUObj | Set-ADOrganizationalUnit -Description "Last Modified on $(Get-Date -UFormat %Y%m%d-%Hh%M)"

                    $TypeLogTask = "ACTION"
                    $EventLogTask = "OU $Service added to AD"
                    EventLogAD
        
                    Write-Host "Création de l'OU `"OU=$Service,OU=$Departement,OU=$UsersOU,$ServicePathOU`"" -ForegroundColor Green
                    Write-Host ""
                }
                Else
                {
                    $TypeLogTask = "WARNING"
                    $EventLogTask = "OU $Service already exists in AD"
                    EventLogAD

                    Write-Warning "L'OU `"OU=$Service,OU=$Departement,OU=$UsersOU,$ServicePathOU`" existe déjà"
                    Write-Host ""
                }
            }
        }
        "2"
        {
            $TypeLogTask = "INFO"
            $EventLogTask = "--- Option Modify OU ---"
            EventLogAD

            Write-Host "Work in Progress"
            Write-Host ""
        }
        "3"
        {
            $TypeLogTask = "INFO"
            $EventLogTask = "--- Option Delete OU ---"
            EventLogAD

            Write-Host "Work in Progress"
            Write-Host ""

        }
        "B"
        {
            # Chemin du fichier de Log
            $LogFile = "Logs_AD_Navigate.log"

            $TypeLogTask = "INFO"
            $EventLogTask = "--- Redirect to AD Menu ---"
            EventLogAD
            C:\Admin\00_AD_Menu.ps1
        }
        Default
        {
            Write-Host "Ce choix n'est pas disponible - Retour au Menu" -ForegroundColor Yellow
        }
    }
}