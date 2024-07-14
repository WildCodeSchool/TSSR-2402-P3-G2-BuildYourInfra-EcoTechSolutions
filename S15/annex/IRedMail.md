# Mise en place d'un serveur de messagerie IRedMail

## Sommaire

1) Pré-requis

2) Installation

## Pré-requis

Nous avons choisi de déployer un conteneur sous Debian 12 pour pouvoir monter le serveur mail **IRedMail**
Voici son paramètrage :

 - Mémoire : 20Go
 - 1 coeur de processeur
 - Mémoire RAM : **2Go** (attention ici par défaut il est proposé 512Mo, il est recommandé de mettre un minimum de 1Go pur que l'installation des fonctionnalités du serveur se déroule bien)
 - SWAP : 512Mo
 - Réseau : configuration sur le LAN correspondant à notre réseau, on enlève le Firewall par défaut, on attribue l'adresse fixe 10.10.8.116/16 avec la passerelle correspondant à notre pare-feu (10.10.255.254)
 - DNS : nous renseignons ici notre domaine : ecotechsolutions.fr
  
Avant de démarrer notr econteneur fraichement crée, nous allons sur le DNS manager de notre serveur DNS (ici *Maximus*), *Forward Lookup Zones*, *ecotechsolutions.fr* pour :
 - Créer un **Host name A** mail : 10.10.8.116
 - Créer un **MX** : 10.10.8.116
  
Nous démarrons alors le conteneur puis :
 - ``apt-get update && apt-get upgrade -y``
 - Dans le fichier ``/etc/hosts`` nous modifions pour écrire ``127.0.0.1 mail.ecotechsolutions.fr``
 - Dans le fichier ``/etc/hostname`` nous plaçons le nom en FQDN (Full Qualified Domain Name) : ``mail.ecotechsolutions.fr``

## Installation

Nous pouvons alors procéder à l'installation de iRedMail. Voici les premiers pas :
  
 - Nous tapons la ligne de commande suivante : ``wget https://github.com/iredmail/iRedMail/archive/refs/tags/*.tar.gz`` où * correspond à la dernière version stable de **iRedMail**.
 - Nous extrayons avec la commande suivante : ``tar -xzf *.tar.gz``
 - On peut alors supprimer le fichier archive avec : ``rm *.tar.gz`` puis se rendre dans le dossier iRedMail-* : ``cd iRedMail-*``
 - Un fois placé dans ce dossier, nous exécutons le script : ``bash iRedMail.sh``
  
Nous voici alors en présence de l'assistant d'installation, aussi appelé *Wizard*. 

Pour commencer l'installation, validez avec **< YES >**.

![](/S15/ressource/iredmail/installmail5.jpg)

Pour le chemin par défaut, nous le laissons par défaut, continuez avec **< NEXT >**.

![](/S15/ressource/iredmail/installmail6.jpg)

Pour le serveur web, sélectionnez **Nginx** et continuez avec **< NEXT >**.

![](/S15/ressource/iredmail/installmail7.jpg)

Pour la base de donnée des mails, sélectionnez **OpenLDAP** et  continuez avec **< NEXT >**.

![](/S15/ressource/iredmail/installmail8.jpg)

Pour le suffixe LDAP, entrez le domaine comme suit, continuez avec **< NEXT >**.

![](/S15/ressource/iredmail/installmail1.jpg)

Saisissez le mot de passe Administrateur mail "_Azerty1*_" , continuez avec **< NEXT >**.

![](/S15/ressource/iredmail/installmail9.jpg)

Saisissez le nom domaine comme suit, continuez avec **< NEXT >**.

![](/S15/ressource/iredmail/installmail2.jpg)

Saisissez le mot de passe Administrateur "_Azerty1*_" , continuez avec **< NEXT >**.

![](/S15/ressource/iredmail/installmail3.jpg)

Pour les options, sélectionnez: **_Roundcubemail_**, **_netdata_**, **_iRedAdmin_** et **_Fail2ban_**. Continuez avec **< NEXT >**.

![](/S15/ressource/iredmail/installmail10.jpg)

L'installation et la configuration sont terminées. 
Aux questions _File: /etc/nftables.conf, with SSHD ports: 22_ et _Restart firewall now (with ssh port: 22)?_ , validez les deux questions avec **y**.

![](/S15/ressource/iredmail/installmail11.jpg)

Connectons-nous à la page de connexion de _Roundcube Webmail_ avec l'adresse IP **10.10.8.116/mail/**. Saisissez le nom d'utilisateur "_postmaster@ecotechsolutions.fr_" et le mot de passe "_Azerty1*_" et cliquez sur **CONNEXION**.

![](/S15/ressource/iredmail/installmail12.jpg)

Voici la page d'accueuil de _Roundcube Webmail_.

![](/S15/ressource/iredmail/installmail13.jpg)

Pour créer un nouveau contact, allez à gauche sur l'encart _Contacts_ et ensuite cliquez sur l'encart _Créer_ en haut au milieu.

![](/S15/ressource/iredmail/installmail14.jpg)

Connectons-nous à la page de connexion de _iRedAdmin_ avec l'adresse IP **10.10.8.116/iredadmin/**. Saisissez le nom d'utilisateur _postmaster@ecotechsolutions.fr_ et le mot de passe _Azerty1*_ et cliquez sur **CONNEXION**.

![](/S15/ressource/iredmail/installmail15.jpg)

Pour Créer un utilisateur, allez sur l'onglet **+Add**.

![](/S15/ressource/iredmail/installmail16.jpg)

Pour créer l'utilisateur, remplir tout les champs contenant une étoile rouge et cliquez sur **Add** en bas de page.

![](/S15/ressource/iredmail/installmail17.jpg)

Une fois créee, vérifions en allant sur l'onglet **Domains and Accounts**

![](/S15/ressource/iredmail/installmail18.jpg)

Retournons sur la page d'accueuil de _Roundcube Webmail_ pour verifier que l'utilisateur crée apparait bien dans les contacts.

![](/S15/ressource/iredmail/installmail19.jpg)

Connectons-nous sur un compte crée précédemment.

![](/S15/ressource/iredmail/installmail20.jpg)

Créeons un mail test vers un autre contact et cliquez sur **Envoyer**.

![](/S15/ressource/iredmail/installmail21.jpg)

Notre contact a bien reçu le mail test que nous avons envoyé.

![](/S15/ressource/iredmail/installmail22.jpg)

La création et la configuration de l'adresse mail est operationelle.

A présent, nous nous rendons sur un poste client de notre domaine, nous connectons au compte d'un utilisateur (dans notre exemple, nous nous servons du compte de Noémie Leloir). Juste avant, nous avons procédé à l'installation de **Thunderbird** via une GPO depuis notre AD-DS avec l'utilitaire GPO.
Une fois Thunderbird installé, nous procédons aux réglages suivants (de telle sorte à "lier" le serveur mail à notre client mail installé sur le poste; cela permet d'éviter à l'utilisateur de se rendre directement sur le serveur pour consulter ses emails) :
  
On se rend dans **Paramètres** > **Paramètres des comptes** > **Paramètres serveur** : ici nous spécifions le nom DNS de notre serveur mail (conteneur IanMail), i.e. *ianmail.ecotechsolutions.fr* qui écoute sur le port 143 (IMAP non sécurisé). Nous pouvons aussi donner le prot 993 (over TLS), plus uen sécurisation accrue. Nous validons :

![installmail23](/S15/ressource/iredmail/installmail24.jpg)
  
Ce qui génère un redémarrage de l'application pour tenir compte des modifications. Nous entrons le mot de passe de l'utilisateur en question :

![installamil24](/S15/ressource/iredmail/installmail23.jpg)
  
Nous avons connecté le client au serveur mail !