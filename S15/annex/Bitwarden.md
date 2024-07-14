# Sécurité

## Mise en place d'un Serveur de Gestion des mots de passe **_Bitwarden_**

## Sommaire

1. Pré-requis techniques

2. Installation et Configuration

    a. Création du CT dans Proxmox  
    b. Installation de **Docker** et **Bitwarden**  
    c. Création d'un compte utilisateur **Bitwarden**, Connexion et Utilisation

3. FAQ : Solutions aux problèmes connus et communs liés à l'utilisation

## 1. Pré-requis techniques

**_Bitwarden_** est un outil OpenSource de Gestion des mots de passes

Spécifications du système (recommandés sur le site officiel Bitwarden)

||Le minimum|Recommandé|
|:-:|:-:|:-:|
|Processeur|x64, 1,4 GHz|x64, double cœur 2 GHz|
|Mémoire|2 Go de RAM|4 Go de RAM|
|Stockage|12 Go|25 Go|
|Version Docker|Moteur 19+ et composition 1.24+|Moteur 19+ et composition 1.24+|

Nous l'ajouterons sur un Container via *Docker**.

Nom du CT : **_Katjabit_**
* IP : 10.10.8.117/16
* Passerelle : 10.10.255.254
* Base OS : Debian 12.2.1
* Installation de Docker requise
* Installation de Bitwarden requise

## 2. Installation et configuration

### 2. a. Création du CT dans Proxmox

1. A partit du noeud, cliquez sur `Create CT`.

2. Onglet `General`, remplissez les champs comme suit puis `Next` :
    * `CT ID` : 569 (L'ID est unique)
    * `Hostname` : KatjaBit
    * `Ressource Pool` : TSSR-2402-G2
    * `Password` : Azerty1*
    * `Confirm password` : Azerty1*

![CT](/S15/ressource/bitwarden/CT_02.PNG)

3. Onglet `Template`, remplissez les champs comme suit puis `Next` :
    * `Storage` : local-templates
    * `Template` : debian-12-standard_12-2-1_amd6

![CT](/S15/ressource/bitwarden/CT_03.PNG)

4. Onglet `Disks`, remplissez les champs comme suit puis `Next` :
    * `Storage` : ceph-datas
    * `Disk size` : 25

![CT](/S15/ressource/bitwarden/CT_04.PNG)

5. Onglet `CPU`, remplissez les champs comme suit puis `Next` :
    * `Cores` : 4

![CT](/S15/ressource/bitwarden/CT_05.PNG)

6. Onglet `Memory`, remplissez les champs comme suist cliquez sur `Next` :
    * `Memory` : 4096
    * `Swap` : 512

![CT](/S15/ressource/bitwarden/CT_06.PNG)

7. Onglet `Network`, remplissez les champs comme suit puis `Next` :
    * `Bridge` : vmbr6
    * `IPv4/CIDR` : 10.10.8.117/16
    * `Gateway` : 10.10.255.254
    * Désactivez le `Firewall`

![CT](/S15/ressource/bitwarden/CT_07.PNG)

8. Onglet `DNS`, remplissez les champs comme suit puis `Next` :
    * `DNS Domain` : ecotechsolutions.fr
    * `DNS servers` : 10.10.8.100

![CT](/S15/ressource/bitwarden/CT_08.PNG)

9. Onglet `Confirm`, vérifiez les informations saisies puis cliquez sur `Finish` :

![CT](/S15/ressource/bitwarden/CT_09.PNG)

10. Atendez que la configuration du CT s'effectue, une fois le message `Task OK` affiché, vous pouvez fermer la fenêtre.

![CT](/S15/ressource/bitwarden/CT_10.PNG)

### 2. b. Installation de **Docker** et **Bitwarden**

1. Commencez par effectuer une mise à jour avec la commande `apt update && apt upgrade -y`.

2. Installez le paquet nécessaire avec la commande `apt install docker.io curl`.

3. Téléchargez le plugin docker-compose avec la commande
```
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.27.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
```

4. Appliquez les permissions des binaires avec `chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose`.

5. Vérifiez la version de Docker avec la commande `docker --version` et la version de docker-compose avec `docker compose version`.

6. Affichez les containers avec `docker  ps -a` et vérifiez l'état des containers avec la commande `docker ps` (pour le moment, aucun container n'est appliqué)

