# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## Sommaire

1) Contexte

1) Pré-requis techniques

2) Installation et Configuration des équipements et ressources

3) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## Contexte

```
# 1. Objectifs

1. SERVEUR RADIUS - Utilisation de **Free Radius**
	1. Gérer les accès des utilisateurs :
		1. Accès administratif pour l'administration des serveurs (glpi, pfsense, etc.)
		2. Authentification pour les applications, comme glpi par exemple, pour les utilisateurs
	2. ET/OU -> Gestion centralisée du VPN
2. AUDIT DE CONFIGURATION - Utilisation du logiciel **PurpleKnight** (https://www.purple-knight.com/fr/) sur l'AD
	1. Scan de configuration à effectuer
	2. Analyse des résultats et des actions correctives proposées
	3. Tendre vers 100%
3. AUDIT DE CONFIGURATION - Utilisation du logiciel  **PingCastle** (https://www.pingcastle.com/) sur l'AD
	1. Scan de configuration à effectuer
	2. Analyse des résultats et des actions correctives proposées
	3. Tendre vers 0%
4. DÉTECTION DES VULNÉRABILITÉS - Utilisation du logiciel **BloodHound** (https://github.com/BloodHoundAD/BloodHound) sur l'AD
	1. Mappage des "chemins d'attaque"
	2. analyser les relations et les chemins possibles
	3. Corriger les failles
5. ÉVALUATION DE LA CONFORMITÉ - Utilisation du logiciel **OpenSCAP** (https://github.com/OpenSCAP)
	1. Scan de conformité à effectuer
	2. Analyse des résultats et des écarts par rapport aux normes
	3. Mise en œuvre des recommandations pour atteindre la conformité

INFRASTRUCTURE RÉSEAU HS !
Suite à un problème électrique certains éléments de l'infrastructure ne fonctionnent plus.
Le MCO (*Maintient en Condition Opérationnelle*) n'est plus valide.
En conséquence, l'objectif **obligatoire** ci-dessous s'ajoute aux autres.

6. PRA (Plan de Reprise d'Activité)
	1. Évaluation :
		1. Identification des élément critiques HS
		2. Documentation des dommages subies
	2. Identification :
		1. Priorisation des services à rétablir en priorité
		2. Listing des tâches pour chaque priorisation
	3. Réparation :
		1. Réparation des éléments
		2. Vérification que le statut de chaque élément est opérationnel
	4. Documentation :
		1. Création de document si non-existant
		2. Mise à jour des documents si ce n'était pas le cas

# 2. Contexte

Sur l'infrastructure HS :
- Certains éléments visibles sont en réalité dysfonctionnels, donc à étudier et à analyser
- Les éléments non-visible sont considéré comme complètement HS et non-récupérable
Pour les éléments à installer "from scratch" :
- Le plus possible, utiliser les templates fourni
- Ne pas mettre les disques en RAID 1 et/ou ne pas utiliser LVM
```

## Pré-requis techniques

## Installation et Configuration des équipements et ressources

### Plan de Reprise d'activité (PRA)

Suite à un problème électrique certains éléments de l'infrastructure ne fonctionnent plus.
Le MCO (*Maintient en Condition Opérationnelle*) n'est plus valide.

Retrouvez le détail du PRA dans la documentation prévue à cet effet : [PRA](/S18/annex/PRA.md).

### OpenVPN via PFSense

Nous avons revu la solution VPN de la S16 qui n'était pas totalement fonctionnel et sommes passés diretetement via PFSense.

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

Vous trouverez toute la documentation en annexe : [OpenVPN Via PFSense](/S18/annex/OpenVPN.md).

### Détection de vulnérabilités AD avec BloodHound

**ECO-KaliTest**
* Template : `Kali Linux` / Type `VM`.
* Configuration IP : `10.10.200.50/16` / Passerelle : `10.0.8.100` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 100Go` (Système).
* Processeur : `4`.
* RAM : `4Go`.
* Fonction : `Pentest KaliLinux`.

Rendez-vous à l'annexe [BloodHound](/S18/annex/BloodHound.md).

### Audit de Configuration AD via PingCastle

PingCastle est un logiciel français bien connu par les entreprises du secteur de la cybersécurité. La bonne nouvelle, c'est que vous pouvez l'utiliser gratuitement pour auditer votre propre annuaire Active Directory. Par contre, si vous utilisez PingCastle pour auditer l'annuaire d'un client dans le cadre d'une prestation, vous devez acquérir une licence. Le site de PingCastle est très clair à ce sujet : "Avec la licence par défaut, le programme peut être exécuté gratuitement, tant que vous n'en tirez aucun revenu. Par exemple, toute organisation à but lucratif peut l'utiliser pour auditer ses propres systèmes. Pour inclure PingCastle dans un package ou un service commercial, il faut acheter une licence spécifique."

**ECO-Maximus**
* Template : `Windows Server 2022` / Type : `VM`.
* Configuration IP : `10.10.8.100/25` / Passerelle : `10.10.255.254` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 100GO` (Système + Dossiers Partagés) / `1 HDD 100GO` (RAID1) / `1 HDD 100Go` (Backup).
* Processeur : `2`.
* RAM : `8Go`.
* Fonction : `DHCP` / `DNS` / `ADDS`.

Rendez-vous à l'annexe [PingCastle](/S18/annex/PingCastle.md).