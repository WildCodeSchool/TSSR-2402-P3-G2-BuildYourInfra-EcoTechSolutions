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

Pour rappel notre serveur `ECO-Moldaver` avec l'IP `10.10.8.120/16`. Ce serveur sera en version Core (non-graphique) et aura uniquement le rôle _AD-DS_. Il servira à la réplication des données AD-DS, afin d'avoir une redondance sur le réseau.

#### Installation du rôle AD-DS sur Windows Server en Core

#### Configuration du rôle AD-DS sur Windows Server en Core

## **3. FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration**

```
Suite à une mauvaise manipulation, je n'ai pas créer l'**_OU_** au bon endroit, et j'ai un message d'erreur *Access denied* ou *Insufficient privileges* lorsque je souhaite la déplacer ou la supprimer.
```

1. Dans le Menu de *Active Directory Users and Computers*, cliquez sur *View* puis *Advanced Features*.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_16.PNG)

2. Faites *clic-droit* sur l'_OU_ à modifier, puis *Properties*.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_17.PNG)

3. Dans l'onglet *Object*, décochez *Protect object from accidental deletion*, puis *Apply* puis *OK*.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_18.PNG)

4. Déplacez ou supprimez votre _OU_ suivant vos besoins, dans le cas où vous la déplacez, pensez à recocher l'option précédemment décoché, puis *Apply* puis *OK*.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_19.PNG)

5. Vous pouvez laissez *Advanced Features* activé, pour bénéficier de toutes les fonctionnalités.

![ADDS](./ressource/S10/images/maximus/Maximus_ADS_20.PNG)
