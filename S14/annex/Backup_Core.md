# Backup sur Windows Server en Core

## Sommaire

1) Mise en place de la sauvegarde sur Windows Server en Core

## Mise en place de la sauvegarde sur Windows Server en Core

Pour configurer une sauvegarde sur le serveur Windows Core ECO-Moldaver, on a dans un premier temps ajouté un disque dur identique au niveau espace que le disque dur qu'on désire sauvegarder.
Avant de pouvoir utiliser le disque 3 pour les sauvegardes, il faut le formater et le configurer. Voici les étapes pour préparer ton disque 3 :

1. Initialiser et formater le disque

Ouvrir une session sur le serveur et lancer la commande *`diskpart`* puis lister les disques avec *`list disk`* :

![](/S14/ressource/backup/moldaver/SauveMoldaver1.png)

Maintenant on selectionne le disque voulu *`select disk 2`* et on convertit le disque au format gpt *`convert gpt`* :

![](/S14/ressource/backup/moldaver/SauveMoldaver2.png)

Puis on crée une partition primaire au format ntfs et on assigne une lettre au disque :

![](/S14/ressource/backup/moldaver/SauveMoldaver3.png)

Enfin on quitte avec la commande *`exit`*. On peut vérifier comme dans l'image ci-dessous :

![](/S14/ressource/backup/moldaver/SauveMoldaver4.png)

2. Configurer la sauvegarde

On tape la commande suivante pour lancer la sauvegarde :

![](/S14/ressource/backup/moldaver/SauveMoldaver5.png)

Explication de cette commande :

   - *`-backupTarget:F:`* spécifie la destination de la sauvegarde (disque 2 avec la lettre F).
   - *`-include:C:`* spécifie le volume à sauvegarder (C: est ton disque 0).
   - *`-allCritical`* inclut tous les volumes nécessaires pour restaurer le système.
   - *`-quiet`* supprime les invites de confirmation.

3. Automatiser la sauvegarde

On crée une tâche planifiée

![](/S14/ressource/backup/moldaver/SauveMoldaver6.png)

Explication de cette commande :

   - *`/tn "SauvegardeDiskC"`* donne un nom à la tâche.
   - *`/tr "wbadmin start backup -backupTarget:F: -include:C: -allCritical -quiet"`* spécifie la commande à exécuter.
   - *`/sc daily /mo 3`* planifie l'exécution tous les 3 jours.
   - *`/st 02:00`* fixe l'heure d'exécution à 02:00 du matin.

On vérifie si la tâche est bien enregistré avec la commande *`schtasks /query`*

![](/S14/ressource/backup/moldaver/SauveMoldaver7.png)