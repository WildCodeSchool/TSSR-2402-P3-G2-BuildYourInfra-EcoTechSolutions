# Partenariat d'entreprise

## VPN site-à-site

### Sommaire

1. Pré-requis techniques

2. Installation et Configurations des matériels nécessaires

3. FAQ : Solutions aux problèmes connus et communs liés à l'utilisation

### **1. Pré-requis techniques**

**_OpenVPN_** est un logiciel OpenSource qui consiste à simuler un réseau privé en se basant sur des réseaux réels quelconques et donc éventuellement publiques comme Internet.

On utilisera ainsi le principe du tunnel (passage sûr à travers un réseau) et l'encapsulation de protocoles afin d'obtenir une interconnexion de réseaux, les extrémités étant des passerelles. Ce qui correspond exactement à nos besoins dans le cadre du partenariat avec **BillU**.

Nom de la VM : **ECO-Cooper**
* IP : 10.11.0.3/16
* Passerelle : 10.11.0.1
* Emplacement dans l'infrastructure : DMZ
* Base OS : Debian 12
* Installation de OpenVPN requise via un script

### **2. Installation et Configurations des matériels nécessaires**

#### 2. a. Configuration du serveur avant Installation de OpenVPN

1. Modifiez le fichier `/etc/resolv.conf` en spécifiant la recherche du domaine et l'IP du Domain Controller (contrôleur de domaine).

![Cooper](/ressource/S16/cooper/Cooper_01.PNG)

2. Editez le fichier `/etc/hostname` en incluant le nom du Domaine.

![Cooper](/ressource/S16/cooper/Cooper_02.PNG)

3. Testez la résolutions DNS avec une ping du Domaine `ping ecotechsolutions.fr`.

![Cooper](/ressource/S16/cooper/Cooper_03.PNG)

4. Installez les paquets nécessaires à l'ajout au Domaine avec la commande `apt-get install realmd sssd-tools sssd libnss-sss libpam-sss adcli samba-common`.

5. Une fois les paquets, vous pouvez ajouter le serveur au Domaine avec la commande `realm join ecotechsolutions.fr --user Administrator`.

6. Le mot de passe de l'Administrateur du Domaine vous sera alors demandé, saisissez-le et validez.

7. Dans le cas où une erreur ressort, vous pouvez procéder avec la commande `realm --install=/ join ecotechsolutions.fr --user Administrator`.

Votre Serveur SSH est désormais sur le Domaine, vous pouvez le vérifier avec la commande `realm list`.

![Cooper](/ressource/S16/cooper/Cooper_04.PNG)

#### 2. b. Installation et Configuration de OpenVPN sur le Serveur

1. Commencez par le fameux `apt update && apt upgrade -y`.

2. Installez le paquet curl avec `apt install curl`.

3.2. Afin de faciliter l'installation, nous allons procéder via le [script](https://github.com/angristan/openvpn-install/blob/master/openvpn-install.sh) disponible sur le repo GitHub [OpenVPN](https://github.com/angristan/openvpn-install/tree/master). Commencez par télécharger le script d'installation avec la commande `curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh` et rendez-le exécutable avec `chmod +x openvpn-install.sh`.

4. Démarrez le script avec `./openvpn-install.sh`.

5. Durant l'installation, plusieurs questions vous seront posés afin de configurer le serveur :
    * a. IP du serveur : `10.11.0.3` (normalement il s'agit de votre IP publique, dans notre cas, nous sommes derrière le Firewall, donc nous renseignons l'IP réèlle).  
    * b. IP publique ou Hostname : `10.0.0.3` (Etant donné que nous sommes en NAT, nous renseignons l'IP de l'interface WAN du Firewall).  
    * c. Activation IPv6 : `n`.  
    * d. Port utilisé pour la connexion : `1` (nous utiliseraons dans notre cas le port par défaut de OpenVPN).  
    * e. Protocole utilisé : `1` (nous utiliserons UDP qui rend OpenVPN plus rapide).  
    * f. DNS resolvers : `1` (nous utiliserons ici les paramètres renseignés dans le fichier `/etc/resolv.conf`).
    * g. Utilisattion de la compression : `n`.
    * h. Chiffrement customisé : `n`.
    * i. Une fois la configuration terminé, un message vous demande d'appuyer sur une touche pour continuer.

![OpenVPN](/ressource/S16/cooper/OpenVPN_01.PNG)

![OpenVPN](/ressource/S16/cooper/OpenVPN_02.PNG)

6. Suite à la configuration, le script va vous assister afin de créer un premier client :
    * a. Nom du Client : `BillU_VPN`.
    * b. Utilisation de mot de passe pour le Client : `2` (la définition du mot de passe est nécessaire pour établir la connexion VPN).
    * c. Deux fichiers spécifiques au Client sont ainsi générés sur votre serveur dans le `/etc/openvpn/easy-rsa/pki` et un fichier à la racine de l'utilisateur ayant lancé le script d'installation.

![OpenVPN](/ressource/S16/cooper/OpenVPN_03.PNG)

7. Le serveur étant derrière le Firwall, vous devrez appliquer une règle afin que lorsqu'une connexion depuis l'extérieure sur le port `1194` est demandé sur l'interface WAN, elle soit redirigée vers votre serveur VPN.

![OpenVPN](/ressource/S16/cooper/OpenVPN_FW.PNG)

#### 2. c. Installation et configuration sur les Clients

1. Depuis notre Serveur principal ECO-Maximus IP `10.10.8.100`,rendez-vous sur le site communautaire de OpenVPN afin de télécharger la version cliente [OpenVPN GUI Download](https://openvpn.net/community-downloads/), sélectionnez la version la plus récente disponible et téléchargez le package `Windows 64-bit MSI installer`

![OpenVPN](/ressource/S16/cooper/OpenVPN_DLL.PNG)

2. Placez le fichier dans le dossier partagé préalablement conçu pour le déploiement de logiciel via GPO. Vous pouvez par la même occasion installer le package sur ECO-Maximus.

3. Appliquez la GPO pour le déploiement  
`Group Policy Managment` > `Create a GPO in this domain and Link it here...` (OU Ecot_Computers) > `Edit` > `Computer Configuration` > `Policies` > `Software Settings` > `Software Installation` > `New` > `Package`

![OpenVPN](/ressource/S16/cooper/OpenVPN_GPO_01.PNG)

4. Désactivez sur la GPO la Configuration Utilisateur  
`Edit` > `Properties` > `Disable User Configuration settings` > `Yes` > `Apply` > `OK`

![OpenVPN](/ressource/S16/cooper/OpenVPN_GPO_02.PNG)

5. La GPO est fonctionnelle, il vous faudra redémarrer les Clients pour que l'installation s'effectue.


