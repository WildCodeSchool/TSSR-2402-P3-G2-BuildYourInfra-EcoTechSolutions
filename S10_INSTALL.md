# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## **Sommaire**

1) Pré-requis techniques

2) Installation et Configuration des équipements et ressources

3) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## **1. Pré-requis techniques**

## **2. Installation et Configuration des équipements et ressources**

### Configuration du rôle AD-DS sur Windows Serveur en GUI

Pour rappel notre serveur `ECO-Maximus` avec l'IP `10.10.8.100/16`. Ce serveur possède les rôles _DHCP_, _DNS_ et _AD-DS_.

Dans le *Server Manager*, cliquez sur *Tools* puis *Active directory Users and Computers*.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_01.PNG)

#### Les Unités Organisationelles

1. Déroulez le menu **_ecotechsolutions.fr_**. Faites *clic-droit*, puis *New*, puis *Organizational Unit*.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_02.PNG)

2. Remplissez le champ *Name* (Dans notre cas, le premier OU sera *EcoT_France*), puis *OK*.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_03.PNG)

3. Recommencez ces étapes pour créer toutes vos **_OU_** dans AD-DS.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_04.PNG)

#### Les Groupes

1. Déroulez le menu jusqu'à l'**_OU_** *EcoT_Secure*. Faites *clic-droit*, puis *New*, puis *Group*.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_05.PNG)

2. Remplissez le champ *Group name* (Dans notre cas, le premier OU sera *GRP_EcoT_Servers*), puis *OK*.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_06.PNG)

3. Recommencez ces étapes pour créer tous vos **_Groups_** dans AD-DS.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_07.PNG)

#### Les Ordinateurs

1. Déroulez le menu jusqu'à l'**_OU_** *EcoT_Computers*. Faites *clic-droit*, puis *New*, puis *Computer*.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_08.PNG)

2. Remplissez le champ *Computer name* (Dans notre cas, ce sera *ECO-LP-01*), puis *OK*.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_09.PNG)

3. Recommencez ces étapes pour créer tous les **_Computers_** dans AD-DS.

Vous pourrez par la suite déplacer les *Computers* dans leurs _OU_ respectives et/ou les attribuer à un _Groupe_.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_10.PNG)

#### Les Utilisateurs

1. Déroulez le menu jusqu'à l'**_OU_** *EcoT_Users*. Faites *clic-droit*, puis *New*, puis *Computer*.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_11.PNG)

2. Remplissez les champ *First name, *Latest name* et *User logon name* (Dans notre cas, ce sera *Aaron*, *Roche* et *ANRE0*), puis *Next*.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_12.PNG)

3. Remplissez les champs *Password* et *Confirm password* pour attribuer à l'utilisateur un mot de passe, l'option *User must change password at next logon* incitera l'utilisateur à changer son mot de passe à sa prochaine connexion. Puis cliquez sur *Next*.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_13.PNG)

4. Cliquez sur *Finish*.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_14.PNG)

5. Recommencez ces étapes pour créer tous les **_Users_** dans AD-DS.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_15.PNG)

Vous pourrez par la suite déplacer les *Users* dans leurs _OU_ respectives et/ou les attribuer à un _Groupe_.

### Installation et Configuration du rôle AD-DS sur le second Serveur

Pour rappel notre serveur `ECO-Moldaver` avec l'IP `10.10.8.120/16` sera en version Core (non-graphique) et aura uniquement le rôle _AD-DS_. Il servira à la réplication des données AD-DS, afin d'avoir une redondance sur le réseau.

![ADDS](./ressource/S10/images/moldaver/Config_IP.PNG)

![ADDS](./ressource/S10/images/moldaver/Config_Host.PNG)

#### Installation du rôle AD-DS sur Windows Server en Core

Nous allons commencer par installer l'Outil graphique d'installation avec la commande `Add-WindowsFeature -Name "RSAT-AD-Tools" -IncludeManagementTools -IncludeAllSubFeature`.

![ADDS](./ressource/S10/images/moldaver/Moldaver_ADS_01.PNG)

Nous allons ensuite installer le service de domaine AD avec la commande `Add-WindowsFeature -Name "AD-Domain-Services" -IncludeManagementTools -IncludeAllSubFeature`.

