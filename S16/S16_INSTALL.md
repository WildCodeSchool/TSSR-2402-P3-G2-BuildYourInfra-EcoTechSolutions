# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## Sommaire

1) Contexte

2) Pré-requis techniques

3) Installation et Configuration des équipements et ressources

## Contexte

```
# 1. Objectifs

1. SÉCURITÉ - Mettre en place un serveur de gestion des mises-à-jour **WSUS**
	1. Ce serveur est lié à l'AD
	2. Les MAJ sont liées aux OU
	3. Différence de gestion entre les mises-à-jour pour les Clients, Serveurs, et DC
2. AD - Rôles FSMO
	1. Mettre en place un serveur Windows Server Core
	2. Partager les rôles FSMO entre les 3 DC

PARTENARIAT D'ENTREPRISE !
Un partenariat avec la société **BillU** a été validé !
En conséquence, les objectifs ci-dessous s'ajoutent aux précédents. Les priorités de mise en place seront effective **sous 2 semaines** (au lieu d'une seule habituellement).

3. PARTENARIAT D'ENTREPRISE - VPN site-à-site
	1. Mettre en place un VPN site-à-site entre les 2 réseaux d'entreprise pour avoir une communication sécurisée
4. PARTENARIAT D'ENTREPRISE - Active Directory
	1. Mettre en place l'une des 2 solutions suivantes pour la gestion des AD en commun :
		1. Fusion de domaines
		2. Relation de confiance
	2. Gérer l'accès distant pour les membres IT de l'autre entreprise (full access => à décider)
5. PARTENARIAT D'ENTREPRISE - FIREWALL
	1. Mettre à jour les règles pour permettre le trafic réseau entre les 2 réseaux d'entreprise (ping, etc.)
	2. Permettre l'accès à l'interface de gestion aux administrateurs de l'autre entreprise (full access => à décider)
6. PARTENARIAT D'ENTREPRISE - SUPERVISION
	1. La supervision mise en place doit pouvoir contrôler le réseau, le matériel, et les services de l'autre entreprise
	2. Gérer uniquement l'accès aux tableaux de bord pour les membres IT de l'autre entreprise (pas d'accès à l'administration)
7. PARTENARIAT D'ENTREPRISE - STOCKAGE
	1. Ajout à la structure de dossiers existant :
		1. Mise en place de dossiers partagés entre les utilisateurs des sociétés
	2. Permettre l'accès à la gestion de la sécurité des dossiers partagés pour les membres IT de l'autre entreprise 

# 2. Contexte

- Vous n'aurez accès aux ressources systèmes et réseaux de l'autre entreprise que par :
	- SSH
	- Bureau à distance
	- Ou tout autre moyen de communication sécurisée
- Vos différents accès seront gérés par les membres IT de l'autre entreprise
```

## Pré-requis techniques

## Installation et Configuration des équipements et ressources

### Installation du serveur WSUS

WSUS signifie Windows Server Update Service et il s’agit du rôle intégré à Windows Server qui a une mission bien précise, la distribution des mises à jour des produits Microsoft sur les postes de travail et serveurs de notre entreprise.

**ECO-Thaddeus**
* Template : `Windows Server 2022` / Type : `VM`.
* Configuration IP : `10.10.8.109/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 32GO` (Système) / `1 HDD 32GO` (WSUS) / `1 HDD 32Go` (Unallocated).
* Processeur : `2`.
* RAM : `4Go`.
* Fonction : `DHCP` / `DNS` / `ADDS`.

Rendez-vous à l'annexe [WSUS](/S16/annex/WSUS.md).

### Transfert des rôles FSMO entre les serveurs

**ECO-Maximus**
* Template : `Windows Server 2022` / Type : `VM`.
* Configuration IP : `10.10.8.100/25` / Passerelle : `10.10.255.254` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 100GO` (Système + Dossiers Partagés) / `1 HDD 100GO` (RAID1) / `1 HDD 100Go` (Backup).
* Processeur : `2`.
* RAM : `8Go`.
* Fonction : `DHCP` / `DNS` / `ADDS`.

Rendez-vous à l'annexe [FSMO](/S16/annex/FSMO.md).

### Solutions au partenariat avec la société BillU.

Une étroite collaboration est désormais active entre Ecotech Solutions et BillU.

```
BillU et Ecotechsolutions, un duo d'innovations,
S'unissent pour l'avenir, pour de grandes ambitions.
Ensemble, ils bâtissent des solutions durables,
Pour un monde plus vert, plus sain et plus stable.

Avec BillU, la technologie prend son envol,
Ecotechsolutions, c'est l'écologie qui colle.
Leurs forces combinées, pour un impact sans égal,
Un partenariat puissant, un potentiel colossal.

Des outils numériques, aux solutions écologiques,
Ils ouvrent la voie, vers un futur plus magique.
Chaque projet, une promesse, d’un monde transformé,
Où technologie et nature, enfin réconciliées.

Laissez-vous inspirer par cette alliance prospère,
BillU et Ecotechsolutions, un duo exemplaire.
Pour aujourd’hui et demain, ils tracent le chemin,
Vers un futur radieux, où tout devient plus sain.
```

#### Partenariat d'netreprise : Règles du Firewall

**ECO-FW-01**
* Template : `PFSense` / Type : `VM`.
* Configuration IP (WAN) : `10.0.0.3/24` / Carte réseau : `vmbr1`.
* Configuration IP (LAN) : `10.10.255.254/16` / Carte réseau : `vmbr6`.
* Configuration IP (DMZ) : `10.11.0.1/16` / Carte réseau : `vmbr7`.
* Configuration IP (LANv2) : `10.20.255.254/16` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 6GO` (Système).
* Processeur : `1`.
* RAM : `2Go`.
* Fonction : `PFSense`.

Rendez-vous à l'annexe [Partnership](/S16/annex/Partnership.md).

#### Partenariat d'entreprise : VPN site-à-site

Dans le cadre du partenarait entre les sociétés **_BillU_** **_EcotechSolutions_**, nous avons installé et configuré un serveur VPN avec l'équipe de **Skylan**.

**ECO-Cooper**
* Template : `Debian 12` / Type : `VM`.
* Configuration IP : `10.11.0.3/16` / Passerelle : `10.11.0.1` / Carte réseau : `vmbr7`.
* Hard Disk : 1 HDD 32Go (Système).
* Processeur : `1`.
* RAM : `2Go`.
* Fonction : `OpenVPN`.

Vous pourrez trouver la documenation complète : [OpenVPN site-à-site](/S16/annex/OpenVPN.md).

Edit : La solution du serveur **OpenVPN** n'étant pas totalement fonctionnelle, nous avons revu cela en S18, et sommes passés directement via PFSense.