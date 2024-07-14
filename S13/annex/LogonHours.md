# Restriction Horaire de l'utilisation de smachines

## Sommaire

1) Contexte et mise en place via un script

2) Création d'une GPO

3) Configuration de la restriction horaire pour les utilisateurs

## Contexte et mise en place via un script

Nous avons décidé de mettre en place une restriction horaire au sein de notre domaine. Voici les mesures prises :
 - 1. Bloquer la connexion pour les utilisateurs non-admin (domaine et local)
 - 2. Connexion autorisée de 7h30 à 20h, du lundi au samedi

Pour ce faire, on peut procéder "à la main" pour chaque *user* en faisant clic droit sur *lui* > "Propriétés" > "Compte" > "Horaires d'accès". Il faudra alors l'appliquer pour chaque utilisateur.
Nous proposons ce script pour la gestion détaillée des horaires de connexion pour les utilisateurs :

```
# Script PowerShell pour vérifier les heures de connexion et déconnecter l'utilisateur

# Obtenir le jour actuel et l'heure actuelle
$currentDay = (Get-Date).DayOfWeek
$currentHour = (Get-Date).Hour
$currentMinute = (Get-Date).Minute

# Définir les heures autorisées
$startTime = [datetime]::ParseExact("07:30", "HH:mm", $null)
$endTime = [datetime]::ParseExact("20:00", "HH:mm", $null)

# Conversion du jour actuel en index (0=Dimanche, 6=Samedi)
$dayIndex = switch ($currentDay) {
    "Sunday"    { 0 }
    "Monday"    { 1 }
    "Tuesday"   { 2 }
    "Wednesday" { 3 }
    "Thursday"  { 4 }
    "Friday"    { 5 }
    "Saturday"  { 6 }
}

# Vérifier si l'heure actuelle est en dehors des heures autorisées du lundi au samedi
$currentTime = Get-Date
$startTimeToday = $startTime.AddDays($dayIndex)
$endTimeToday = $endTime.AddDays($dayIndex)

# Vérifier si le jour est entre lundi et samedi (1 à 6) et si l'heure est dans les limites
if (($dayIndex -ge 1 -and $dayIndex -le 6) -and ($currentTime -ge $startTimeToday -and $currentTime -le $endTimeToday)) {
    Write-Output "L'utilisateur est connecté pendant les heures autorisées."
} else {
    # Si non, déconnecter l'utilisateur
    shutdown.exe /l /f
}
```

Définition de la fonction Set-LogonHours :

 - La fonction prend deux paramètres :
        $Hours : Un tableau d'octets représentant les heures de connexion autorisées.
        $Day : Le jour de la semaine pour lequel nous définissons les heures de connexion.

Conversion du nom du jour en index :

 - Utilise une instruction switch pour convertir le nom du jour en index numérique (0 pour dimanche, 6 pour samedi).

Calcul des intervalles de 7h30 à 20h00 :

 - Utilise une boucle for pour définir les bits correspondants aux demi-heures de 7h30 (15ème demi-heure) à 20h00 (40ème demi-heure) pour le jour spécifié.
    Le calcul $dayIndex * 24 + $i positionne correctement chaque demi-heure dans le tableau de 168 éléments.

Initialisation du tableau logonHours :

 - Un tableau de 168 éléments est créé, initialisé à zéro, représentant chaque demi-heure de la semaine comme non autorisée.

Mise à jour des heures de connexion pour chaque jour :

 - Une boucle foreach itère sur les jours spécifiés (lundi à samedi) et met à jour les heures de connexion en appelant Set-LogonHours pour chaque jour.

Nous avons choisi de mettre en place une GPO de restriction horaire. Ci-dessous les étapes de mise en place :

## Créer une nouvelle GPO pour la restriction horaire 

  - Ouvrir la console de gestion des stratégies de groupe: on accède à "Outils" > "Gestion des stratégies de groupe".

![horaires1](/S13/ressource/logon/horaires1.jpg)

 - Création de la nouvelle GPO : clic droit sur l'UO interessée pour y lier la GPO (dans notre cas **EcoT_Users**) > "Créer un objet de stratégie de groupe dans ce domaine, et le lier ici"
 - Nommer la nouvelle GPO de manière toujours explicite.

![horaires2](/S13/ressource/logon/horaires2.jpg)

## Configuration de la restriction horaire pour les utilisateurs

 - Nous commençons par éditer la GPO créée : clic droit sur la GPO créée et sélectionner "Modifier".

![horaires3](/S13/ressource/logon/horaires3.jpg)

 - Puis nous configurons les paramètres de retriction en eux-mêmes : ``Configuration de l'ordinateur`` > ``Stratégies`` > ``Paramètres Windows`` > ``Paramètres de sécurité`` > ``Stratégies locales`` > ``Options de sécurité``.
   (Ici nous pouvons double-cliquer sur ``Connexion intéractive`` et ajuster le ``nombre maximal de connexions simultanées`` que nous définissons à **1**)

![horaires4](/S13/ressource/logon/horaires4.jpg)