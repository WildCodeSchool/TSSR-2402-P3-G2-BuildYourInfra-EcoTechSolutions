# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

# Sommaire

1) Contexte

2) Pré-requis techniques

3) Installation et Configuration des équipements et ressources

## Contexte

```
# 1. Objectifs

1. GPO de sécurité - Création d'au moins 10 GPO dont 7 dans la liste ci-dessous :
	1. Politique de mot de passe (complexité, longueur, etc.)
	2. Verrouillage de compte (blocage de l'accès à la session après quelques erreur de mot de passe)
	3. Restriction d'installation de logiciel pour les utilisateurs non-administrateurs
	4. Gestion de Windows update (heure, délai avant installation, etc.)
	5. Blocage de l'accès à la base de registre
	6. Blocage complet ou partiel au panneau de configuration
	7. Restriction des périphériques amovible
	8. Gestion d'un compte du domaine qui est administrateur local des machines
	9. Gestion du pare-feu
	10. Écran de veille avec mot de passe en sortie
	11. Forçage du type d'utilisation sécurisée du bureau à distance
	12. Limitation des tentatives d'élévation de privilèges
	13. Définition de scripts de démarrage pour les machines et/ou les utilisateurs
	14. Politique de sécurité PowerShell
2. GPO standard - Création d'au moins 5 GPO dont 3 dans la liste ci-dessous :
	1. Fond d'écran
	2. Mappage de lecteurs
	3. Gestion de l'alimentation
	4. Déploiement (publication) de logiciels
	5. Redirection de dossiers (Documents, Bureau, etc.)
	6. Configuration des paramètres du navigateur (Firefox ou Chrome)
3. Création d'un serveur GLPI - Sur Debian 11 ou 12 en CLI
	1. Synchronisation AD
	2. Gestion de parc : Inclusion des objets AD (utilisateurs, groupes, ordinateurs)
	3. Gestion des incidents : Mise en place d'un système de ticketing
	4. Accès et gestion à partir d'un client
4. Scripts d'automatisation : 
	1. Sur un serveur Debian, installation de Glpi à partir d'un fichier de configuration qui contient par exemple le nom de la base de donnée, le nom du compte, etc.
	2. Sur un Windows Server Core, installation du rôle AD-DS, ajout à un domaine existant. On se base sur un fichier de configuration qui contient le nom du serveur, l'adresse IP du DNS, le nom du domaine, etc.

# 2. Documentation

La mise en place des GPO doit être clairement expliquée pour chacune d'entre-elles.
```

## Pré-requis techniques

## Installation et Configuration des équipements et ressources

### Installation et Configuration du service SSH sur Debian 12

**ECO-Lucy**
* Template : `Debian 12` / Type : `VM`.
* Configuration IP : `10.10.8.50/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 32GO` (Système) / `1 HDD 32GO` (RAID1) / `1 HDD 32Go` (Backup).
* Processeur : `2`.
* RAM : `8Go`.
* Fonction : `SSH` / `GLPI`.

Rendez-vous à l'annexe [SSH](/S11/annex/SSH.md).

### Installation et Configuration du Service GLPI sur Debian 12

**ECO-Lucy**
* Template : `Debian 12` / Type : `VM`.
* Configuration IP : `10.10.8.50/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 32GO` (Système) / `1 HDD 32GO` (RAID1) / `1 HDD 32Go` (Backup).
* Processeur : `2`.
* RAM : `8Go`.
* Fonction : `SSH` / `GLPI`.

Rendez-vous à l'annexe [GLPI](/S11/annex/GLPI.md).

### Création GPO dans l'Active Directory

**ECO-Maximus**
* Template : `Windows Server 2022` / Type : `VM`.
* Configuration IP : `10.10.8.100/25` / Passerelle : `10.10.255.254` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 100GO` (Système + Dossiers Partagés) / `1 HDD 100GO` (RAID1) / `1 HDD 100Go` (Backup).
* Processeur : `2`.
* RAM : `8Go`.
* Fonction : `DHCP` / `DNS` / `ADDS`.

Rendez-vous à l'annexe [ADDS_GPO](/S11/annex/ADDS_GPO.md).

### Déploiement rapide de serveur via des Scripts d'Automatisation

Notre équipe à élaborer 2 Scripts de déploiement rapide de serveur :
* Un Script pour le déploiement de ADDS sur serveur Windows Core.
* Un Script pour le déploiement rapide de GLPI sur Debian 12.

Rendez-vous à l'annexe [Script_Auto](/S11/annex/Script_Auto.md).
