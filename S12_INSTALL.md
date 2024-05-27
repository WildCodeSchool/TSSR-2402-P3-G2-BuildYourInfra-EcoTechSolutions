# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## **Sommaire**

1) Pré-requis techniques

2) Installation et Configuration des équipements et ressources

3) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## **Pré-requis techniques**

### Pré-requis de base Du Firewall Pfsense

1. Une interface réseau Wan :
   - IP : 10.0.0.3/24
   - Gateway : 10.0.0.1
   
2. Une interface réseau Lan :
   - IP : 10.10.255.254/16                           

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/ressource/s12/pfsense1.jpg)

## **Installation et Configuration des équipements et ressources**

### Configuration du Firewall Pfsense

1. Ajout d'une interface DMZ

La DMZ (Zone DéMilitarisée) est une zone isolée et séparée du reste du réseau. Son principal objectif est de protéger les données
et les systèmes internes d’une entreprise contre les attaques venant de l’extérieur.
Le fonctionnement d’une DMZ repose sur une série de règles de sécurité définies par l’entreprise. Ces règles
permettent de contrôler le trafic entre le réseau interne, la DMZ et le réseau externe, garantissant ainsi une
protection optimale des données et des systèmes internes.
La mise en place d’une DMZ présente plusieurs avantages :
 -  Sécurité renforcée
 -  Contrôle accru
 -  Flexibilité
 -  Performances

Pour ce faire, nous avons ajouté une carte réseau dans Proxmox, sur la VM de PfSense, pour la DMZ  

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/ressource/s12/proxmoxpfsense1.jpg)

Maintenant, nous pouvons voir qu'elle est bien visible dans la VM  

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/ressource/s12/pfsense2.jpg)

Nous devons maintenant l'ajouter sur la page du serveur PfSense en entrant l'adresse **https://10.0.0.3** dans un navigateur web, 
ce qui nous mènera à l'image suivante 

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/ressource/s12/pfsense8.png)

Une fois à ce stade, nous saisissons les identifiants et accédons à la page de gestion du pare-feu PfSense 

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/ressource/s12/pfsenseconfig1.jpg)

Arrivés ici, nous cliquons sur **Interfaces** puis sur **Assignments**

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/ressource/s12/pfsense3.jpg)

Nous cliquons sur **OPT1** et nous allons pouvoir configurer cette interface.
Dans un premier temps, nous cochons la case **Enable interface**, puis dans le champ **Description**, nous saisissons **DMZ**. Ensuite, dans le menu **IPv4 Configuration Type**, nous choisissons **Static IPv4**

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/ressource/s12/pfsense4.jpg)

Plus bas, nous saisissons l'adresse IPv4 statique

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/ressource/s12/pfsense5.jpg)

Et enfin, nous appliquons les changements

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/ressource/s12/pfsense6.jpg)

Nous pouvons voir les changements appliqués

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/ressource/s12/pfsense7.jpg)
  
2. Gestion des ID de VM de groupe

3. Mise en place de règles de pare-feu (WAN & LAN)

## **FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration**
