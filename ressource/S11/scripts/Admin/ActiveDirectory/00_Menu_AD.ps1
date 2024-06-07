#########################################################
#                                                       #
#          MENU DES COMMANDES ACTIVE DIRECTORY          #
#                                                       #
#########################################################

# Fonction Logs
function EventLogAD {

    $LogFolder = "C:\Admin\ActiveDirectory\Logs"
    $LogFile = "Log-AD.log"
    #Test du chemin pour le Dossier
    if (-not(Test-Path $LogFolder)) {
        # Si il n'existe pas >> Continue
        New-Item -ItemType Directory $LogFolder # Création du Dossier en tâche de fond (mode silencieux)
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
    Write-Host "4 - Ajout Utilisateur + Ajout au Groupe"
    Write-Host "5 - Rangement Computer + Ajout au Groupe"
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
            .\01_Add_OU_AD.ps1
        }
        "2" {
            $EventLogTask = "--- Redirect Add Group ---"
            EventLogAD
            .\02_Add_Group_AD.ps1
        }
        "3" {
            $EventLogTask = "--- Redirect Add Computer ---"
            EventLogAD
            .\03_Add_Comp_AD.ps1
        }
        "4" {
            $EventLogTask = "--- Redirect Add User ---"
            EventLogAD
            .\04_Add_User_AD.ps1
        }
        "5" {
            $EventLogTask = "--- Redirect Store Computer---"
            EventLogAD
            .\05_Store_Comp_AD.ps1
        }
        "L" {
            $EventLogTask = "--- Redirect Logs ---"
            EventLogAD
            .\00_Logs_AD.ps1
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