![ADDS](./ressource/S10/images/moldaver/Moldaver_ADS_02.PNG)

Nous retournons ensuite au Menu de configuration avec la commande `SConfig`.

Nous allons dans un premier temps intégrer le Serveur au Domaine avec l'option `1`.

![ADDS](./ressource/S10/images/moldaver/Moldaver_ADS_03.PNG)

Remplissez les champs comme suit :
* Sélectionnez Domain avec `D`
* Nom du Domaine : `ecotechsolutions.fr`
* Utisateur : `ecotechsolutions.fr/Administrator`
* Mot de Passe : `Azerty1*`

![ADDS](./ressource/S10/images/moldaver/Moldaver_ADS_04.PNG)

Une fois ces éléments validés, le serveur va se connecter au Domaine.
Il vous sera demandé dans un premier temps si vous souhaitez appliquer ces changements avant redémarrage : `N`.
Après cela, il vous sera demander de redémarrer le Serveur en appuyant sur `Y` pour confirmer.

#### Configuration du rôle AD-DS sur Windows Server pour la Réplication

Rendez vous sur le Serveur Principal `ECO-Maximus` dans le `Server Manager` puis `Manage` puis `Add Servers`

![ADDS](./ressource/S10/images/moldaver/Moldaver_ADS_05.PNG)

Sur la fenêtre `Add Servers`, cliquez sur `Find Now`, puis sélectionnez le Serveur `ECO-Moldaver` qui correspond au Serveur Core que vous venez de paramètrer.

![ADDS](./ressource/S10/images/moldaver/Moldaver_ADS_06.PNG)

Cliquez ensuite sur la flèche située au mileur de la fenêtre pour ajouter le Serveur à la liste, puis `OK`.

![ADDS](./ressource/S10/images/moldaver/Moldaver_ADS_07.PNG)

De retour sur le `Server Manager` dans `All Servers`, vous pouvez constater la présence du second Serveur `ECO-Moldaver`.

![ADDS](./ressource/S10/images/moldaver/Moldaver_ADS_08.PNG)

Vous pourrez constater au niveau du drapeau qu'une opération requiert votre attention, cliquez dessus puis `Promote this server to a domain controller`.

![ADDS]()

Sélectionnez `Add a domain controller to an existing domain` puis `Change`.

Saisissez les informations d'Administration : `Administrator` et `Azerty1*` puis `OK`.

![ADDS]()

Dans l'onglet `Domain Controller Options`, renseignez les champs `Password` et `Confirm password` puis `Next`.

![ADDS]()

Dans l'onglet `Additional Options`, sélectionnes `ECO-Maximus` à la ligne `Replicate from` puis `Next`.

![ADDS]()

Dans l'onglet `Installation`, cliquez sur `Install`.

![ADDS]()

A la fin du processus d'installation, cliquez sur `Close`.

Afin de s'assurer du principe de Réplication, ouvrez le Terminal de commande avec `cmd` dans la barre de recherche Windows.

Lancez la commande `repadmin /replsummary`

![ADDS](./ressource/S10/images/moldaver/Moldaver_ADS_14.PNG)

Le principe de Réplication entre les Serveurs `ECO-Maximus` et `ECO-Moldaver` est bien activé.

## **3. FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration**

`Suite à une mauvaise manipulation, je n'ai pas créer l'**_OU_** au bon endroit, et j'ai un message d'erreur *Access denied* ou *Insufficient privileges* lorsque je souhaite la déplacer ou la supprimer.`

1. Dans le Menu de *Active Directory Users and Computers*, cliquez sur *View* puis *Advanced Features*.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_16.PNG)

2. Faites *clic-droit* sur l'_OU_ à modifier, puis *Properties*.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_17.PNG)

3. Dans l'onglet *Object*, décochez *Protect object from accidental deletion*, puis *Apply* puis *OK*.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_18.PNG)

4. Déplacez ou supprimez votre _OU_ suivant vos besoins, dans le cas où vous la déplacez, pensez à recocher l'option précédemment décoché, puis *Apply* puis *OK*. Ceci permet de vous prémunir contre la suppression involontaire de l'OU.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_19.PNG)

5. Vous pouvez laissez *Advanced Features* activé, pour bénéficier de toutes les fonctionnalités.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_20.PNG)
