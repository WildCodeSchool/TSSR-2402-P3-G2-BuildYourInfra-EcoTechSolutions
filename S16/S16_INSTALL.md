# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## **Sommaire**

1) Pré-requis techniques

2) Installation et Configuration des équipements et ressources

3) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## **Pré-requis techniques**

## **Installation et Configuration des équipements et ressources**

### Installation du Server WSUS

WSUS signifie Windows Server Update Service et il s’agit du rôle intégré à Windows Server qui a une mission bien précise, la distribution des mises à jour des produits Microsoft sur les postes de travail et serveurs de notre entreprise.

L’installation du rôle WSUS sur Windows Server 2022

Ouvrez le " Gestionnaire de serveur ", cliquez sur " Manage " puis " Add Roles and Features "

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-1.png)

Passons le premier écran en cliquant sur " Next "

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-2.png)

Nous sélectionnons la première option, puis nous cliquons sur "Next".

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-3.png)

Nous sélectionnons le serveur approprié, puis nous cliquons sur "next".

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-4.png)

Nous sélectionnons le service "Windows Server Update Services" dans la liste des rôles serveur.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-5.png)

Ensuite, nous cliquons sur le bouton "Add Features", puis sur "Next"

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-6.png)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-7.png)

Pour les deux étapes suivantes, nous cliquons également sur le bouton "Next".

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-8.png)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-9.png)

Maintenant, nous entrons le chemin d'accès du disque où nous souhaitons stocker les mises à jour.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-10.png)

Ensuite, nous cliquons sur le bouton "Suivant", puis de nouveau sur "Suivant", et enfin sur "Installer".

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-11.png)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-12.png)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-13.png)

Une fois l'installation terminée, nous cliquons sur le bouton "Fermer" pour fermer la fenêtre.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-14.png)

Enfin, nous cliquons sur le petit drapeau jaune situé en haut à droite de la fenêtre de "Server Manager", puis nous sélectionnons "Post-installation" dans le menu déroulant pour lancer la procédure de post-installation

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Install/WSUS-Install-15.png)

### Configuration de base de WSUS

WSUS est installé sur notre serveur et la base de données est créée. Désormais, nous pouvons lancer la console « Services WSUS » afin d’effectuer la configuration de base. Pour ce faire nous allons dans manage server et en haut a droite "Tools".

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-1.png)

Pour la première étape,  nous cliquons sur "Next"

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-2.png)

Nous décochons l'option "Joindre le programme Microsoft Update", puis nous cliquons sur "Next".

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-3.png)

Nous laissons sur "Synchronize from Microsoft Update" puis "Next"

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-4.png)

Nous n'avons pas de serveur proxy à entrer. Nous cliquons sur "Next"

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-5.png)

Maintenant nous lançons "Start Connecting", une fois terminé nous cliquons sur "Next"

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-6.png)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-7.png)

Comme nous avons des ordinateurs en francais et en anglais pour le choix de langues des mises a jour nous selectionnons "French" et "English" 

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-8.png)

Dans l'images suivante j'ai laissé par défaut, mais nous devons sélectionner les produits pour lesquels nous souhaitons synchroniser les mises à jour. La liste est très longue et très complète, nous devons cocher les produits correspondants à ceux que nous utilisons !

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-9.png)

L’étape suivante concerne la classification des mises à jour, c’est-à-dire les types de mises à jour qu’il faut synchroniser sur le serveur WSUS

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-10.png)

La synchronisation des mises à jour avec les serveurs Microsoft Update doit être planifiée afin d’être sûr de recevoir les dernières mises à jour. De préférence, cette synchronisation sera planifiée la nuit afin de ne pas perturber la production

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-11.png)

Cochez l’option « Begin initial synchronization » si vous souhaitez réaliser une première synchronisation dès maintenant.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-12.png)

Nous cliquons sur "Finish"

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S16/WSUS/WSUS-Config/WSUS-Config-13.png)


  
## Solutions au partenariat avec la société BillU.
  
Une étroite collaboration est désormais active entre Ecotech Solutions et Billu.
  
BillU et Ecotechsolutions, un duo d'innovations,
S'unissent pour l'avenir, pour de grandes ambitions.
Ensemble, ils bâtissent des solutions durables,
Pour un monde plus vert, plus sain et plus stable.

Avec BillU, la technologie prend son envol,
Ecotechsolutions, c'est l'écologie qui colle.
Leurs forces combinées, pour un impact sans égal,
Un partenariat puissant, un potentiel colossal.

Des outils numériques, aux solutions écologiques,
Ils ouvrent la voie, vers un futur plus magique.
Chaque projet, une promesse, d’un monde transformé,
Où technologie et nature, enfin réconciliées.

Laissez-vous inspirer par cette alliance prospère,
BillU et Ecotechsolutions, un duo exemplaire.
Pour aujourd’hui et demain, ils tracent le chemin,
Vers un futur radieux, où tout devient plus sain.
  
### Firewall : mise en place des règles de parefeu et du NAT/PAT
  
La communication entre les deux entreprises est au coeur de la problématique que nous rencontrons en cette semaine 16. Voici la proposition de règles de parefeu que nous avons élaborée.
  
![firewall1](./ressources/firewall3.jpg)
  
De haut en bas (en ignorant la règle par défaut en première ligne):
  
 - Authentification Active Directory : laisse passer les paquets TCP/UDP en IPv4 qui arrivent de chez **BillU** à destination de notre serveur AD-DS (en 10.10.8.100/16) sur les ports propres aux communications LDAP (389, 636, 3268). Nous avons crée l'alias associé, illustré ci-dessous :
  
![firewall2](./ressources/firewall2.jpg)
  
 - Laisse passer les communications DNS, donc en direction du port 53, depuis BillU, vers Ecotech;
 - (règle mise en place en semaine 15 qui permettre le passage de communication depuis l'interface WAN vers notre DMZ via les ports web 80 et 443)
 - Permet le passage du tunnel OpenVPN;
 - Autorise l'accès au serveur d'administration Guacamole depuis BillU;
 - Limite l'accès utilisateur entre les deux réseaux uniquement aux services nécessaires
 - Permet de surveiller le traffic entre les réseaux et de garder une trace pour l'analyse.
  
Pour la mise en place de ces règles, nous avons aussi créer l'alias de l'adresse de l'interface WAN du parefeu de la société BillU:
  
![firewall3](./ressources/firewall1.jpg)
  
  
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
  
A partir de là, il suffit de rentrer l'URL : "http(s)://<ip_firewall_ecotechsolutions>:8080/guacamole" pour accèder à l'interface d'administration.
Évidemment, du côté de BillU, il est nécessaire de laisser passer les paquets à destination de leur interface WAN, puis de l'interface WAN de notre parefeu.
  
Voici ce qui nous affiche pfSense, une fois la règle créée:
  
![firewall4](./ressources/firewall4.jpg)
  
Nous pouvons à présent administrer les différentes machines configurés dans notre fichier ``.xml`` d'Apache Guacamole directement depuis un poste autorisé chez BillU. La confiance règne.
  


## **FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration**
