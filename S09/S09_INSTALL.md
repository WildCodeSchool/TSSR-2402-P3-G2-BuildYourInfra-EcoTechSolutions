# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## **Sommaire**

1) Contexte

2) Pré-requis techniques

3) Installation et Configuration des équipements et des ressources

## Contexte

```
# 1. Contexte

**EcoTech Solutions**, basée à Bordeaux, est spécialisée dans le développement de solutions IoT (Internet des objets) pour la gestion intelligente de l'énergie et des ressources. En partenariat avec le gouvernement et les entreprises du secteur de l'énergie, elle déploie des systèmes de surveillance et de contrôle avancés pour optimiser l'utilisation des ressources naturelles, réduire les émissions de carbone et promouvoir la durabilité environnementale. Son expertise technologique et son engagement envers l'innovation en font un acteur clé dans la transition vers une économie verte.
Vous faite partie d'une société prestataire de services appelé en renfort par cette société pour mettre en place une infrastructure réseau.
Dans le contexte du projet, le formateur sera le DSI de la société EcoTech Solutions.

# 2. La société

## a. Utilisateurs

La société comprend actuellement 54 personnes réparties dans 7 départements.
Des personnels extérieurs sont inclus.

## b. Départements

- Communication
- Développement
- Direction
- Direction des Ressources Humaines
- DSI
- Finance et Comptabilité
- Service Commercial

## c. Nomadisme

Pas de nomadisme, pas de télétravail possible.

## d. Matériel client

100 % de PC portables de marques très hétérogènes.

## e. Matériel d'administration

Aucun serveur ni matériel réseau.

## f. Evolution de la société

Un partenariat est en cours et pourrait aboutir dans les prochains mois.

## g. Réseau

Pour les utilisateurs interne, réseau en wifi fourni par une box FAI et des répéteurs wifi.
Le réseau est en 10.10.8.0/24 .

## h. Messagerie

La messagerie est hébergée en cloud sur le web.
Le format est `prenom.nom@ecotechsolutions.fr`.

## i. Sécurité

Pas de matériel spécifique.
Pas de sécurité d'identité.
Tous les PC sont en workgroups avec une connexion sans mot de passe.

## j. Stockage de données

Un NAS indépendant grand public stock des données.
Pas de retentions et pas de redondance.

## k. Téléphonie

Téléphonie fixe et mobile aléatoire suivant les utilisateurs.


# 3. Objectifs

A partir des différents éléments à disposition (détail de la société, fichier annexe, contenu des projets 1 et 2), faire une analyse de l'état actuel de la société et estimer les besoins.
A partir de cela, faire des propositions d'objectifs, les classer, et estimer sur quel sprint ils devront être mis en place.

Exemples d'objectifs possibles (liste non-exhaustive) :

- Fournir un plan d'adressage réseau complet cohérent :
	- Configuration IP de LAN/VLAN
	- Configuration IP des matériels réseaux
- Fournir un plan schématique du futur réseau :
	- Nom des matériels
	- Configuration IP
- Faire la liste des serveurs/matériels nécessaires à l'élaboration de la future infrastructure réseau
- Mettre en place une nomenclature de nom :
	- Serveurs
	- Ordinateurs clients
	- Utilisateurs
	- Groupes
	- ...
- Création de VM serveur / client
	- Configuration ?
	- OS ?
	- Fonction / rôle ?
- Création d'un domaine
	- Nom du domaine AD
	- Configuration
- Création des OU correspondant aux différents service de la société
	- OU de départements
	- OU de services
- Création des groupes correspondant aux différents groupes d'utilisateurs de la société
	- Groupes de départements
	- Groupes de services
	- Groupes fonctionnels
	- Groupes de sécurité
- Intégration des données dans l'AD :
	- Utilisateurs
	- Ordinateurs


# 4. Mise en place du suivi des objectifs du projet

Fichier disponible sur le drive dans le dossier du projet 3 : **Suivi des objectifs de projet - ...**
## a. Début de sprint
MAJ d'un tableau dans lequel on trouve les objectifs de la semaine :
- Par catégorie
- 1 objectif par ligne

## b. Fin de sprint
Présentation pendant le bilan du projet des objectifs de la semaine réalisés.

## c. Le tableau
On y trouve :
- Les objectifs principaux, secondaires, et optionnels
- Les numéros de semaine de formation associés aux objectifs
- Le statut de chaque objectif :
	- `Non-Fait` : Aucun travail n'a été fait sur l'objectif
	- `En cours - 25 %` : 1/4 de l'objectif réalisé
	- `En cours - 50 %` : moitié de l'objectif réalisé
	- `En cours - 75 %` : 3/4 de l'objectif réalisé
	- `Terminé` : L'objectif est complètement fonctionnel avec documentation, etc.
- La date de réalisation à 100 %
- Les raisons pour lesquelles l'objectif n'a pas été terminé (si c'est le cas)

# 5. Annexes

Fourniture d'un fichier Excel contenant la liste des utilisateurs de la société.
```

