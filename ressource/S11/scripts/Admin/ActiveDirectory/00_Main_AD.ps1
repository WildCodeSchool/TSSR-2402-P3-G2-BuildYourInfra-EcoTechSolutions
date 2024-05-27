# Script principal de l'Administration Active Directory
# Lancement du Script en tant que Administrateur + Fenêtre Maximale

Start-Process -FilePath "C:\Program Files\PowerShell\7\pwsh.exe" -ArgumentList "C:\Admin\ActiveDirectory\00_Menu_AD.ps1" -Verb RunAs -WindowStyle Maximized