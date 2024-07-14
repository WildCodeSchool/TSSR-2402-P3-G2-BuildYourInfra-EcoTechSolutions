# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## Sommaire

1) Contexte

2) Pré-requis techniques

3) Installation et Configuration des équipements et ressources

## Contexte

```
# 1. Objectifs

1. JOURNALISATION - Mettre en place une journalisation des scripts PowerShell
	1. Modifier les scripts PowerShell utilisés (actuels et à venir)
	2. Utiliser un répertoire spécifique pour les logs (à définir)
	3. Un seul log par script
	4. Les logs seront construit pour pouvoir être lu par le logiciel **CMTrace**
2. SUPERVISION - Mise en place d'une supervision de l'infrastructure réseau avec **M/MONIT** (https://mmonit.com/)
	1. Installation sur VM/CT dédié
	2. Supervision des éléments de l'infrastructure (actuels et à venir)
	3. Mise en place de tableaux de bord
3. AD - Nouveau fichier d'utilisateurs à synchroniser dans l'AD
	1. Intégration des nouveaux utilisateurs
	2. Modifications de certaines informations
	3. Suppression (?) des utilisateurs ne faisant plus parti des effectifs
	4. Fourniture d'un fichier `S14_EcoTechSolutions.xlsx` :
		1. Le directeur commercial Pierre David quitte la société, remplacé par Marina Brun
			1. Prendre en compte la gestion des subalternes
		2. Le département "Finance et Comptabilité" change de nom et s'appelle désormais  "Direction financière"
		3. Dans ce département, le service "Fiscalité" disparaît, et les collaborateurs intègrent le service "Finance"
		4. Plusieurs collaborateurs ont quitté la société à la fin du mois dernier. Traiter leurs comptes AD ainsi que leurs données associées (s'il y en a)
		5. Des collaborateurs se sont marié. Traiter correctement leur nouveau nom.
# 2. Contexte

Une entreprise vie et est en perpétuelle mouvement. Les collaborateurs arrivent et partent.
Au delà des changements qui se font au travers du fichier listing du personnel, vous devez réfléchir au meilleur moyen de gérer, au quotidien, les différentes actions à effectuer.
```

## Pré-requis techniques

## Installation et Configuration des équipements et ressources

### Mise en place de Sauvegarde

#### Mise en place de Sauvegrade sur serveur Debian 12

**ECO-Lucy**
* Template : `Debian 12` / Type : `VM`.
* Configuration IP : `10.10.8.50/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 32GO` (Système) / `1 HDD 32GO` (RAID1) / `1 HDD 32Go` (Backup).
* Processeur : `2`.
* RAM : `8Go`.
* Fonction : `SSH` / `GLPI`.

Rendez-vous à l'annexe [Backup_Debian](/S14/annex/Backup_Debian.md).

#### Mise en place de Sauvegrade sur Windows Server en Core

**ECO-Moldaver**
* Template : `Windows Server 2022 Core` / Type : `VM`.
* Configuration IP : `10.10.8.120/25` / Passerelle : `10.10.255.254` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 32Go` (Système) / `1 HDD 32GO` (RAID1).
* Processeur : `2`.
* RAM : `2Go`.
* Fonction : `DNS` / `ADDS`.

Rendez-vous à l'annexe [Backup_Core](/S14/annex/Backup_Core.md).

### Supervision de l'Infrastructure

D'un point de vue général, la supervision est la surveillance du bon fonctionnement d'un système ou d'une activité. Dans une entité, il peut y avoir plusieurs systèmes de supervision, qui peuvent se compléter et communiquer entre eux. Ils collectent les informations, donnent des indications sur le fonctionnement général (ou spécifique) des machines. Dans notre cas, nous avons opté pour les solutions logiciels suivantes : Prométhéus, Grafana, Docker.

**CanigouGrafana**
* Template : `CT Debian 12` / Type `CT`.
* Configuration IP : `10.10.8.113/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 25Go` (Système).
* Processeur : `2`.
* RAM : `512Mo`.
* Fonction : `Grafana`.

**TychoProm**
* Template : `CT Debian 12` / Type `CT`.
* Configuration IP : `10.10.8.114/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 20Go` (Système).
* Processeur : `2`.
* RAM : `512Mo`.
* Fonction : `Prometheus`.

Rendez-vous à l'annexe [Supervision](/S14/annex/Supervision.md).

### Objectif personnalisé : Mise en place du Tiering Model

**ECO-Maximus**
* Template : `Windows Server 2022` / Type : `VM`.
* Configuration IP : `10.10.8.100/25` / Passerelle : `10.10.255.254` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 100GO` (Système + Dossiers Partagés) / `1 HDD 100GO` (RAID1) / `1 HDD 100Go` (Backup).
* Processeur : `2`.
* RAM : `8Go`.
* Fonction : `DHCP` / `DNS` / `ADDS`.

Rendez-vous à l'annexe [Tiering_Model](/S14/annex/Tiering_Model.md).