## **Pré-requis techniques**

![Ecotech](/S09/ressource/Ecotech_Logo.png)

Voici la situation originelle de la société **_EcoTech Solutions_**
* Nombre d'employés : 54 répartis dans 7 départements distincts, incluant 6 personnes extérieures
* Pas de nomadisme, ni de télétravail
* 48 PC portables de marques hétérogènes, il n'est à ce jour pas prévu de les changer
* Aucun serveur, ni matériel réseau
* Réseau 10.10.8.0/24 en WIFI uniquement (fourni par la Box FAI) avec des répéteurs WIFI
* Messagerie hébergée en Cloud sur le Web, chaque collaborateur a une adresse mail du type `prenom.nom@ecotechsolutions.fr`
* Pas de matériel spécifique dédié à la Sécurité, les PC sont en workgroups avec connexion sans mot de passe
* Un NAS "grand public" indépendant sert au stockage des données, pas de rétentions ni de redondance
* Ligne téléphone fixe et portable aléatoire suivant les collaborateurs

Nous avons dans un premier temps réalisé un Organigramme, afin de mieux situer les besoins de **_EcoTech Solutions_**

![EcoTech](/S09/ressource/EcoTech_Organigramme.png)

Cet organigramme est sujet à remaniement, étant donné qu'un partenariat est en cours et pourrait aboutir dans un avenir proche.

Nous avons délibérement inclus les membres de notre société, dans le service DSI.

### Récapitulatif des ressources nécessaires

Afin de préparer au mieux la transition, nous avons réalisé une étude afin de déterminer :
* Les besoins matériel de l'entreprise, nécessaires à l'élaboration d'une infrastructure réseau complète
* Une nomenclature de nom pour standardisation
* Le plan schématique du futur réseau
* Le plan d'adressage du futur réseau

#### Les besoins matériel

Cette liste est un premier jet qui servira de base à la construction de l'infrastructure réseau nécessaire pour un bon fonctionnement spécifique à l'entité, elle pourra bien évidemment évoluer dans le temps en fonction des besoins de **_EcoTech Solutions_**.

![EcoTech](/S09/ressource/Listing_Materiel.JPG)

#### La nomenclature de nom

Cette nomenclature a été établie afin de standardiser l'infrastructure et les évolutions possibles de celle-ci.

Elle correspond à la mise en place à venir de **_Active Directory_** qui permet de fournir des services centralisés d'identification, d'authentification et de gestions de politiques dans un réseau d'ordinateurs.

