# ADDS sur Windows Server 2022 en GUI

## Sommaire

1) Configuration du rôle ADDS

2) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## Configuration du rôle ADDS sur Windows Server en GUI

Dans le *Server Manager*, cliquez sur *Tools* puis *Active directory Users and Computers*.

![ADDS](/S10/ressource/maximus/Maximus_ADS_01.PNG)

### Les Unités Organisationelles

1. Déroulez le menu **_ecotechsolutions.fr_**. Faites *clic-droit*, puis *New*, puis *Organizational Unit*.

![ADDS](/S10/ressource/maximus/Maximus_ADS_02.PNG)

2. Remplissez le champ *Name* (Dans notre cas, le premier OU sera *EcoT_France*), puis *OK*.

![ADDS](/S10/ressource/maximus/Maximus_ADS_03.PNG)

3. Recommencez ces étapes pour créer toutes vos **_OU_** dans AD-DS.

![ADDS](/S10/ressource/maximus/Maximus_ADS_04.PNG)

### Les Groupes

1. Déroulez le menu jusqu'à l'**_OU_** *EcoT_Secure*. Faites *clic-droit*, puis *New*, puis *Group*.

![ADDS](/S10/ressource/maximus/Maximus_ADS_05.PNG)

2. Remplissez le champ *Group name* (Dans notre cas, le premier OU sera *GRP_EcoT_Servers*), puis *OK*.

![ADDS](/S10/ressource/maximus/Maximus_ADS_06.PNG)

3. Recommencez ces étapes pour créer tous vos **_Groups_** dans AD-DS.

![ADDS](/S10/ressource/maximus/Maximus_ADS_07.PNG)

### Les Ordinateurs

1. Déroulez le menu jusqu'à l'**_OU_** *EcoT_Computers*. Faites *clic-droit*, puis *New*, puis *Computer*.

![ADDS](/S10/ressource/maximus/Maximus_ADS_08.PNG)

2. Remplissez le champ *Computer name* (Dans notre cas, ce sera *ECO-LP-01*), puis *OK*.

![ADDS](/S10/ressource/maximus/Maximus_ADS_09.PNG)

3. Recommencez ces étapes pour créer tous les **_Computers_** dans AD-DS. Vous pourrez par la suite déplacer les *Computers* dans leurs _OU_ respectives et/ou les attribuer à un _Groupe_.

![ADDS](/S10/ressource/maximus/Maximus_ADS_10.PNG)

### Les Utilisateurs

1. Déroulez le menu jusqu'à l'**_OU_** *EcoT_Users*. Faites *clic-droit*, puis *New*, puis *Computer*.

![ADDS](/S10/ressource/maximus/Maximus_ADS_11.PNG)

2. Remplissez les champ *First name, *Latest name* et *User logon name* (Dans notre cas, ce sera *Aaron*, *Roche* et *ANRE0*), puis *Next*.

![ADDS](/S10/ressource/maximus/Maximus_ADS_12.PNG)

3. Remplissez les champs *Password* et *Confirm password* pour attribuer à l'utilisateur un mot de passe, l'option *User must change password at next logon* incitera l'utilisateur à changer son mot de passe à sa prochaine connexion. Puis cliquez sur *Next*.

![ADDS](/S10/ressource/maximus/Maximus_ADS_13.PNG)

4. Cliquez sur *Finish*.

![ADDS](/S10/ressource/maximus/Maximus_ADS_14.PNG)

5. Recommencez ces étapes pour créer tous les **_Users_** dans AD-DS.

![ADDS](/S10/ressource/maximus/Maximus_ADS_15.PNG)

Vous pourrez par la suite déplacer les *Users* dans leurs _OU_ respectives et/ou les attribuer à un _Groupe_.

## FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

`Suite à une mauvaise manipulation, je n'ai pas créer l'**_OU_** au bon endroit, et j'ai un message d'erreur *Access denied* ou *Insufficient privileges* lorsque je souhaite la déplacer ou la supprimer.`

1. Dans le Menu de *Active Directory Users and Computers*, cliquez sur *View* puis *Advanced Features*.

![ADDS](/S10/ressource/maximus/Maximus_ADS_16.PNG)

2. Faites *clic-droit* sur l'_OU_ à modifier, puis *Properties*.

![ADDS](/S10/ressource/maximus/Maximus_ADS_17.PNG)

3. Dans l'onglet *Object*, décochez *Protect object from accidental deletion*, puis *Apply* puis *OK*.

![ADDS](/S10/ressource/maximus/Maximus_ADS_18.PNG)

4. Déplacez ou supprimez votre _OU_ suivant vos besoins, dans le cas où vous la déplacez, pensez à recocher l'option précédemment décoché, puis *Apply* puis *OK*. Ceci permet de vous prémunir contre la suppression involontaire de l'OU.

![ADDS](/S10/ressource/maximus/Maximus_ADS_19.PNG)

5. Vous pouvez laissez *Advanced Features* activé, pour bénéficier de toutes les fonctionnalités.

![ADDS](/S10/ressource/maximus/Maximus_ADS_20.PNG)