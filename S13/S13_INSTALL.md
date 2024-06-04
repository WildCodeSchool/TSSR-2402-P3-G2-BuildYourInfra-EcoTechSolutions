# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## **1. Sommaire**

1) Pré-requis techniques

2) Installation et Configuration des équipements et ressources

3) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## **2. Pré-requis techniques**

## **3. Installation et Configuration des équipements et ressources**

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




### Mise en place de LAPS - Mot de passe administrateur local.

LAPS pour Local Administrator Password Solution est une solution gratuite proposée par Microsoft qui va permettre de gérer les mots de passe des comptes "Administrateur" locaux des postes de travail et des serveurs. Dès lors que le compte Administrateur local d'une machine est géré par Microsoft LAPS, le mot de passe de ce compte va être généré aléatoirement (selon certains critères) et stocké dans l'Active Directory au sein de l'objet "ordinateur" (computer) correspondant à la machine. De cette façon, l'administrateur système n'a pas à gérer ces mots de passe lui-même, ni à les stocker dans un gestionnaire de mots de passe un par un.

Une fois en place, Microsoft LAPS s'assure que tous les appareils disposent de mots de passe uniques et robustes afin de lutter contre les connexions malveillantes ou non autorisées.
  
#### Console de gestion sur un AD en GUI

Avant de commencer, téléchargez LAPS gratuitement sur le site de Microsoft. Vous devez télécharger à minima "LAPS.x64.msi" pour les machines 64 bits et "LAPS.x86.msi" pour les machines 32 bits, en fonction de vos besoins. Ici, nous optons pour une version 64 bits.

![laps0](./s13/laps.jpg)

Sur le contrôleur de domaine, nous allons installer les outils de gestion LAPS. Cela pourrait être installé sur un autre serveur où vous avez les outils d'administration Active Directory déjà installés.

Exécutez le package MSI correspondant à la version de Windows de votre serveur : 32 bits ou 64 bits. Vous allez voir, l'installation est simple et s'effectue en quelques clics... Cliquez sur "Next".
    
![laps1](./s13/laps1.jpg)

Cochez l'option "I accept the terms in the License Agreement" et cliquez sur "Next".
  
![laps2](./s13/laps2.jpg)

Ensuite, vous devez installer tous les outils d'administration (comme sur l'image ci-dessous) et vous pouvez désélectionner l'entrée "AdmPwd GPO Extension" car elle n'est pas utile sur le contrôle de domaine. En fait, le composant "AdmPwd GPO Extension" doit être déployé sur l'ensemble des machines à gérer via LAPS. Poursuivez.
  
![laps3](./s13/laps3.jpg)

Voici l'utilité des différents outils de gestion :

 - Fat client UI : outil graphique pour la gestion de LAPS
 - PowerShell module : commandes PowerShell pour LAPS
 - GPO Editor templates : modèle ADMX de LAPS

Démarrez l'installation, quelques secondes seront suffisantes. Cliquez sur "Finish" une fois que c'est fait.

  
![laps4](./s13/laps5.jpg)


![laps5]()

La première étape est faite, passons à la suite.





  
#### Serveur Windows **_Maximus_**

Rendez-vous sur l'annexe disponible [RAID Windows GUI](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S13/annex/Raid_Windows_GUI.md)

#### Serveur Windows **_Moldaver_**

Rendez-vous sur l'annexe disponible : [RAID_Windows_Core](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S13/annex/Raid_Windows_Core.md)

## **FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration**
