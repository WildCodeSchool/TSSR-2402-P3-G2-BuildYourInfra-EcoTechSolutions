# Partenariat d'netreprise : Règles du Firewall

## Sommaire

1) Firewall : mise en place des règles de parefeu et du NAT/PAT

## Firewall : mise en place des règles de parefeu et du NAT/PAT

La communication entre les deux entreprises est au coeur de la problématique que nous rencontrons en cette semaine 16. Voici la proposition de règles de parefeu que nous avons élaborée.

![firewall1](/S16/ressource/firewall/firewall3.jpg)

De haut en bas (en ignorant la règle par défaut en première ligne):

 - Authentification Active Directory : laisse passer les paquets TCP/UDP en IPv4 qui arrivent de chez **BillU** à destination de notre serveur AD-DS (en 10.10.8.100/16) sur les ports propres aux communications LDAP (389, 636, 3268). Nous avons crée l'alias associé, illustré ci-dessous :

![firewall2](/S16/ressource/firewall/firewall2.jpg)

 - Laisse passer les communications DNS, donc en direction du port 53, depuis BillU, vers Ecotech;
 - (règle mise en place en semaine 15 qui permettre le passage de communication depuis l'interface WAN vers notre DMZ via les ports web 80 et 443)
 - Permet le passage du tunnel OpenVPN;
 - Autorise l'accès au serveur d'administration Guacamole depuis BillU;
 - Limite l'accès utilisateur entre les deux réseaux uniquement aux services nécessaires
 - Permet de surveiller le traffic entre les réseaux et de garder une trace pour l'analyse.
  
Pour la mise en place de ces règles, nous avons aussi créer l'alias de l'adresse de l'interface WAN du parefeu de la société BillU:

![firewall3](/S16/ressource/firewall/firewall1.jpg)

En parallèle de l'établissement de ces règles, nous devons orchestrer le NAT (Network Address Translation) pour faire correspondre une requête à l'entrée de notre réseau donc au niveau du parefeu, vers une machine ciblée derrière celui-ci.
En effet, quand un utilisateur de la société BillU souhaitera atteindre par exemple notre serveur d'administration Guacamole (ChefGoule), celui-ci ignorera déjà sans doute son adresse IP, mais de toute manière ne pourra pas l'atteindre de toute manière car il appartient à un réseau privé situé derrière la passe-barrière pfSense. Donc sa requête ira "frapper à la porte du réseau", donc sur le parefeu, qui alors, transmettra les paquets à la machine ciblée pour assurer la communication.

Voici un exemple de règle de NAT:  

 - Interface : WAN
 - Protocol : TCP
 - Destination Address : WAN Address (celle de notre parefeu, soit disant, la porte d'entrée)
 - Destination Port Range :
     - From : 8080
     - To : 8080
 - Redirect target IP : 10.11.0.2
 - Redirect target port : 8080
 - Description : Accès bastion d'administration Guacamole

A partir de là, il suffit de rentrer l'URL : "http://<ip_firewall_ecotechsolutions>:8080/guacamole" pour accèder à l'interface d'administration.
Évidemment, du côté de BillU, il est nécessaire de laisser passer les paquets à destination de leur interface WAN, puis de l'interface WAN de notre parefeu.

Voici ce qui nous affiche pfSense, une fois la règle créée:

![firewall4](/S16/ressource/firewall/firewall4.jpg)

Nous pouvons à présent administrer les différentes machines configurés dans notre fichier ``.xml`` d'Apache Guacamole directement depuis un poste autorisé chez BillU. La confiance règne.