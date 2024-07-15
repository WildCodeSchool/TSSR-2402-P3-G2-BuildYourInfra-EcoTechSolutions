# Partenariat d'entreprise

## VPN site-à-site

### Sommaire

1. Pré-requis techniques

2. Installation et Configurations des matériels nécessaires

### **1. Pré-requis techniques**

**_OpenVPN_** est un logiciel OpenSource qui consiste à simuler un réseau privé en se basant sur des réseaux réels quelconques et donc éventuellement publiques comme Internet.

On utilisera ainsi le principe du tunnel (passage sûr à travers un réseau) et l'encapsulation de protocoles afin d'obtenir une interconnexion de réseaux, les extrémités étant des passerelles. Ce qui correspond exactement à nos besoins dans le cadre du partenariat avec **BillU**.

### **2. Installation et Configurations des matériels nécessaires**

OpenVPN reposant sur une relation Client/Serveur. Nous allons utiliser openVPN via PFSense en configuration Serveur, celui de **BillU** sera en configuration Client.

Plusieurs étapes de configurations sont nécessaires au bon déroulement : 

* Création d'un Certificat d'Autorité
* Création d'un Certificat Serveur
* Création d'un Certificat Client
* Récupération du Certificat Client et du Certificat d'Autorité
* Création du Serveur OpenvVPN
* Récupération de la Clé TLS
* Ré-écriture spécifique du Client
* Activation de l'interface VPN
* Création de règles sur le Firewall
* Routage

### a. Création du Certificat d'Autorité

1. Dans PFSense, rendez-vous sur la page des Certificats : `System` > `Certificates`.

2. Onglet `Authorities` : cliquez sur `Add`.

3. Remplissez le champ `Descriptive Name` en utilisant un nom explicite : `OpenVPN_BillU_Auth`.

4. Cochez la case `Trust Store` > `Add this Certificate Authority to the Operating System Trust Store`.

5. Cliquez sur `Save`.

![FW](/S18/ressource/openvpn/FW_02.PNG)

### b. Création du Certificat Serveur

1. Onglet `Certificates` : cliquez sur `Add`.

2. Remplissez le champ `Descriptive Name` en utilisant un nom explicite : `OpenVPN_BillU_Certificat_SRV`.

3. Sélectionnez le Certificat d'Autorité créé précédement dans le champ `Certificate authority`.

4. Remplissez le champ `Common Name` en utilisant un nom explicite : `OpenVPN_BillU_Certificat_SRV`.

5. Sélectionnez `Server Certificate` dans le champ `Certificat Type`.

6. Cliquez sur `Save`.

![FW](/S18/ressource/openvpn/FW_06.PNG)

### c. Création du Certificat Client

1. Onglet `Certificates` : cliquez sur `Add`.

2. Remplissez le champ `Descriptive Name` en utilisant un nom explicite : `OpenVPN_BillU_Certificat_CLI`.

3. Sélectionnez le Certificat d'Autorité créé précédement dans le champ `Certificate authority`.

4. Remplissez le champ `Common Name` en utilisant un nom explicite : `OpenVPN_BillU_Certificat_CLI`.

5. Sélectionnez `User Certificate` dans le champ `Certificat Type`.

6. Cliquez sur `Save`.

![FW](/S18/ressource/openvpn/FW_09.PNG)

### d. Récupération du Certificat Client et du Certificat d'Autorité

1. Onglet `Certificates` : sur la ligne du Certificat Client précédement créé, cliquez sur `Export Certificate` (icône en forme de soleil) afin de télécharger le Certificat Client.

2. Cliquez sur `Export Key` (icône en forme de clé) afin de télécharger la Clé du Certificat Client.

![FW](/S18/ressource/openvpn/FW_10.PNG)

3. Onglet `Authorities` : sur la ligne du Certificat d'Autorité précédement créé, cliquez sur `Export CA` (icône en forme de soleil) afin de télécharger le Certificat d'Autorité.

![FW](/S18/ressource/openvpn/FW_11.PNG)

### e. Création du Serveur OpenVPN

1. Dans PFSense, rendez-vous sur la page de OpenVPN : `VPN` > `OpenVPN`.

2. Onglet `Servers` : cliquez sur `Add`.

3. Remplissez le champ `Description` en utilisant un nom exmplicite : `OpenVPN_BillU_SRV`.

4. Cochez la case `TLS Configuration` > `Use a TLS Key`.

5. Sélectionnez le Certificat d'Autorité précédement créé dans le champ `Peer Certificate Authority`.

6. Sélectionnez le Certificat Serveur précédement créé dans le champ `Server Certificate`.

