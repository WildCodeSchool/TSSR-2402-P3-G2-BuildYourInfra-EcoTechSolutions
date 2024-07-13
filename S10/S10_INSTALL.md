# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## **Sommaire**

1) Contexte

2) Pré-requis techniques

3) Installation et Configuration des équipements et ressources

## Contexte

```
# 1. Objectifs

1. AD-DS - Création d'un domaine AD
	1. Un serveur Windows Server 2022 GUI avec les rôles AD-DS, DHCP, DNS
	2. Un serveur Windows Server 2022 Core avec le rôle AD-DS
	3. Les 2 serveurs sont des DC du domaine et ont une réplication complète gérée
2. Gestion de l'arborescence AD
	1. Création des OU
	2. Création des groupes
	3. Création des comptes
3. Gestion de l'arborescence AD  entièrement automatisée à partir du fichier CSV
	1. Création des groupes
	2. Création des comptes
4. Création d'une VM Serveur Linux Debian mise sur le domaine AD accessible en SSH
5. Création d'une VM client
	1. Sur le domaine AD
	2. Avec un compte utilisateur ayant un accès SSH sur le serveur Linux

# 2. Réseau (sous Proxmox)

Adresse IP de réseau : 10.10.0.0/16
Adresse de passerelle : 10.10.255.254
Adresse IP DNS : 10.10.255.254
```

## Pré-requis techniques

## Installation et Configuration des équipements et ressources

### Configuration du rôle AD-DS sur Windows Server en GUI

Pour rappel notre serveur `ECO-Maximus` avec l'IP `10.10.8.100/16`. Ce serveur possède les rôles _DHCP_, _DNS_ et _AD-DS_.

**ECO-Maximus**
* Template : `Windows Server 2022` / Type : `VM`.
* Configuration IP : `10.10.8.100/16` / Passerelle : `10.10.255.254` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 100GO` (Système + Dossiers Partagés) / `1 HDD 100GO` (RAID1) / `1 HDD 100Go` (Backup).
* Processeur : `2`.
* RAM : `8Go`.
* Fonction : `DHCP` / `DNS` / `ADDS`.

Rendez-vous à l'annexe [ADDS_Conf_WinServGUI](/S10/annex/ADDS_Conf_WinServGUI.md).

### Installation et Configuration du rôle AD-DS sur Windows Server en Core

Pour rappel notre serveur `ECO-Moldaver` avec l'IP `10.10.8.120/16` sera en version Core (non-graphique) et aura uniquement le rôle _AD-DS_. Il servira à la réplication des données AD-DS, afin d'avoir une redondance sur le réseau.

**ECO-Moldaver**
* Template : `Windows Server 2022 Core` / Type : `VM`.
* Configuration IP : `10.10.8.120/16` / Passerelle : `10.10.255.254` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 32Go` (Système) / `1 HDD 32GO` (RAID1).
* Processeur : `2`.
* RAM : `2Go`.
* Fonction : `DNS` / `ADDS`.

![ADDS](/S10/ressource/moldaver/Config_IP.PNG)

Rendez-vous à l'annexe [ADDS_WinServCore](/S10/annex/ADDS_WinServCore.md).