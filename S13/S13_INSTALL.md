# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## Sommaire

1) Contexte

2) Pré-requis techniques

3) Installation et Configuration des équipements et ressources

4) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## Contexte

```
# 1. Objectifs

1. DOSSIERS PARTAGES - Mettre en place des dossiers réseaux pour les utilisateurs
	1. Stockage des données sur un volume spécifique de l'AD
	2. Sécurité de partage des dossiers par groupe AD
	3. Mappage des lecteurs sur les clients par GPO ou script ou paramétrage de profil utilisateur
	4. Chaque utilisateur a accès à :
		1. Un **dossier individuel**, avec une lettre de mappage réseau **I**, accessible uniquement par cet utilisateur
		2. Un **dossier de service**, avec une lettre de mappage réseau **M**, accessible par tous les utilisateurs d'un même service.
		3. Un **dossier de département**, avec une lettre de mappage **N**, accessible par tous les utilisateurs d'un même département.
2. STOCKAGE AVANCÉ - Mettre en place du RAID 1 sur le volume système des serveurs (le plus possible) => Cet objectif sera à poursuivre sur les éléments à venir
3. SAUVEGARDE - Mettre en place une sauvegarde du volume qui contient les dossiers partagés des utilisateurs
	1. Les sauvegardes seront placées sur un volume spécifique
	2. Il y a au minimum 1 sauvegarde par semaine
4. MOT DE PASSE ADMINISTRATEUR LOCAL - Mise en place de LAPS
	1. Console de gestion sur un AD en GUI
	2. Installation sur les postes clients par GPO ou script
5. DÉPLACEMENT DES MACHINES DANS L'AD - Automatisation du placement dans la bonne OU
	1. Suivant le nom d'une machine et/ou la valeur d'un attribut AD
	2. Automatisation par script exécuté par une tâches planifiées sur le serveur
6. RESTRICTION D'UTILISATION DES MACHINES - Restriction horaire
	1. Bloquer la connexion pour les utilisateurs non-admin (domaine et local)
	2. Connexion autorisée de 7h30 à 20h, du lundi au samedi
7. Objectif personnalisé : à créer/choisir par le groupe, selon ce qui est définit dans le paragraphe **Contexte**.

# 2. Contexte

L'infrastructure réseau du projet commence à prendre forme :
- Plus de serveurs
- Plus de services
Elle doit être le plus sécurisée possible.

La mise en place du RAID 1 et de sauvegarde constituent des "briques" de sécurité.
Néanmoins cela ne suffit pas.
Pour chaque éléments de l'infrastructure réseau :
- Ils doivent disposer d'une documentation fonctionnelle et à jour :
	- Prérequis matériel/logiciel
	- Version d'OS, de logiciel, ...
	- Installation :
		- Suivi pas-à-pas avec copie d'écran
		- Copie d'écran du résultat attendu
	- Configuration/Utilisation :
		- Cible
		- Suivi pas-à-pas avec copie d'écran
	- FAQ
- On doit pouvoir le récupérer rapidement en cas de défaillance :
	- Clone miroir
	- Script de restauration complet ou partiel d'OS
	- Script de restauration de configuration
```

## Pré-requis techniques

## Installation et Configuration des équipements et ressources

### Mise en place du RAID 1 sur les serveurs

#### Serveur Windows **_ECO-Maximus_**

**ECO-Maximus**
* Template : `Windows Server 2022` / Type : `VM`.
* Configuration IP : `10.10.8.100/25` / Passerelle : `10.10.255.254` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 100GO` (Système + Dossiers Partagés) / `1 HDD 100GO` (RAID1) / `1 HDD 100Go` (Backup).
* Processeur : `2`.
* RAM : `8Go`.
* Fonction : `DHCP` / `DNS` / `ADDS`.

Rendez-vous sur l'annexe [RAID Windows GUI](/S13/annex/Raid_Windows_GUI.md).

#### Serveur Windows **_ECO-Moldaver_**

**ECO-Moldaver**
* Template : `Windows Server 2022 Core` / Type : `VM`.
* Configuration IP : `10.10.8.120/25` / Passerelle : `10.10.255.254` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 32Go` (Système) / `1 HDD 32GO` (RAID1).
* Processeur : `2`.
* RAM : `2Go`.
* Fonction : `DNS` / `ADDS`.

