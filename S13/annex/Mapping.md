# Mappage des lecteurs réseaux pour dossiers partagés

## Sommaire

1) Mise en place de GPO

2) Création d'un dossier de partage

## Mise en place de GPO

Ouvrez le Gestionnaire de serveur > Outils > Gestion des Stratégies de Groupe.

![alt text](/S13/ressource/mapping/mappage%201.png)

Clique-droit sur "Objets de stratégie de groupe" puis "Nouveau" et nommez l'objet.

![alt text](/S13/ressource/mapping/mappage%202.png)

Une fois nommée, allez la chercher dans la liste des objets et faites un clique-droit et ensuite "Modifier".

![alt text](/S13/ressource/mapping/mappage%203.png)

Dans l'Editeur des stratégies , allez dans  Configuration Utilisateur > Preferences > Parametre Windows > Mappages de lecteur. Clique-droit sur "Mappages de lecteur et ensuite "Nouveau > Lecteur mappé".

![alt text](/S13/ressource/mapping/mappage%204.png)

Dans les propriétés du lecteur, renseignez le chemin du lecteur. Cochez "Reconnecter". Nommez le libeller. Dans lettre de lecteur, utilisez la lettre du lecteur concerné.

![alt text](/S13/ressource/mapping/mappage%205.png)

Dans l'onglet "Commun", cochez  "Exécuter dans le contexte de sécurité de l'utilisateur connecté".

![alt text](/S13/ressource/mapping/mappage%206.png)

Ensuite, dans l'Editeur des stratégies , allez dans  Configuration Utilisateur > Preferences > Parametre Windows > Dossier. Clique-droit sur "Dossier" et ensuite "Nouveau > Dossier".

![alt text](/S13/ressource/mapping/mappage%207.png)

Renseignez le chemin d'accès puis "Appliquer".

![alt text](/S13/ressource/mapping/mappage%208.png)

Ensuite, dans l'Editeur des stratégies , allez dans  Configuration Utilisateur > Preferences > Parametre Windows > Raccourci. Clique-droit sur "Raccourci" et ensuite "Nouveau > Raccourci".

![alt text](/S13/ressource/mapping/mappage%209.png)

Renseignez le Nom pour le raccourci, l'emplacement ou il sera puis son chemin d'accès et "Appliquer".

![alt text](/S13/ressource/mapping/mappage%2010.png)

Une fois effectuée, revenez sur le gestionnaire de stratégie de groupe. Clique-droit sur l'Unité d'Organisation (OU) concerné et "lier l'objet de stratégie". Sélectionnez l'objet concerné et validez.

![alt text](/S13/ressource/mapping/mappage%2011.png)

## Création d'un dossier de partage

Créez un dossier et nommez-le puis clique-droit et allez sur "Propriété".

![alt text](/S13/ressource/mapping/partage%201.png)

Allez dans l'onglet "Partage" puis "Partage avancé"

![alt text](/S13/ressource/mapping/partage%202.png)

Cochez "Partager ce dossier", nommez le partage (par default le nom du dossier apparait automatiquement) et cliquez sur "Autorisations".

![alt text](/S13/ressource/mapping/partage%203.png)

Ajoutez ou Supprimez les Utilisateurs ou les Groupes D'Utilisateurs autorisés à acceder au dossier.
En cliquant sur "Ajouter", une fenetre va s'ouvrir pour ajouter un ou plusieurs utilisateurs.

![alt text](/S13/ressource/mapping/partage%204.png)

Si vous n'êtes pas sur de l'orthographe, cliquez sur "Avancé" pour affiner votre recherche d'utilisateur.

![alt text](/S13/ressource/mapping/partage%205.png)

Une fois les utilisateur ajoutés, cochez la case "Contrôle total" pour chacun des utilisateurs ajoutés puis cliquez sur "Appliquer" et "OK".

![alt text](/S13/ressource/mapping/partage%204.png)

De retour sur cette fenetre, cliquez sur "Appliquer" et "OK".

![alt text](/S13/ressource/mapping/partage%203.png)

De retour sur cette fenetre, cliquez sur l'onglet "Sécurité".

![alt text](/S13/ressource/mapping/partage%202.png)

Dans l'onglet "Sécurité" cliquez sur "Avancé" 

![alt text](/S13/ressource/mapping/partage%206.png)

Cliquez sur "Désactiver l'héritage".

![alt text](/S13/ressource/mapping/partage%207.png)

Validez en cliquant sur " Convertir les autorisations hérités en autorisations explicites sur cet objet", puis sur "OK".

![alt text](/S13/ressource/mapping/partage%208.png)

De retour sur cette page, cliquez sur "Modifier" pour ajouter ou supprimer des utilisateurs qui auront accès au partage.

![alt text](/S13/ressource/mapping/partage%206.png)

En cliquant sur "Ajouter", une fenetre va s'ouvrir pour ajouter un ou plusieurs utilisateurs.

![alt text](/S13/ressource/mapping/partage%209.png)

![alt text](/S13/ressource/mapping/partage%205.png)

Si vous n'êtes pas sur de l'orthographe, cliquez sur "Avancé" pour affiner votre recherche d'utilisateur.

![alt text](/S13/ressource/mapping/partage%2010.png)

Une fois les utilisateur ajoutés, cochez la case "Contrôle total" pour chacun des utilisateurs ajoutés puis cliquez sur "Appliquer" et "OK".

![alt text](/S13/ressource/mapping/partage%209.png)

Maintenant, le dossier partagé est configué pour les utilisateurs ou groupe d'utilisateurs autorisés. Les utilisateurs ou groupe d'utilisateurs non autorisés n'y auront pas accès.