Les étapes suivantes servent à l'installation de Bitwarden

7. Créez un utilisateur Bitwarden avec `adduser bitwarden`.

8. Définissez le mot de passe de l'utilisateur Bitwarden (mot de passe fort) avec `passwd bitwarden`.

9. Créez le groupe Docker (si il n'existe pas) avec `groupadd docker`.

10. Ajoutez l'utilisateur Bitwarden dans le groupe Docker avec `usermod -aG docker bitwarden`.

11. Créez un répertoire Bitwarden avec `mkdir /opt/bitwarden`.

12. Définissez les autorisations pour le répertoire avec `chmod -R 700 /opt/bitwarden`.

13. Définissez l'utilisateur Bitwarden comme propriétaire du répertoire avec `chown -R bitwarden:bitwarden /opt/bitwarden`.

14. Connectez-vous en tant qu'utilisateur Bitwarden avec `su -l bitwarden`.

15. Rendez-vous dans le répertoire créé plus haut avec `cd /opt/bitwarden`.

16. Saisissez ensuite la commande suivante pour téléchargez le script d'installation Bitwarden  
`curl -Lso bitwarden.sh "https://func.bitwarden.com/api/dl/?app=self-host&platform=linux" && chmod 700 bitwarden.sh`.

17. Exécutez le script avec la commande `./bitwarden.sh install`.

![Bitwarden](/S15/ressource/bitwarden/Bitwarden_02.PNG)

18. Remplissez les informations comme suit :
    * `Continue` : y
    * `Domain Name for your bitwarden instance` : katjabit.ecotechsolutions.fr
    * `Let's Encrypt to generate a free SSL certificate` : n
    * `database name` : vault
    * `installation id` : 2b62abb2-fb8a-4766-8a5e-b194009f664d
    * `key installation` : J8NLUodPDgcXmn0IoLye
    * `region` : EU
    * `SSL certificate` : n
    * `generate sel-signed SSL certificate` : y
```
NB. Afin d'obtenir un ID d'installation et une clé d'installation, vous devrez au préalable avoir créer un compte sur https://vault.bitwarden.com/#/register?layout=default
Vous pourrez ensuite récupérer ces informations sur https://bitwarden.com/host/
```
![Bitwarden](/S15/ressource/bitwarden/Bitwarden_03.PNG)

19. Démarrez bitwarden avec la commande `./bitwarden.sh start`. Validez le démarrage en saisissant `y`. Le démarrage peut nécessiter un peu de temps.

20. Une fois le démarrage terminé, vous pouvez vérifier l'état du container avec la commande `docker ps`.

![Bitwarden](/S15/ressource/bitwarden/Bitwarden_04.PNG)

21. Modifiez le fichier situé dans `/opt/bitwarden/bwdata/env/global.override.env` (pensez à faire une copie du fichier avant modification).

Avant

![Bitwarden](/S15/ressource/bitwarden/Bitwarden_05.PNG)

Après

![Bitwarden](/S15/ressource/bitwarden/Bitwarden_06.PNG)

22. Après avoir éditer le fichier, exécutez la commande `./bitwarden restart` pour appliquer les modifications.

23. Vous pouvez désormais vous rendre sur l'interface web [katjabit.ecotechsolutions.fr](https://katjabit.ecotechsolutions.fr/).

![Bitwarden](/S15/ressource/bitwarden/Bitwarden_09.PNG)

### 2. c. Création d'un compte utilisateur **Bitwarden**, Connexion et Utilisation

1. Afin de pouvoir vous connecter, vous devez tout d'abord créer un compte, cliquez en bas de la fenêtre sur `Créer un compte`.

![Bitwarden](/S15/ressource/bitwarden/Bitwarden_09.PNG)

2. Remplissez tous les champs et confirmez en cliquant sur `Créez un compte`.

![Bitwarden](/S15/ressource/bitwarden/Bitwarden_10.PNG)

3. Le mot de passe requis est de minimum 12 caractères, un test est effectué pour déterminer la dureté de votre mot de passe, si il est trop faible, vous aurez une notification, cliquez sur `Oui` pour continuer.

![Bitwarden](/S15/ressource/bitwarden/Bitwarden_11.PNG)

4. De retour sur la page de connexion, saisissez votre adresse mail et cliquez sur `Continuer`. Vous pouvez si vous le souhaitez cocher la case `Se souvenir de ce courriel`.

![Bitwarden](/S15/ressource/bitwarden/Bitwarden_12.PNG)

5. Saisissez votre Mot de passe principal et cliquez sur `Se connecter avec le mot de passe principal`.

![Bitwarden](/S15/ressource/bitwarden/Bitwarden_13.PNG)

6. Vous êtes à présent connecter à Bitwarden et pouvez commencer à ajouter des éléments dans votre coffre.

![Bitwarden](/S15/ressource/bitwarden/Bitwarden_14.PNG)

7. Si besoin, vous pouvez faciliter l'enregistrement des éléments durant vos sessions sur le navigateur. Pour cela, cliquez sur `Installer l'extension du navigateur`.

8. Pour ajouter un élément, cliquez sur `Nouveau` puis `Element`.

![Bitwarden](/S15/ressource/bitwarden/Bitwarden_15.PNG)

9. Remplissez les champs nécessaires et cliquez sur `Enregistrer`.

![Bitwarden](/S15/ressource/bitwarden/Bitwarden_16.PNG)

10. Vous pouvez organiser vos élement dans Bitwarden dans une arboresence de dossier. Pour ajouter un dossier, cliquez sur `Nouveau` puis `Dossier`. Nommez le dossier puis `Enregistrer`.

![Bitwarden](/S15/ressource/bitwarden/Bitwarden_18.PNG)

10. Bitwarden inclus un générateur de mot de passe/identifiant, vous pouvez y accéder via le panneau de gauche `Outils` puis `Générateur`. Choisissez vos options (longueur, type de carctère, etc), votre mot de passe est généré automatiquement, vous pourrez le coper dans le presse-papier en cliquant sur `Copier le mot de passe`.

![Bitwarden](/S15/ressource/bitwarden/Bitwarden_17.PNG)

11. Dans `Paramètres` (panneau de gauche), vous pourrez accéder à plusieurs options pour configurer votre compte, notamment vos données utililsateurs (nom, email, mot de passe principal)

![Bitwarden](/S15/ressource/bitwarden/Bitwarden_19.PNG)

### 2. d. Interface Administrateur de **Bitwarden**

1. Pour acccéder à l'interface Administrateur, rendez-vous sur l'url [https://katjabit.ecotechsolutions.fr/admin](ttps://katjabit.ecotechsolutions.fr/admin)

2. Saisissez l'email de l'Administrateur et cliquez sur `Continue`, un email va vous être envoyer afin de pouvoir vous connecter.

![Admin](/S15/ressource/bitwarden/Admin_01.PNG)

## **3. FAQ : Solutions aux problèmes connus et communs liés à l'utilisation**

```
Lorsque je veux accéder au Gestionnaire de mot de passe via l'url, j'ai un message d'erreur `Votre connexion n'est pas privée`.
```
![Bitwarden](/S15/ressource/bitwarden/Bitwarden_07.PNG)

1. Cliquez sur `Avancé`.

![Bitwarden](/S15/ressource/bitwarden/Bitwarden_08.PNG)

2. Cliquez sur `Continuer vers katjabit.ecotechsolutions.fr (non sécurisé)`.