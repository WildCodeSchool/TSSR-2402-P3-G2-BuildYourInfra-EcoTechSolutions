# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## **Sommaire**

1) Pré-requis techniques

2) Installation et Configuration des équipements et ressources

3) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## **Pré-requis techniques**

## **Installation et Configuration des équipements et ressources**

### Mise en place du RAID 1

#### Serveur Debian - *Lucy*

L'objectif ici est de mettre en place un RAID 1, soit du mirroring entre les 2 disques. Les données sont copiées simultanément sur deux disques. Ainsi en cas de panne d'un des disques, les données sont toujours disponibles sur le disque restant.

La première étape consiste à "ajouter" un second disque dur sur notre machine serveur. Ici nous proicédons à l'ajout du second disque directement via l'hyperviseur Proxmox:

![raid11]()

Une fois ce pré-requis établi, pour administrer le RAID logiciel sous GNU/Linux, on utilise l'outil **mdadm**. S'il n'est pas installé sur ton système, exécute la commande `apt install mdadm` pour l'installer.
Ensuite, nous commençons par partitionner le disque ajouter en vue de l'établir comme disque "miroir" du RAID 1: nous constatons la présence du deuxième disque avec la commande ``lsblk`` ou ``fdisk -l``:

![raid12]()


  
![raid13]()

![raid14]()

![raid15]()





  

#### Serveur Windows **_Moldaver_**

Rendez-vous sur l'annexe disponible : [Raid_Windows_Core](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S13/annex/Raid_Windows_Core.md)

## **FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration**
