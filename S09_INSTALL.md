# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## **Sommaire**

1) Pré-requis techniques

2) Installation et Configuration des équipements et des ressources

3) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## **Pré-requis techniques**

![](./ressource/S09/images/Ecotech_Logo.png)

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

![Orga_EcoTech](./ressource/S09/images/Ecotech_Orga.JPG)

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

![Materiel_EcoTech](./ressource/S09/images/Listing_Materiel.JPG)

### La nomenclature de nom

Cette nomenclature a été établie afin de standardiser l'infrastructure et les évolutions possibles de celle-ci.

Elle correspond à la mise en place à venir de **_Active Directory_** qui permet de fournir des services centralisés d'identification, d'authentification et de gestions de politiques dans un réseau d'ordinateurs.

![AD_Nomenclature](./ressource/S09/images/AD_Nomenclature_01.JPG)
![AD_Nomenclature](./ressource/S09/images/AD_Nomenclature_02.JPG)

En ce qui concerne la standardisation Matériel :
* Les PC Portables actuellement disponibles vont être renommés sous la forme `ECO-LP-xx` (où `xx` sera un numéro).
* Dans le cas où des PC fixe seraient mis en place, ils seront nommés sous la forme `ECO-WS-xx`.
* Les Téléphones sont aussi référencés, respectivement `ECO-FIX-xx` pour les téléphones fixes et `ECO-TEL-xx` pour les portables.
* Nous avons prévus également un standard pour les péréiphériques potentiellement utiles : `ECO-PRT-xx` pour les imprimantes, `ECO-FAX-xx` pour les Fax, `ECO-SCAN-xx` pour les scanners, `ECO-VOIP-xx` pour la téléphonie VOIp
* Les serveurs mis en place seront nommés sous la forme `ECO-SRV-App-xx` (où `App` correspondra à l'application du serveur et `xx` sera un numéro).

En ce qui concerne la standardisation Utilisateur :
* Les utilisateurs auront un identifiant sous la forme `ABCDx` (où `ABCD` sera composé de lettre de leurs prénoms et nom et `x` sera un chiffre partant de 0 et croissant dans les cas d'homonymie).
* Les collaborateurs ayant besoin d'un accés _Adminstrateur_  auront des comptes supplémentaires sous la forme `ABCDx-ADMINx`.

En ce qui concerne la standardisation du domaine _Active Directory_ :
* Le domaine en premier lieu sera nommé `ecotechsolutions.fr`
* Les unités organisationnelles (OU) seront sous la forme `EcoT_cible` (où la cible peut correspondre à une localisation, un département, un service ou un sous-service).
* Les groupes seront sous la forme `GRP_EcoT_cible` (où la cible peut être un matériel ou un utilisateur).
* Les stratégies de Groupes (GPO pour Group Policy Object) seront sous la forme `GPO_EcoT_cible_motif` (où la cible pourra être un OU, un groupe, un matériel, un utilisateur ET le motif facilitera la compréhension du GPO pour les Administrateurs).

### Le plan schématique du réseau

![Schéma_Réseau](./ressource/S09/images/Plan_Schema_Reseau.png)

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

### Le plan d'adressage du réseau

![Plan_Adressage](./ressource/S09/images/Plan_Adressage.JPG)

![Table_Routage](./ressource/S09/images/Table_Routage.JPG)

## **Installation et Configuration des équipements et des ressources**

Nous aurons ainsi un serveur commun aux rôles DHCP, DNS et AD-DS, celui-ci se nomme `ECO-Maximus` avec l'IP `10.10.8.100/25`

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_01.PNG)

### Installation et configuration du rôle DHCP

#### Installation du rôle DHCP sur Windows Server en GUI

1. Dans le *Server Manager*, cliquez sur *Manage* > *Add Roles and Features*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_02.PNG)

2. Dans l'onglet *Before you begin* > *Next*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_03.PNG)

3. Dans l'onglet *Installation type* > *Role-based of feature-based installation* > *Next*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_04.PNG)

4. Dans l'onglet *Server Selection* > *Next*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_05.PNG)

5. Dans l'onglet *Server Roles*, cochez *DHCP Server* puis *Next*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_06.PNG)

6. Cliquez sur *Add Features*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_07.PNG)

7. Puis *Next*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_08.PNG)

8. Dans l'onglet *Features* > *Next*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_09.PNG)

9. Dans l'onglet *DHCP Server* > *Next*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_10.PNG)

10. Enfin, dans l'onglet *Confirmation* > **_Install_**.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_11.PNG)

11. A la fin de l'installation > *Close*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_12.PNG)

12. De retour sur le *Server Manager*, cliquez sur le triangle jaune, puis *Complete DHCP Configuration*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_13.PNG)

13. Cliquez sur *Next*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_14.PNG)

14. Cliquez sur *Close*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_15.PNG)

