#########################################################
#                                                       #
#          MENU DES COMMANDES ACTIVE DIRECTORY          #
#                                                       #
#########################################################

### Initialisation des paramètres génériques

$FilePath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition)

# Fonction Logs
function EventLogAD {

    $LogFolder = "$FilePath\Logs"
    $LogFile = "Log-AD.log"
    #Test du chemin pour le Dossier
    if (-not(Test-Path $LogFolder)) {
        # Si il n'existe pas >> Continue
        New-Item -ItemType Directory $LogFolder -OutBuffer # Création du Dossier en tâche de fond (mode silencieux)
    }
    Add-Content -Path $LogFolder\$LogFile -value "$(Get-Date -Format yyyyMMdd)-$(Get-Date -Format HHmmss)-$env:USERNAME-$EventLogTask"
}

# Message d'accueil + Début de Prise de Logs
$EventLogTask = "********** StartScript Active Directory**********"
EventLogAD

Write-Host "Bienvenue dans l'Outil d'Administration Active Directory" -ForegroundColor Cyan
Write-Host ""

# Boucle pour le choix du Menu
while ($true) {
    Write-Host "Menu des Options dans Active Directory"
    Write-Host ""
    Write-Host "1 - Ajout OU"
    Write-Host "2 - Ajout Groupe"
    Write-Host "3 - Ajout Computer"
    Write-Host "4 - Ajout Utilisateur"
    write-host ""
    Write-Host "L - Consultations des Logs"
    write-host ""
    Write-Host "x - Quitter l'Outil d'Administration AD"
    Write-Host ""

    # Prompt de la Boucle
    $OptionMenuAD = Read-Host "Veuillez saisir votre choix dans le Menu"
    Write-Host ""

    switch ($OptionMenuAD) {
        "1" {
            $EventLogTask = "--- Redirect Add OU ---"
            EventLogAD
            C:\Admin\ActiveDirectory\01_Add_OU_AD.ps1
        }
        "2" {
            $EventLogTask = "--- Redirect Add Group ---"
            EventLogAD
            C:\Admin\ActiveDirectory\02_Add_Group_AD.ps1
        }
        "3" {
            $EventLogTask = "--- Redirect Add Computer ---"
            EventLogAD
            C:\Admin\ActiveDirectory\03_Add_Comp_AD.ps1
        }
        "4" {
            $EventLogTask = "--- Redirect Add User ---"
            EventLogAD
            C:\Admin\ActiveDirectory\04_Add_User_AD.ps1
        }
        "L" {
            $EventLogTask = "--- Redirect Logs ---"
            EventLogAD
            C:\Admin\ActiveDirectory\00_Logs_AD.ps1
        }
        "x" {
            # Fin de Prise de Logs + Sortie du Script
            $EventLogTask = "********** EndScript Active Directory **********"
            EventLogAD
            Pause
            exit
        }
        Default {
            Write-Host "Ce choix n'est pas disponible - Retour au Menu" -ForegroundColor Yellow
        }
    }
}