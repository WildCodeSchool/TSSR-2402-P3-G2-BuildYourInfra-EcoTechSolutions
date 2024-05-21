# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## **Sommaire**

1) Pré-requis techniques

2) Installation et Configuration des équipements et ressources

3) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## **1. Pré-requis techniques**

* Serveur _ECO-Cooper_ sous Debian 12 incluant le Service SSH
    IP fixe : `10.10.8.40/16`
    Domaine AD : ecotechsolutions.fr

* Serveur _ECO-Lucy_ sous Debian 12 incluant le Service GLPI
    IP fixe : `10.10.8.50/16`
    Domaine AD : ecotechsolutions.fr

## **2. Installation et Configuration des équipements et ressources**

### Installation et Configuration du Service SSH sur _ECO-Cooper_

#### Installation de SSH sur le Serveur

1) Assurez-vous que le système est à jour avec la commande `apt update && apt upgrade -y`

2) Installez ensuite le service ssh via la commande `apt install openssh-server`

![SSH](./ressource/S11/images/cooper/SSH_Install_01.PNG)

3) Lors de l'installation, confirmez par `O` pour continuer.

![SSH](./ressource/S11/images/cooper/SSH_Install_02.PNG)

4) Votre service SSH est installé, vérifiez qu'il est bien actif avec la commande `systemctl status ssh`.

![SSH](./ressource/S11/images/cooper/SSH_Install_03.PNG)

5) Générez ensuite une clé d'identification avec la comande `ssh-keygen -t rsa -b 4096`.

![SSH](./ressource/S11/images/cooper/SSH_Install_04.PNG)

Les deux clés générées sont disponibles dans le `/root/.ssh/`.

#### Configuration de SSH sur le Serveur

Pour accéder au fichier de configuration SSH, vous devez modifier le fichier situé dans `/etc/ssh/sshd_config`

![SSH](./ressource/S11/images/cooper/SSH_Install_05.PNG)

1) Ajoutez les lignes ou modifiez les lignes existantes :

* `Port 2222` pour écouter sur le port _2222_ (par défaut c'est le port 22).
* `AddressFamily inet` pour prendre en compte uniquement l'_IPv4_.
* `ListenAddress 0.0.0.0` pour ne prendre en compte que l'_IPv4_ en écoute.
* `PubkeyAuthentication yes` pour autoriser la connexion SSH grâce à une clé.
* `PasswordAuthentication yes` pour autoriser la connexion SSH par mot de passe.
* `AuthenticationMethods publickey,password` pour utiliser l'authentification multi-facteurs (clé et mot de passe).
* `PermitRootLogin no` pour désactiver la connexion SSH en tant _root_.

![SSH](./ressource/S11/images/cooper/SSH_Install_06.PNG)

2) Assurez-vous que le fichier de configuration ne comporte pas d'erreur avec la commande `systemctl restart ssh`

### Installation et Configuration de Putty sur le Client _ECO-LP-01_

#### Installation de Putty

#### Configuration de Putty



### Installation et Configuration du Service GLPI sur _ECO-Lucy_

#### Installation de GLPI

#### Configuration de GLPI

### Création GPO dans l'Active Directory


Pour créer un GPO, nous allons d'abord dans **`Server Manager`** --> **`All Servers`**, 
sélectionner le serveur où l'Active Directory est installé et aller dans **`Tools`** --> **`Group Policy Management`** 
comme dans l'image ci-dessous :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/ressource/S11/images/GPO/Serv%20Manag%20TOOLS.png)

Maintenant que la fenêtre **Group Policy Management** est ouverte, allons dans **`Group Policy Objects`** : 

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/ressource/S11/images/GPO/Group%20Policy%20Management%20interface.png)

clique droit puis **`New`** :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/ressource/S11/images/GPO/New%20GPO.png)

Donnons un nom à notre GPO :

Une fois validé, nous la voyons dans la liste. Clique droit dessus puis **`Edit`** :

Une fois à ce niveau, selon nos besoins, nous recherchons les règles, les restrictions, les accès ou les filtres à activer ou désactiver.



## **3. FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration**