Votre Rôle *_DHCP_* est désormais fonctionnel.

#### Configuration du rôle DHCP sur Windows Server en GUI

1. Dans le *Server Manager*, cliquez sur *Tools* puis **_DHCP_**.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_16.PNG)

2. Déroulez le menu du serveur jusqu'à voir _IPv4_.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_17.PNG)

3. Faites *Clic-droit* sur _IPv4_ > *New Scope*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_18.PNG)

4. Cliquez sur *Next*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_19.PNG)

4. Donnez un *Nom* à l’étendue **_DHCP_**, la *Description* est optionnelle. Dans notre cas, nous créons notre première étendue qui correspond au Service _Communication_. Cliquez sur *Next*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_20.PNG)

5. Saisissez les champs tous les champs, en lien avec le plan d'adressage réseau, fourni ci-dessus. Dans notre cas, le Service _Communication_ est sur le réseau 10.10.8.128/25. Cliquez sur *Next*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_21.PNG)

6. S’il y a des adresses IP à **_exclure_** de la plage sélectionnée, indiquez-les sur la fenêtre *Add Exclusions and Delay*. Cliquez sur *Next*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_22.PNG)

7. Par défaut, la **_Durée du bail_** est de 8 jours. Modifiez cette durée si nécessaire. La durée du bail est la durée pendant laquelle une adresse IP sera réservée à un appareil. Cliquez sur *Next*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_23.PNG)

8. Sélectionnez *Yes, I want ton configure these options now*, puis cliquez sur *Next*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_24.PNG)

9. Votre réseau informatique est certainement équipé d’un routeur ou d’une box pour l’accès à internet. A la fenêtre **_Router_**, indiquez l’**_adresse IP_** de ce boitier qui deviendra la passerelle par défaut des postes en [DHCP](https://www.windows8facile.fr/tag/dhcp/). Ainsi, pas besoin de configurer chaque PC pour qu’il puisse aller sur internet.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_25.PNG)

10. Dans la fenêtre *Domain Name et DNS Servers*, cliquez sur *Next*. Le rôle DNS sera attribué plus tard dans la procédure.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_26.PNG)

11. Sur la fenêtre *WINS Servers*, cliquez sur *Next*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_27.PNG)

12. Séelctionnez *Yes, I want ton activate this scope now* puis cliquez sur *Next*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_28.PNG)

13. Cliquez sur *Finish*.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_29.PNG)

14. Reproduisez la même procédure pour configurer toutes les étendues nécessaires à votre Infrastructure Réseau.

![DHCP](./ressource/S09/images/maximus/Maximus_DHCP_30.PNG)

### Installation et configuration du rôle DNS

#### Installation du rôle DNS sur Windows Server en GUI

1. Dans le *Server Manager*, cliquez sur *Manage* > *Add Roles and Features*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_01.PNG)

2. Dans l'onglet *Before you begin* > *Next*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_02.PNG)

3. Dans l'onglet *Installation type* > *Role-based of feature-based installation* > *Next*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_03.PNG)

4. Dans l'onglet *Server Selection* > *Next*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_04.PNG)

5. Dans l'onglet *Server Roles*, cochez *DNS Server* puis *Next*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_05.PNG)

6. Cliquez sur *Add Features*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_06.PNG)

7. Puis *Next*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_07.PNG)

8. Dans l'onglet *Features* > *Next*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_08.PNG)

9. Dans l'onglet *DNS Server* > *Next*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_09.PNG)

10. Enfin, dans l'onglet *Confirmation* > **_Install_**.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_10.PNG)

11. A la fin de l'installation > *Close*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_11.PNG)

Votre Rôle *_DNS_* est désormais fonctionnel.

#### Configuration du rôle DNS sur Windows Server en GUI

1. Dans le *Server Manager*, cliquez sur *Tools* puis **_DNS_**.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_12.PNG)

2. Déroulez le menu du serveur jusqu'à voir _Forward Lookup Zones_.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_13.PNG)

3. Faites *Clic-droit* sur _Forward Lookup Zones_ > *New Zone*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_14.PNG)

4. Cliquez sur *Next*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_15.PNG)

5. Sélectionnez *Primary Zone*, puis *Next*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_16.PNG)

6. Remplissez le champ *Zone Name*, dans notre cas ce sera **_ecotechsolutions.fr_**, puis *Next*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_17.PNG)

7. Sélectionnez *Create a new file with this file name*, le champ est automatiquement rempli grâce à ce que vous avez saisi précédemment, puis *Next*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_18.PNG)

8. Sélectionnez *Do not allow dynamic updates*, puis *Next*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_19.PNG)

9. Cliquez sur *Finish*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_20.PNG)

10. Ouvrez l’arborescence du serveur jusqu'à voir "**_ecotechsolutions.fr_**". Faites *clic-droit* et sélectionnez *New Host (A or AAAA)*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_21.PNG)