![Ecotech](/S09/ressource/AD_Nomenclature_01.JPG)
![Ecotech](/S09//ressource/AD_Nomenclature_02.JPG)

En ce qui concerne la standardisation Matériel :
* Les PC Portables actuellement disponibles vont être renommés sous la forme `ECO-LP-xx` (où `xx` sera un numéro).
* Dans le cas où des PC fixe seraient mis en place, ils seront nommés sous la forme `ECO-WS-xx`.
* Les Téléphones sont aussi référencés, respectivement `ECO-FIX-xx` pour les téléphones fixes et `ECO-TEL-xx` pour les portables.
* Nous avons prévus également un standard pour les péréiphériques potentiellement utiles : `ECO-PRT-xx` pour les imprimantes, `ECO-FAX-xx` pour les Fax, `ECO-SCAN-xx` pour les scanners, `ECO-VOIP-xx` pour la téléphonie VoIP
* Les serveurs mis en place seront nommés sous la forme `ECO-xxxxxx` (où `xxxxxx` correspondra à un nom donné au Serveur en fonction de son rôle, la liste sera fourni au fur et à mesure).

En ce qui concerne la standardisation Utilisateur :
* Les utilisateurs auront un identifiant sous la forme `pnom` (où `p` correspond à la premmière lettre du prénom et `nom` correspon au nom complet sans caractère spécial, le tout en minuscule).
* Les collaborateurs ayant besoin d'un accés _Adminstrateur_  auront des comptes supplémentaires sous la forme `pnom-ADMINx`.

En ce qui concerne la standardisation du domaine _Active Directory_ :
* Le domaine en premier lieu sera nommé `ecotechsolutions.fr`
* Les unités organisationnelles (OU) seront sous la forme `EcoT_cible` (où la cible peut correspondre à une localisation, un département, un service ou un sous-service).
* Les groupes seront sous la forme `GRP_EcoT_cible` (où la cible peut être un matériel ou un utilisateur).
* Les stratégies de Groupes (GPO pour Group Policy Object) seront sous la forme `GPO_EcoT_cible_motif` (où la cible pourra être un OU, un groupe, un matériel, un utilisateur ET le motif facilitera la compréhension du GPO pour les Administrateurs).

#### Le plan schématique du réseau

![Ecotech](/S09/ressource/Plan_Schema_Reseau.png)

Nous avons découpé l'entreprise en deux parties : 
* D'une part, la Direction, comprenant également la Direction des Ressources Humaines (DRH) et la Direction des Systèmes d'Information (DSI)
* D'autre part, les autres départements : Développement, Communication, Finance et Comptabilité, ainsi que le Service Commercial

Dans la colonne de gauche, vous trouverez les _Clients_, nous utilisons le nom abrégé avec la plage de réseau correspondant au département.
- CLI_COM = Département Communication
- CLI_DEV = Département Développement
- CLI_BUS = Département Service Commercial
- CLI_FICO = Département Finance et Comptabilité
- CLI_DIR = Département Direction
- CLI_DRH = Département Direction des Ressources Humaines
- CLI_DSI = Département Direction des Systèmes Informatiques

Ainsi, nous avons un _Routeur_ pour chaque partie avec des _Switchs_ pour lier les machines au réseau.

Un _Routeur_ principal qui assurera la liaison entre ces deux parties, avec une _Zone Démilitarisée_ (DMZ) qui correspond à un sous-réseau isolé contenant les _Serveurs_ et les _Conteneurs_ de stockage, ainsi que le Cloud pour la _Messagerie_.

Au vu du potentiel partenariat à venir, il sera ainsi aisé d'intégrer une nouvelle partie.

#### Le plan d'adressage du réseau

![Ecotech](/S09/ressource/Plan_Adressage.JPG)

![Ecotech](/S09/ressource/Table_Routage.JPG)

## **Installation et Configuration des équipements et des ressources**

Nous aurons ainsi un serveur commun aux rôles DHCP, DNS et AD-DS, celui-ci se nomme `ECO-Maximus` avec l'IP `10.10.8.100/16`

**ECO-Maximus**
* Template : `Windows Server 2022` / Type : `VM`.
* Configuration IP : `10.10.8.100/16` / Passerelle : `10.10.255.254` / Carte réseau : `vmbr6`.
* Hard Disk : `1 HDD 100GO` (Système + Dossiers Partagés) / `1 HDD 100GO` (RAID1) / `1 HDD 100Go` (Backup).
* Processeur : `2`.
* RAM : `8Go`.
* Fonction : `DHCP` / `DNS` / `ADDS`.

![Maximus](/S09/ressource/maximus/Maximus_DHCP_01.PNG)

### Installation et Configuration du rôle DHCP sur Windows Server 2022 en GUI

Rendez-vous à l'annexe [DHCP_WinServGUI](/S09/annex/DHCP_WinServGUI.md).

### Installation et configuration du rôle DNS sur Windows Server 2022 en GUI

Rendez-vous à l'annexe [DNS_WinServGUI](/S09/annex/DNS_WinServGUI.md).

### Installation du rôle AD-DS sur Windows Server en GUI

Rendez-vous à l'annexe [ADDS_WinServGUI](/S09/annex/ADDS_WinServGUI.md).
