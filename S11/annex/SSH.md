# SSH sur Debian 12

## Sommaire

1) Installation du service SSH

2) Configuration du service SSH

3) Installation et Configuration de Putty sur les Clients Windows

## Installation du service SSH sur Debian 12

1) Assurez-vous que le système est à jour avec la commande `apt update && apt upgrade -y`.

2) Installez ensuite le service ssh via la commande `apt install openssh-server`.

![SSH](/S11/ressource/cooper/SSH_Install_01.PNG)

3) Lors de l'installation, confirmez par `O` pour continuer.

![SSH](/S11/ressource/cooper/SSH_Install_02.PNG)

4) Votre service SSH est installé, vérifiez qu'il est bien actif avec la commande `systemctl status ssh`.

![SSH](/S11/ressource/cooper/SSH_Install_03.PNG)

5) Générez ensuite une clé d'identification avec la comande `ssh-keygen -t rsa -b 4096`.

![SSH](/S11/ressource/cooper/SSH_Install_04.PNG)

Les deux clés générées sont disponibles dans le `/root/.ssh/`.

## Configuration du service SSH sur Debian 12

Pour accéder au fichier de configuration SSH, vous devez modifier le fichier situé dans `/etc/ssh/sshd_config`.

![SSH](/S11/ressource/cooper/SSH_Install_05.PNG)

1) Ajoutez les lignes ou modifiez les lignes existantes :

* `Port 2222` pour écouter sur le port _2222_ (par défaut c'est le port 22).
* `AddressFamily inet` pour prendre en compte uniquement l'_IPv4_.
* `ListenAddress 0.0.0.0` pour ne prendre en compte que l'_IPv4_ en écoute.
* `PubkeyAuthentication yes` pour autoriser la connexion SSH grâce à une clé.
* `PasswordAuthentication yes` pour autoriser la connexion SSH par mot de passe.
* `PermitRootLogin no` pour désactiver la connexion SSH en tant _root_.

![SSH](/S11/ressource/cooper/SSH_Install_06.PNG)

2) Assurez-vous que le fichier de configuration ne comporte pas d'erreur et redémarrez le service avec la commande `systemctl restart sshd`.

### Ajout du serveur SSH sur le Domaine AD

Cette méthode est spécifique pour l'ajout des serveurs sous Linux du type Debian sur le Domaine Active Directory.

1) Commencez par modifier le fichier situé dans `/etc/resolv.conf` en spécifiant la recherche du domain et l'IP du Serveur de Domaine.

![SSH](/S11/ressource/cooper/SSH_Install_07.PNG)

2) Editez ensuite le fichier situé dans `/etc/hostname` en incluant le nom de Domaine.

![SSH](/S11/ressource/cooper/SSH_Install_08.PNG)

3) Testez la résolution DNS avec un ping du Domaine `ping ecotechsolutions.fr`.

![SSH](/S11/ressource/cooper/SSH_Install_09.PNG)

4) Installez ensuite les paquets nécessaires à cet ajout avec la commande `apt-get install realmd sssd-tools sssd libnss-sss libpam-sss adcli samba-common`.

5) Une fois les paquets, vous pouvez ajouter le serveur au Domaine avec la commande `realm join ecotechsolutions.fr --user Administrator`.

6) Le mot de passe de l'Administrateur du Domaine vous sera alors demandé, saisissez-le et validez.

7) Dans le cas où une erreur ressort, vous pouvez procéder avec la commande `realm --install=/ join ecotechsolutions.fr --user Administrator`.

![SSH](/S11/ressource/cooper/SSH_Install_10.PNG)

Votre Serveur SSH est désormais sur le Domaine, vous pouvez le vérifier avec la commande `realm list`.

## Installation et Configuration de Putty sur les Clients Windows

### Installation de Putty

1) Commencez par installer [Putty](https://putty.org) sur votre Client.

![Putty](/S11/ressource/client/Client_Putty_01.PNG)

2) Téléchargez le fichier `putty-64bit-0.81-installer.msi` et lancez l'installation en cliquant sur  `Ouvrir un fichier`.

![Putty](/S11/ressource/client/Client_Putty_02.PNG)

3) L'assistant d'installation démarre, cliquez sur `Next`.

![Putty](/S11/ressource/client/Client_Putty_03.PNG)

4) Laissez le dossier d'installation par défaut et cliquez sur `Next`.

![Putty](/S11/ressource/client/Client_Putty_04.PNG)

5) Ajoutez l'option `Add shortcut to PuTTY on the Desktop` puis cliquez sur `Install`.

![Putty](/S11/ressource/client/Client_Putty_05.PNG)

Votre installation est terminée, cliquez sur `Finish`.

![Putty](/S11/ressource/client/Client_Putty_06.PNG)

### Configuration de Putty

1) Commencez par rechercher `PuTTYgen`, ce soft s'est installé en même temps que PuTTY.

![Putty](/S11/ressource/client/Client_Putty_07.PNG)

2) Une fois `PuTTYgen` lancé, sélectionnez votre type de clé (ici `RSA`), et mettez le nombre de bits à `4096` puis cliquez sur `Generate`.

![Putty](/S11/ressource/client/Client_Putty_08.PNG)

3) Il sera nécessaire de bouger votre souris afin de générer votre clé.

4) Une fois les clés publique et privée, enregistrez-les  en cliquant sur `save public key` `save private key`. Choisissez l'endoit où vous sauvegardez vos clés.

5) Il peut être nécessaire à cette étape de copier/coller la clé publique afficher tout en haut et l'insérer dans un fichier texte.

![Putty](/S11/ressource/client/Client_Putty_09.PNG)

6) Lancez PuTTY.

![Putty](/S11/ressource/client/Client_Putty_10.PNG)

7) Rendez-vous dans `Connection / SSH / Auth / Credential` et indiquez le lien vers votre clé privée.

![Putty](/S11/ressource/client/Client_Putty_11.PNG)

8) Indiquez le lien vers votre clé privée.

![Putty](/S11/ressource/client/Client_Putty_12.PNG)

9) Rendez-vous dans `Connection / Data` et saisissez le champ Auto-login username.

![Putty](/S11/ressource/client/Client_Putty_13.PNG)

10) Retournez au Menu `Session`, et saisissez l'IP du Serveur SSH, ainsi que le Port d'écoute de celui-ci. Donnez un nom dans le champ `Saved Sessions` et cliquez sur `Save`.

![Putty](/S11/ressource/client/Client_Putty_14.PNG)

Votre session est désormais enregistrée. Cliquez sur `Open`.

![Putty](/S11/ressource/client/Client_Putty_15.PNG)

La clé privée n'est pas encore connu du serveur, il vous ai demandé le mot de passe de connexion.

![Putty](/S11/ressource/client/Client_Putty_16.PNG)

Une fois saisi le mot de passe, vous êtes connecté en SSH avec le Serveur.

![Putty](/S11/ressource/client/Client_Putty_17.PNG)

Afin de pouvoir conserver une trace de votre clé généré dans le serveur, vous devrez vous rendre dans le `/home/wilder` avec la commande `cd /home/wilder`.

Il faut ensuite créer le dossier `.ssh` si celui-ci n'existe pas `mkdir .ssh`.

Rendez-vous dans le dossier `.ssh` avec `cd .ssh` et créez le fichier `authorized_keys` avec la commande `nano authorized_keys`, collez votre clé publique dans son intégralité dans ce fichier, puis `ctrl + o` pour sauvegarder et `ctrl +x` pour quitter.

Déconnectez vous, puis relancer la connexion via Putty, vous êtes à présent connecté via la clé générée.