11. Remplissez le champ *IP adress* avec l'adresse IP du serveur (dans notre cas : 10.10.8.100), cochez *Create associated pointer (PTR) record*, puis *Add Host*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_22.PNG)

![DNS](./ressource/S09/images/maximus/Maximus_DNS_23.PNG)

12. Ouvrez l’arborescence du serveur jusqu'à voir "*Reverse Lookup Zones*. Faites *clic-droit* et sélectionnez *New Zone*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_24.PNG)

13. Cliquez sur *Next*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_25.PNG)

14. Sélectionnez *Primary Zone* puis *Next*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_26.PNG)

15. Sélectionnez *IPv4 Reverse Lookup Zone* > *Next*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_27.PNG)

16. Remplissez le champ *Network ID*, saisissez les 3 premiers octets de l'adresse IP en inversé (Dans notre cas : 8.10.10), puis *Next*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_28.PNG)

17. Sélectionnez *Create a new file with this file name*, le champ est automatiquement remplli avec ce que vous avez saisi précédemment, puis *Next*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_29.PNG)

18. Sélectionnez *Do not allow dynamic updates* puis *Next*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_30.PNG)

19. Cliquez sur *Finish*.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_31.PNG)

Votre rôle _DNS_ est désormais configuré.

![DNS](./ressource/S09/images/maximus/Maximus_DNS_32.PNG)

#### Installation du rôle AD-DS sur Windows Server en GUI

1. Dans le *Server Manager*, cliquez sur *Manage* > *Add Roles and Features*.

![AD](./ressource/S09/images/maximus/Maximus_AD_01.PNG)

2. Dans l'onglet *Before you begin* > *Next*.

![AD](./ressource/S09/images/maximus/Maximus_AD_02.PNG)

3. Dans l'onglet *Installation type* > *Role-based of feature-based installation* > *Next*.

![AD](./ressource/S09/images/maximus/Maximus_AD_03.PNG)

4. Dans l'onglet *Server Selection* > *Next*.

![AD](./ressource/S09/images/maximus/Maximus_AD_04.PNG)

5. Dans l'onglet *Server Roles*, cochez *Active Directory Domain Services*, puis *Next*.

![AD](./ressource/S09/images/maximus/Maximus_AD_05.PNG)

6. Cliquez sur *Add Features*.

![AD](./ressource/S09/images/maximus/Maximus_AD_06.PNG)

7. Cliquez sur *Next*.

![AD](./ressource/S09/images/maximus/Maximus_AD_07.PNG)

8. Dans l'onglet *Feature* > *Next*.

![AD](./ressource/S09/images/maximus/Maximus_AD_08.PNG)
 
9. Dans l'onglet *AD DS* > *Next*.

![AD](./ressource/S09/images/maximus/Maximus_AD_09.PNG)

10. Dans l'onglet *Confirmation* > **_Install_**.

![AD](./ressource/S09/images/maximus/Maximus_AD_10.PNG)

11. A la fin de l'installation, cliquez sur *Close*.

![AD](./ressource/S09/images/maximus/Maximus_AD_11.PNG)

12. De retour sur le *Server Manager*, cliquez sur le triangle jaune, puis *Promote this server to a domain controller*.

![AD](./ressource/S09/images/maximus/Maximus_AD_12.PNG)

13. Sélectionnez * Add a new forest*. Remplissez le champ *Root domain name* (Dans notre cas, ce sera **_ecotechsoltutions.fr_**), puis *Next*.

![AD](./ressource/S09/images/maximus/Maximus_AD_13.PNG)

14. Remplissez les champs *Password* et *Confirm password* puis *Next*.

![AD](./ressource/S09/images/maximus/Maximus_AD_14.PNG)

15. Cliquez sur *Next*.

![AD](./ressource/S09/images/maximus/Maximus_AD_15.PNG)

16. Dans l'onglet *Additional Options*, le champ *The NetBIOS doamin name* est rempli automatiquement, cliquez sur *Next*.

![AD](./ressource/S09/images/maximus/Maximus_AD_16.PNG)

17. Cliquez sur *Next*.

![AD](./ressource/S09/images/maximus/Maximus_AD_17.PNG)

18. Cliquez sur *Next*.

![AD](./ressource/S09/images/maximus/Maximus_AD_18.PNG)

19. Dans l'onglet *Prerequisites Check*, cliquez sur **_Install_**.

![AD](./ressource/S09/images/maximus/Maximus_AD_19.PNG)

20. A la fin de l'installation, le serveur demandera à redémarrer pour prendre en compte les modifications. Cliquez sur *Close*.

![AD](./ressource/S09/images/maximus/Maximus_AD_20.PNG)

Votre Rôle _AD-DS_ est désormais fonctionnel.