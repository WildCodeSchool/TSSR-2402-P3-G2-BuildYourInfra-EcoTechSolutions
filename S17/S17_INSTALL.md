# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## Sommaire

1) Contexte

2) Pré-requis techniques

3) Installation et Configuration des équipements et ressources

## Contexte

```
# 1. Objectifs

1. VOIP - Mettre en place le serveur de téléphonie sur IP **FreePBX**
	1. Création de lignes VoIP
	2. Validation de communication téléphonique VoIP entre 2 clients
	3. Configuration de l'authentification LDAP/AD (optionnelle)
2. WEB - Mettre en place un serveur WEB (interne ou externe en DMZ)

# 2. Contexte

- Les objectifs liés au partenariat d'entreprise sont à finaliser cette semaine
- La partie **"Notes"** des VM/CT doit être modifiée et remplie comme ceci :

# Nom de la machine

## Résumé

* Propriétaire
* Usage principal
* Pour les CT : Nom du template d'origine
* Pour les VM : ISO ou template d'origine

## Réseau

* vmbrx
* Adresse IP avec CIDR

## Services/Rôles

* Service/Rôle
  * Spécificité (si nécessaire)

## Remarques

* RAID ...
* Réplication de serveur
* etc.
```

## Pré-requis techniques

## Installation et Configuration des équipements et ressources

### Mise en place du serveur FreePBX pour la VoIP

**ECO-Dane**
* Template : `RedHat` / Type : `VM`.
* Configuration IP : `10.10.8.51/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 32Go` (Système).
* Processeur : `2`.
* RAM : `4Go`.
* Fonction : `FreePBX`.

Rendez-vous dans l'annexe [FreePBX](/S17/annex/FreePBX.md).

### Mise en place d'un serveur web via Caddy

Caddy est un serveur web open source écrit en Go, créé par ZeroSSL. Il est réputé pour sa simplicité et son efficacité, offrant une alternative moderne à des serveurs web plus connus comme Apache et Nginx. Voici quelques caractéristiques clés de Caddy :

 - HTTPS Automatique : Caddy obtient et renouvelle automatiquement des certificats TLS pour vos sites web via Let's Encrypt. Il peut aussi fournir du HTTPS pour localhost.
 - Configuration Flexible : La configuration se fait via un fichier Caddyfile en mode déclaratif ou au format JSON. Des "Config Adapters" permettent de convertir des configurations d'autres serveurs comme Nginx.
 - API Native : Pour la gestion de la configuration du serveur web.
 - Installation et Configuration Rapides : Caddy est facile à installer et à configurer pour publier un simple site web.
 - Gestion Multi-sites : Il peut gérer plusieurs sites web avec des "virtual hosts".
 - Reverse Proxy : Caddy peut aussi agir en tant que reverse proxy.

**Pour des raisons inconnus, nous avons du changer de serveur web car la page web de Caddy ne fonctionnait plus**

### Installation d'un serveur web avec Apache

**PorcaMiseria**
* Template : `CT Debian 12` / Type : `CT`.
* Configuration IP : `10.11.0.8/16` / Passerelle : `10.11.0.1` / Carte réseau : `vmbr7`.
* Hard Disk : `1 HDD 8Go` (Système).
* Processeur : `2`.
* RAM : `2Go`.
* Fonction : `Apache`.

Rendez-vous à l'annexe [Web_Apache](/S17/annex/Web_Apache.md).

### Partenariat d'entreprise : Relation d'approbation Active Directory et Stockage

Cette semaine, nous avons la charge, en partenariat avec l'entreprise BillU, de mettre en place une relation d'approbation entre nos deux forêts Active Directory. Malheureusement, nos deux réseaux ne communiquent pas. Pour résoudre ce problème, nous avons essayé de modifier les règles du pare-feu sur pfSense, mais cela n'a rien donné. Ensuite, nous avons tenté d'établir une connexion en installant OpenVPN sur le pare-feu pfSense avec un système de clé partagée, en suivant la documentation de Netgate. Malheureusement, cela n'a pas fonctionné non plus.

En dernière solution, nous avons voulu mettre en place un tunnel IPsec, qui est un protocole permettant de sécuriser les échanges de données entre deux réseaux via un tunnel crypté. Cependant, cela n'a pas fonctionné.

Nous n'avons pas pu identifier la source du problème malgré toutes nos tentatives. Ce n'est que partie remise ; nous allons nous pencher dessus au plus rapide.

### Objectif Personnalisé : Ansible

Tout d'abord, je vous présente l'outil Ansible qui est un outil open source d'automatisation informatique qui permet de gérer des configurations, de déployer des applications et de réaliser des tâches d'orchestration. Développé par Red Hat, Ansible est conçu pour être simple à utiliser tout en restant puissant et flexible. Il permet aux utilisateurs de décrire les états souhaités de leurs systèmes à l'aide d'un langage simple et facile à comprendre, et d'automatiser les tâches nécessaires pour atteindre ces états. Ansible peut être utilisé pour gérer des environnements allant de quelques machines à plusieurs milliers de nœuds.

**MacLeanAnsi**
* Template : `CT Debian 12` / Type : `CT`.
* Configuration IP : `10.10.8.104/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 32Go` (Système).
* Processeur : `2`.
* RAM : `4Go`.
* Fonction : `Ansible`.

Rendez-vous à l'annexe [Ansible](/S17/annex/Ansible.md).