Rendez-vous sur l'annexe [RAID_Windows_Core](/S13/annex/Raid_Windows_Core.md).

#### Serveur Debian *_ECO-Lucy_*

**ECO-Lucy**
* Template : `Debian 12` / Type : `VM`.
* Configuration IP : `10.10.8.50/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 32GO` (Système) / `1 HDD 32GO` (RAID1) / `1 HDD 32Go` (Backup).
* Processeur : `2`.
* RAM : `8Go`.
* Fonction : `SSH` / `GLPI`.

Rendez-vous à l'annexe [Raid_Debian](/S13/annex/Raid_Debian.md).

### Mise en place d'une sauvegarde automatique via Windows Backup

**ECO-Maximus**
* Template : `Windows Server 2022` / Type : `VM`.
* Configuration IP : `10.10.8.100/25` / Passerelle : `10.10.255.254` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 100GO` (Système + Dossiers Partagés) / `1 HDD 100GO` (RAID1) / `1 HDD 100Go` (Backup).
* Processeur : `2`.
* RAM : `8Go`.
* Fonction : `DHCP` / `DNS` / `ADDS`.

Rendez-vous à l'annexe [Backup](/S13/annex/Backup.md).

### Mise en place de LAPS - Mot de passe administrateur local.

**ECO-Maximus**
* Template : `Windows Server 2022` / Type : `VM`.
* Configuration IP : `10.10.8.100/25` / Passerelle : `10.10.255.254` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 100GO` (Système + Dossiers Partagés) / `1 HDD 100GO` (RAID1) / `1 HDD 100Go` (Backup).
* Processeur : `2`.
* RAM : `8Go`.
* Fonction : `DHCP` / `DNS` / `ADDS`.

LAPS pour Local Administrator Password Solution est une solution gratuite proposée par Microsoft qui va permettre de gérer les mots de passe des comptes "Administrateur" locaux des postes de travail et des serveurs. Dès lors que le compte Administrateur local d'une machine est géré par Microsoft LAPS, le mot de passe de ce compte va être généré aléatoirement (selon certains critères) et stocké dans l'Active Directory au sein de l'objet "ordinateur" (computer) correspondant à la machine. De cette façon, l'administrateur système n'a pas à gérer ces mots de passe lui-même, ni à les stocker dans un gestionnaire de mots de passe un par un.

Une fois en place, Microsoft LAPS s'assure que tous les appareils disposent de mots de passe uniques et robustes afin de lutter contre les connexions malveillantes ou non autorisées.

Rendez-vous à l'annexe [LAPS](/S13/annex/LAPS.md).

### Restriction d'ulisation des machines - Restriction horaire

**ECO-Maximus**
* Template : `Windows Server 2022` / Type : `VM`.
* Configuration IP : `10.10.8.100/25` / Passerelle : `10.10.255.254` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 100GO` (Système + Dossiers Partagés) / `1 HDD 100GO` (RAID1) / `1 HDD 100Go` (Backup).
* Processeur : `2`.
* RAM : `8Go`.
* Fonction : `DHCP` / `DNS` / `ADDS`.

Rendez-vous à l'annexe [LogonHours](/S13/annex/LogonHours.md).

### Mappage d'un lecteur réseau

**ECO-Maximus**
* Template : `Windows Server 2022` / Type : `VM`.
* Configuration IP : `10.10.8.100/25` / Passerelle : `10.10.255.254` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 100GO` (Système + Dossiers Partagés) / `1 HDD 100GO` (RAID1) / `1 HDD 100Go` (Backup).
* Processeur : `2`.
* RAM : `8Go`.
* Fonction : `DHCP` / `DNS` / `ADDS`.

Rendez-vous à l'annexe [Mapping](/S13/annex/Mapping.md).

### DÉPLACEMENT DES MACHINES DANS L'AD

**ECO-Maximus**
* Template : `Windows Server 2022` / Type : `VM`.
* Configuration IP : `10.10.8.100/25` / Passerelle : `10.10.255.254` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 100GO` (Système + Dossiers Partagés) / `1 HDD 100GO` (RAID1) / `1 HDD 100Go` (Backup).
* Processeur : `2`.
* RAM : `8Go`.
* Fonction : `DHCP` / `DNS` / `ADDS`.

Rendez-vous dans l'annexe [Rangement_Computers_Scheduler](/S13/annex/Rangement_Computer_Scheduler.md).