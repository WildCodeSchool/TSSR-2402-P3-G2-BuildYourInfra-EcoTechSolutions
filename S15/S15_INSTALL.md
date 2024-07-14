# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## Sommaire

1) Contexte

2) Pré-requis techniques

3) Installation et Configuration des équipements et ressources

## Contexte

```
# 1. Objectifs

1. MESSAGERIE - Mettre en place un serveur de messagerie **iRedMail**
	1. Ce serveur doit permettre aux collaborateurs de communiquer en interne
	2. Des boites mails sont crée, liées à l'AD ou non
	3. Installation sur serveur autonome
2. SÉCURITÉ - Mettre en place un serveur de gestion des mots de passe **Bitwarden**
	1. Accès en web pour la gestion/l'utilisation
	2. Installation possible sur un serveur existant
3. GESTION DE PROJET/SUIVI DE TÂCHES - Mettre en place un serveur **RedMine** (https://www.redmine.org/)
	1. Permet de suivre les tâches et les problèmes
	2. Installation possible sur un serveur GNU/Linux existant

# 2. Gestion de l'infrastructure réseau

- Utiliser le plus possible les ressources existante pour une meilleure administration, comme par exemple les noms DNS, l'accès SSH, etc.
- Utiliser le plus possible des conteneurs CT :
	- Conteneur génériques comme **debian-12-standard_12.2-1_amd64**
	- Conteneur spécifique comme les conteneurs **"turnkey"** (https://www.turnkeylinux.org/)
- Gestion du volume **local-templates** :
	- Gestion des CT/VM
	- Gestion de l'espace de stockage restant (suppression des ressources inutiles)
		- => Attention à la mutualisation des ressources avec les autres groupes !
			- Nœud 5 : Groupe 1 et 2
			- Nœud 6 : Groupe 3 et 4
```

## Pré-requis techniques

## Installation et Configuration des équipements et ressources

### Mise en place d'une serveur de messagerie IRedMail

**IanMail**
* Template : `CT Debian 12` / Type `CT`.
* Configuration IP : `10.10.8.116/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 20Go` (Système).
* Processeur : `1`.
* RAM : `2Go`.
* Fonction : `IRedMail`.

Rendez-vous à l'annexe [IRedMail](/S15/annex/IRedMail.md).

### Gestion de projet / suivi de tâches avec **Redmine**

**Tandy**
* Template : `CT Debian 12` / Type `CT`.
* Configuration IP : `10.10.8.118/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 30Go` (Système).
* Processeur : `2`.
* RAM : `3Go`.
* Fonction : `Redmine`.

Rendez-vous à l'annexe [Redmine](/S15/annex/Redmine.md).

### Objectif personnalisé : Mise en place d'une VM Pentest

**ECO-KaliTest**
* Template : `Kali Linux` / Type `VM`.
* Configuration IP : `10.10.200.50/16` / Passerelle : `10.0.8.100` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 100Go` (Système).
* Processeur : `4`.
* RAM : `4Go`.
* Fonction : `Pentest KaliLinux`.

Rendez-vous à l'annexe [KaliLinux](/S15/annex/KaliLinux.md).

### Objectif personnalisé : Mise en place d'un Serveur Bastion

**ECO-ChefGoule**
* Template : `Debian 12` / Type `VM`.
* Configuration IP : `10.11.0.2/16` / Passerelle : `10.11.0.1` / Carte réseau : `vmbr7`.
* Hard Disk : `1 HDD 16Go` (Système).
* Processeur : `2`.
* RAM : `4Go`.
* Fonction : `Apache Guacamole`.

Rendez-vous à l'annexe [Guacamole](/S15/annex/Guacamole.md).

### Serveur **Bitwarden**

**KatjaBit**
* Template : `CT Debian 12` / Type `CT`.
* Configuration IP : `10.10.8.117/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 25Go` (Système).
* Processeur : `4`.
* RAM : `4Go`.
* Fonction : `Bitwarden`.

Rendez-vous à l'annexe [Bitwarden](/S15/annex/Bitwarden.md).