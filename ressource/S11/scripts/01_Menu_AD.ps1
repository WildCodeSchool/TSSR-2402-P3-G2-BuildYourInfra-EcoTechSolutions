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
    Write-Host "2 - Ajout Utilisateur"
    Write-Host "3 - Ajout Computer"
    Write-Host "4 - Ajout Groupe"
    Write-Host ""
    Write-Host "5 - Suppression Utilisateur"
    Write-Host "6 - Suppression Computer"
    Write-Host "7 - Suppression Groupe"
    write-host ""
    Write-Host "8 - Consultations des Logs"
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
            ./02_Add_OU_AD.ps1
        }
        "2" {
            $EventLogTask = "--- Redirect Add User ---"
            EventLogAD
            ./03_Add_User_AD.ps1
        }
        "3" {
            $EventLogTask = "--- Redirect Add Computer ---"
            EventLogAD
            ./04_Add_Comp_AD.ps1
        }
        "4" {
            $EventLogTask = "--- Redirect Add Group ---"
            EventLogAD
            ./05_Add_Group_AD.ps1
        }
        "5" {
            $EventLogTask = "--- Redirect Del User ---"
            EventLogAD
            ./06_Del_User_AD.ps1
        }
        "6" {
            $EventLogTask = "--- Redirect Del Computer ---"
            EventLogAD
            ./07_Del_Comp_AD.ps1
        }
        "7" {
            $EventLogTask = "--- Redirect Del Group ---"
            EventLogAD
            ./08_Del_Group_AD.ps1
        }
        "8" {
            $EventLogTask = "--- Redirect Logs ---"
            EventLogAD
            ./10_Logs_AD.ps1
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