7. Remplissez le champ `IPv4 Tunnel Network` : `10.0.8.0/30`.

8. Remplissez le champ `IPv4 Local Network(s)` avec les 2 réseaux LAN des entités : `10.10.0.0/16, 172.19.0.0/16`.

9. Remplissez le champ `IPv4 Remote Network(s)` avec le réseau LAN distant : `172.19.0.0/16`.

10. Remplissez le champ `Concurrent Connections` : `10`.

11. Sélectionnez `Ipv4 Only` dans le champ `Gateway creation`.

12. Cliquez sur `Save`

![FW](/S18/ressource/openvpn/FW_17.PNG)

### f. Récupération de la Clé TLS

1. Onglet `Servers` : cliquez sur `Edit Server` (icône en forme de crayon).

2. Sélectionnez tout le texte du champ `TLS Key`

3. Copiez le texte dans un nouveau fichier texte et enregistrez le fichier : `TLS_Key_OpenVPN.txt`.

![FW](/S18/ressource/openvpn/FW_18.PNG)

### g. Ré-écriture spécifique du Client

1. Onglet `Client Specific Overrides` : cliquez sur `Edit CSV Override` (icône en forme de crayon).

2. Remplissez le champ `Description` : `OpenVPN_BillU_Certificat_CLI` (si ce n'est pas déjà fait).

3. Remplissez le champ `Common Name` : `OpenVPN_BillU_Certificat_CLI`.

4. Sélectionnez `OpenVPN_BillU_SRV` dans le champ `Server List`.

5. Remplissez le champ `Ipv4 Tunnel Network` : `10.0.8.0/30` (si ce n'est pas déjà fait).

6. Remplissez le champ `Ipv4 Remote Network(s)` : `172.19.0.0/16` (si ce n'est pas déjà fait).

7. Cliquez sur `Save`.

![FW](/S18/ressource/openvpn/FW_21.PNG)

### h. Activation de l'interface VPN

1. Dans PFSense, rendez-vous sur la page d'affectation des interfaces: `Interfaces` > `Assignments`.

2. Sur la ligne `OPT2` : cliquez sur `Add`.

![FW](/S18/ressource/openvpn/FW_22.PNG)

3. Cliquez sur `Opt2`.

4. Cochez la case `Enable` > `Enable interface`.

5. Remplissez le champ `Description` : `OpenVPN_BillU`.

6. Cliquez sur `Save`.

![FW](/S18/ressource/openvpn/FW_29.PNG)

### i. Création de règles sur le Firewall

1. Dans PFSense, rendez-vous dans les règles du Firewall : `Firewall` > `Rules`.

2. Onglet `WAN` : cliquez sur `Add rule to the top of the list`.

3. Sélectionnez `UDP` dans le champ `Protocol`.

4. Vérifiez le champ `Source` : `Any`. 

5. Sélectionnez `WAN adress` dans le champ `Destination`?

6. Sélectionnez `OpenVPN (1194)` dans le champ `Destination Port Range`.

7. Cliquez sur `Save`.

![FW](/S18/ressource/openvpn/FW_25.PNG)

8. Onglet `OpenVPN_BillU` : cliquez sur `Add rule to the top of the list`.

9. Sélectionnez `Any` dans le champ `Protocol`.

10. Cliquez sur `Save`.

![FW](/S18/ressource/openvpn/FW_30.PNG)

### j. Routage

1. Dans PFSense, rendez-vous dans la configuration du routage : `System` > `Routing`.

2. Onglet `Static Routes` : cliquez sur `Add`.

3. Remplissez le champ `Description` : `172.19.0.0`.

4. Sélectionnez `OPENVPN_BILLU_VPNV4 -` dans le champ `Gateway`.

5. Remplissez le champ `Description` : `Root_OpenVPN_BillU`.

6. Cliquez sur `Save`.

![FW](/S18/ressource/openvpn/FW_31.PNG)

Il est impératif de transmettre les 4 fichiers à l'autre entité, choisissez la méthode la plus sécurisée pour les envoyer.
* TLS_Key_OpenVPN.txt
* OpenVPN_BillU_Auth.crt
* OpenVPN_BillU_Certificat_CLI.crt
* OpenVPN_BillU_Certificat_CLI.key

L'autre entité doit paramétré son VPN en configuration Client : [OpenVPN Confi Client BillU](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/S18/INSTALL.md#3---serveur-openvpn--openvpn-sur-pfsense)

Une fois toutes ces étapes achévées, le VPN est fonctionnel, vous pouvez avec un `ping` sur un matériel du réseau distant, testez également en allant consulter une interface web d'un des serveurs distants.