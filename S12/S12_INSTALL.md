# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## Sommaire

1) Contexte

2) Pré-requis techniques

3) Installation et Configuration des équipements et ressources

## Contexte

```
# 1. Objectifs

1. Firewall - Prise en main du pare-feu pfsense
	1. Connexion :
		1. Login : `admin`
		2. Mdp : `pfsense`
	2. VM Proxmox :
		1. Interfaces :
			1. WAN (vmbr1 proxmox) : 10.0.0.3/24
				1. Gateway : 10.0.0.1
			2. LAN (vmbr6 proxmox) : 10.10.255.254/16 <= Accès console Web
			3. DMZ (vmbr7 proxmox) : Interface à gérer
		2. ID de VM de groupe à gérer
	3. Mise en place de règles de pare-feu (WAN et LAN)
		1. Règles de bonnes pratiques
		2. Principe du **Deny All**
2. Réseau - Utilisation de routeur sur l'infrastructure Proxmox
	1. Routeur Vyos
	2. Lien avec le schéma réseau initial
3. Sécurité - Gestion de la télémétrie sur un client Windows 10/11, 2 possibilités (au choix) :
	1. Gestion par script :
		1. Script crée sur un serveur Windows
		2. Script copié sur les clients (GPO, AT, etc.)
		3. Script exécuté sur les clients (GPO, AT, etc.)
	2. Gestion par GPO :
		1. Création d'une GPO ordinateur
		2. Création d'une GPO utilisateur

# 2. Proxmox

- Fourniture d'un template de routeur de type **VyOS** :
	- Nom du template : `VyosRouteur`
	- Documentation :
		- fichier markdown `1-routeurVyos-priseEnMain.md`
		- fichier markdown `2-routeurVyos-routageStatique.md`
- Possibilité d'utiliser des tags prédéfini

# 3. Remarque sur les objectifs de projet

1. Choix à faire par le groupe avant 12h00 le 1er jour du sprint (en général le lundi) des objectifs prioritaires, secondaires, optionnels
	1. À prendre dans ce sprint
	2. À prendre dans les sprint précédents
	3. Fichier d'objectifs à remplir sur le drive
2. Organisation interne du groupe à définir :
	1. Tâches du groupe pour la semaine (suivant les objectifs retenu)
	2. Tâches individuelles à notifier par jour (de lundi à vendredi)
	3. Tâches individuelles à mettre dans une feuille dans le fichier de suivi de projet

# 4. Point avec le formateur

Point à faire par le PO pour valider :
- Objectifs du sprint
- Tâches individuelles sur la semaine (jour par jour)
```

## Pré-requis techniques

## Installation et Configuration des équipements et ressources

### Configuration du Firewall Pfsense

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

Rendez-vous à l'annexe [PFSense](/S12/annex/PFSense.md).

### Mise en place et Configuration de Routeurs Vyos

**ECO-ROOT-01**
* Template : `Vyos` / Type : `VM`.
* Configuration IP : `10.10.8.10/29` / Carte réseau : `vmbr6`.
* Configuration IP : `10.10.8.254/25` / Carte réseau : `vmbr6`.
* Configuration IP : `10.10.9.126/25` / Carte réseau : `vmbr6`.
* Configuration IP : `10.10.11.126/25` / Carte réseau : `vmbr6`.
* Configuration IP : `10.10.11.254/25` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 4GO` (Système).
* Processeur : `1`.
* RAM : `1Go`.
* Fonction : `Vyos`.

**ECO-ROOT-02**
* Template : `Vyos` / Type : `VM`.
* Configuration IP : `10.10.8.20/29` / Carte réseau : `vmbr6`.
* Configuration IP : `10.10.9.254/25` / Carte réseau : `vmbr6`.
* Configuration IP : `10.10.10.126/25` / Carte réseau : `vmbr6`.
* Configuration IP : `10.10.10.254/25` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 4GO` (Système).
* Processeur : `1`.
* RAM : `1Go`.
* Fonction : `Vyos`.

**ECO-ROOT-03**
* Template : `Vyos` / Type : `VM`.
* Configuration IP : `10.10.8.30/16` / Carte réseau : `vmbr6`.
* Configuration IP : `10.10.8.126/25` / Carte réseau : `vmbr6`.
* Configuration IP : `10.10.8.11/29` / Carte réseau : `vmbr6`.
* Configuration IP : `10.10.8.21/29` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 4GO` (Système).
* Processeur : `1`.
* RAM : `1Go`.
* Fonction : `Vyos`.

Rendez-vous à l'annexe [Vyos](/S12/annex/Vyos.md).

### Gestion de la Télémétrie via GPO

Rendez-vous à l'annexe [Telemetry](/S12/annex/Telemetry.md).