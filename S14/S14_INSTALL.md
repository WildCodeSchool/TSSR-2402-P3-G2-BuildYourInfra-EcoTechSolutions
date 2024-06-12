# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## **Sommaire**

1) Pré-requis techniques

2) Installation et Configuration des équipements et ressources


### Sauvegarde du serveur Lucy

Dans un premier temps, j'ai ajouté un disque dur au serveur ECO-Lucy.

Pour préparer le disque dur "sdc" pour recevoir des données de sauvegarde, on doit suivre plusieurs étapes, notamment la partition, le formatage et le montage du disque. Voici les étapes détaillées :

1. Identification du nouveau disque

Tout d'abord, on s'assure que le système reconnaît le nouveau disque dur. On peut utiliser la commande "lsblk" pour lister les disques disponibles. Puis comme dans l'image ci-dessous on utilise "fdisk" pour partitionner le disque "sdc" :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync1.png)

2. Partionner le disque
   
on suit les étapes indiquées : (n, p, entré, entré, entré, w)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync2.png)

3. Formater la partition

Après avoir créé une partition, on doit la formater avec un système de fichiers. Par exemple, pour formater en ext4 :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync3.png)

4. Monter la partition

Création d'un point de montage et montez la partition : 

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync4.png)

5. Configurer le montage automatique

Pour monter automatiquement le disque au démarrage, on ajoute une entrée dans /etc/fstab. Mais pour cela on récupère l'UUID du disque avec la commande "blkid" :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync5.png)

Maintenant on ajoute une ligne dans "/etc/fstab" avec l'UUID obtenu :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync6.png)

6. Vérifier le montage

Si on exécute la commande *`mount -a`* et que rien ne s'affiche, cela signifie généralement que tout est bon et qu'il n'y a pas eu d'erreurs dans le montage des systèmes de fichiers spécifiés dans /etc/fstab.

7. Sauvegarder les données

On peut maintenant utiliser des outils de sauvegarde comme "rsync" pour copier les données de votre disque principal vers le nouveau disque. Par exemple, pour sauvegarder /home :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync7.png)

8. Script de sauvegarde

Pour automatiser les sauvegardes, on peut créer un script. Tout d'abord on crée le fichier : 

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync8.png)

Puis on ajoute les lignes suivantes : 

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync9.png) 

On rend le script exécutable en donnant les droits de cette facon *`chmod +x backup.sh`*
Maintenant on ajoute ce script à la crontab pour une exécution automatique. 

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync11.png)

Choix "1" et on ajoute une ligne pour que tout les trois jours la sauvegarde se lance a 2h du matin

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync12.png)

Explication de la syntaxe

  - 0 2 : La tâche doit s'exécuter à 2h00.
  - */3 : La tâche doit s'exécuter tous les trois jours.
  - * : Correspond à chaque mois.
  - * : Correspond à chaque jour de la semaine.

On peut vérifier que la crontab a été correctement mise à jour en utilisant la commande suivante *`crontab -l`*

3) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## **Pré-requis techniques**

## **Installation et Configuration des équipements et ressources**

## **FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration**
