# GPO dans ADDS

## Sommaire

1) Création de GPO dans ADDS

2) Inventaire des GPO appliqués dans ADDS

## Création de GPO dans ADDS

Pour créer un GPO, nous allons d'abord dans **`Server Manager`** --> **`All Servers`**, 
sélectionner le serveur où l'Active Directory est installé et aller dans **`Tools`** --> **`Group Policy Management`** 
comme dans l'image ci-dessous :

![GPO](/S11/ressource/GPO/Serv_Manag_TOOLS.png)

Maintenant que la fenêtre **Group Policy Management** est ouverte, allons dans **`Group Policy Objects`** : 

![GPO](/S11/ressource/GPO/Group_Policy_Management_interface.png)

clique droit puis **`New`** :

![GPO](/S11/ressource/GPO/New_GPO.png)

Donnons un nom à notre GPO en suivant la nomenclature :

![](/S11/ressource/GPO/New_Name_GPO.png)

Une fois le nom établit validons, nous la voyons dans la liste. Clique droit dessus puis **`Edit`** :

![](/S11/ressource/GPO/Edit_GPO.png)

Une fois à ce niveau, selon nos besoins, nous recherchons les règles, les restrictions, les accès ou les filtres à activer ou désactiver. Exemple :

![](/S11/ressource/GPO/Navig_Rule_for_GPO.png)

## Inventaire des GPO appliqués dans ADDS

### Mise en place de GPO de Sécurité

|Nom|Affectation|Description|
|:-:|:-:|:-:|
|GPO_EcoT_Client_Restriction_Periph_Usb|EcoT_Users(Sauf DSI)|Bloquer tous les périphériques de stockage USB|
|GPO_EcoT_Users_Deco_RDP_Apres_Inactiv|EcoT_Computers|Déconnecte le bureau a distance après 5min d'inactivité|
|GPO_EcoT_Computer_Ecran_veille_par_MDP|EcoT_Computers|Après 5 min d'inactivité l'écran se vérouille|
|GPO_EcoT_Computer_Firewall_autorisation_partage_fichiers_/16 |EcoT_Computers|Autoriser l'exception de partage de fichiers entrants et d'imprimantes provenant des adresses IP du sous-réseau 10.10.0.0/16|
|GPO_EcoT_Windows_Update_Planified|EcoT_Users|Lancement des mises à jour les samedi a 3:00 heures|
|GPO_EcoT_Users_Restriction_Install_Software|EcoT_Users(Sauf DSI)|Bloquer des programmes et empêcher l’installation de logiciels(Sauf administrateurs local)|
|GPO_EcoT_Users_Security_Controlpanel_Deny|EcoT_Users(Sauf DSI)|Restriction d'accès au panneau de configuration|
|GPO_EcoT_Computer_Desactiv_Wifi_si_Ethernet|EcoT_Users|Désactiver le WiFi lorsque le câble Ethernet est connecté|
|GPO_EcoT_Computer_Compte_invite_desact|EcoT_Computers|Désactivation du compte invité|
|GPO_EcoT_Computer_Verrouillage_apres_5_tentatives|EcoT_Computers|Verrouillage du comptes pendant 10 minutes après 5 tentatives de connexions ratées|
|GPO_EcoT_CompteDown|EcoT_Users|Désactiver les comptes qui sont dans l'OU CompteDown |

### Mise en place de GPO Standard

|Nom|Affectation|Description|
|:-:|:-:|:-:|
|GPO_EcoT_Computer_Modif_Fond_ecran_bloquer|EcoT_Computers|Empêcher la modification de l'arrière-plan du menu démarrer, ainsi que l'image de l'écran de verrouillage et d'ouverture de session|
|GPO_EcoT_Computer_Message_Bienvenue|EcoT_Computers| Message de bienvenu pour les utilisateurs essayant de se connecter|
|GPO_EcoT_Computer_Gestion_Alimentation_disk|EcoT_Computers|Arrêt du disque dur après des périodes d'inactivité|
|GPO_EcoT_Computer_définir_page_Accueil_internet|EcoT_Computers|Définir www.google.fr comme page d'accueil par defaut sur EDGE|
|GPO_EcoT_Computer_Gestion_Alim_Haute_perfo|EcoT_Users(Developpement)|Maximisation de la puissance de traitement|
|GPO_EcoT_Computer_Install_Firefox|EcoT_Computers|Installation de Firefox|
|GPO_EcoT_Computer_Install_Putty|EcoT_Computers|Installation de Putty|