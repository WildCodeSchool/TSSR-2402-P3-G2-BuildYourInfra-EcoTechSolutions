#########################################################
#                                                       #
#          MENU DES COMMANDES ACTIVE DIRECTORY          #
#                                                       #
#########################################################

# Fonction Logs
function EventLogAD {
    $LogFolder = "C:\AD-Admin\Logs"
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
            $EventLogTask = "----- Redirect Add OU -----"
            EventLogAD
            ./AD-AddOU.ps1
        }
        "2" {
            $EventLogTask = "----- Redirect Add User -----"
            EventLogAD
            ./AD-AddUser.ps1
        }
        "3" {
            $EventLogTask = "----- Redirect Add Computer -----"
            EventLogAD
            ./AD-AddComp.ps1
        }
        "4" {
            $EventLogTask = "----- Redirect Add Group -----"
            EventLogAD
            ./AD-AddGroup.ps1
        }
        "5" {
            $EventLogTask = "----- Redirect Del User -----"
            EventLogAD
            ./AD-DelUser.ps1
        }
        "6" {
            $EventLogTask = "----- Redirect Del Computer -----"
            EventLogAD
            ./AD-DelComp.ps1
        }
        "7" {
            $EventLogTask = "----- Redirect Del Group-----"
            EventLogAD
            ./AD-DelGroup.ps1
        }
        "8" {
            $EventLogTask = "----- Redirect Logs -----"
            EventLogAD
            ./AD-Logs.ps1
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