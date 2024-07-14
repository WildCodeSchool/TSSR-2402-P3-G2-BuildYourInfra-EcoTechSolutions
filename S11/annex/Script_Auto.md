# Automatisation d'Installation via des Scripts

## Sommaire

1) Script de déploiement rapide de ADDS sur Windows Serveur Core

2) Script de déploiement rapide de GLPI sur Debian 12

## Script de déploiement rapide ADDS sur Windows Serveur Core

Le Script et le fichier de Configuration sont disponibles sur le dépôt GitHub [Script_ADDS](/S11/ressource/script/adds/install/).

Nous avons mis en place un script pour automatiser la configuration de notre serveur core à partir des renseignements données dans un fichier CSV, situé dans notre 

dossier ressource/script

Pour ce faire, nous avons importé le fichier CSV dans le script et créé un système de récupération des erreurs dans un tableau pour les capturer et afficher 

quelle erreur se produit. Des variables enregistrent les données nécessaires à la configuration du serveur. Un bloc try-catch est utilisé pour insérer les erreurs 

dans notre tableau.

#### Explication du lancement du Script : 

Pour commencer, nous nous déplaçons à l'endroit où se trouve le script :

![](/S11/ressource/Core/Core_Path_Script.png)

Une fois dans le dossier où se trouvent nos deux fichiers :

![](/S11/ressource/Core/Core_File.png)

Puis lancement du Script : 

![](/S11/ressource/Core/Core_Launch_Script.png)

Nous pouvons maintenant constater que le serveur est bien dans le domaine et qu'il a récupéré les informations de notre fichier CSV.

![](/S11/ressource/Core/Core_Domain.png)

![](/S11/ressource/Core/Core_Apres_Script.png)

![](/S11/ressource/Core/Core_Config.png)

## Script de déploiement rapide de GLPI sur Debian 12

Le Script et le fichier de Configuration sont disponibles sur le dépôt GitHub [Script_GLPI](/S11/ressource/script/gpli/install/).