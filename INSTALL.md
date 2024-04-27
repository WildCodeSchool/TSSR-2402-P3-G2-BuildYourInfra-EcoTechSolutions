# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## **Sommaire**

1) Pré-requis techniques

- Récapitulatif de la demande client :
    Entité principale en semaine 1 : population :
  | EchoTechSolutions | Studio Dlight | UBIHard |
  |:-:|:-:|:-:|
  | 48 | 1 | 5 |


2) Installation et Configuration des équipements et ressources

3) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## **Pré-requis techniques**

## **Installation et Configuration des équipements et ressources**
### Plan schématique du futur réseau : 
![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/images/Plan_Sch%C3%A9ma_R%C3%A9seau.png?raw=true)
#### Nous avons divisé l'entreprise en deux parties : 
la **direction** et les autres **services**. 
Ainsi, nous avons un **routeur** pour chaque partie avec des **switch** pour lier les machines au réseau. Un **routeur** principal qui assurera la liaison entre ces deux parties, avec une zone **DMZ**(Zone démilitarisée,  un sous-réseau isolé) pour les **serveurs** et les **conteneurs**, ainsi que le cloud pour la **messagerie**. Il est également prévu une éventuelle fusion, suite aux dernières nouvelles de la direction.
A Gauche, sur les clients, nous utilisons le nom abrégé avec la plage de réseau correspondant au service.
##### Lexique : 
- CLI_COM = Département Communication
- CLI_DEV = Département Développement
- CLI_BUS = Département Service Commercial
- CLI_FICO = Département Finance et Comptabilité
- CLI_DIR = Département Direction
- CLI_DRH = Département Direction des Ressources Humaines
- CLI_DSI = Département Direction des Systèmes Informatiques

============================================================================================

### Installation du rôle DHCP

1. Dans *Manage* > *Add Roles and Features*
![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/images/DHCP1ok.jpg)


2. Dans *Before you begin* > *Next*
![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/images/DHCP2.jpg)


3. Dans *Installation type* > *Role-based of feature-based installation* > *Next*
![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/images/DHCP3.jpg)


4. Dans *Server Selection* > *Next*
![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/images/DHCP4.jpg)


5. Dans *Server Roles*, on coche **DHCP Server** puis *Next*
![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/images/DHCP5.jpg)


6. Cliquer sur *Add Features*  
![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/images/DHCP6.jpg)  


7. Puis *Next*  
![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/images/DHCP7.jpg)


8. Dans la fenêtre *DHCP Server* > *Next* encore
![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/images/DHCP8.jpg)


9. Enfin, dans *Confirm Installation selections* > **Install**. 
![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/images/DHCP9.jpg)


### Configuration du rôle DHCP sur Windows Server

1. Dans le Gestionnaire de serveur, cliquer sur le menu **Outils** puis sur **DHCP**.
![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/images/DHCP10ok.jpg)



2. Dérouler **DHCP,** nom du serveur, **IPv4**. Fare un **clic droit sur IPv4** et choisir **Nouvelle étendue**.
![]([https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/images/DHCP11ok.jpg)



3. Donner un **Nom** à l’étendue DHCP et une **Description** (optionnel).
![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/images/DHCP12.jpg)


4. Choisir une plage d’adresse IP, en fonction de l’adresse IP fixe du serveur. Si le serveur a pour adresse IP 192.168.0.1, la plage DHCP sera aussi sur le sous réseau 192.168.0. **Choisir une plage plus ou moins large selon le nombre de postes** et de périphériques (smartphones, tablettes) qui seront connectés. Laisser les valeurs « **Longueur** » et « **Masque de sous-réseau** » **par défaut**.
![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/images/DHCP13.jpg)


5. S’il y a des adresses IP à **exclure** de la plage sélectionnée, les indiquer sur l’écran « Ajout d’exclusions et de retard » .

6. Par défaut, la **Durée du bail** est de 8 jours. Modifier cette durée si nécessaire. La durée du bail est la durée pendant laquelle une adresse IP sera réservée à un appareil. Par exemple, si l’ordinateur de Michel se connecte le lundi matin, son adresse IP lui sera attribuée jusqu’au lundi suivant, même s’il ne se connecte pas. Le renouvellement se fera donc chaque semaine avec la valeur par défaut.

7. Demander la **Configuration des paramètres DHCP** « maintenant » .

8. Votre réseau informatique est certainement équipé d’un routeur ou d’une box pour l’accès à internet. A l’écran **Routeur**, indiquer l’**adresse IP** de ce boitier qui deviendra la passerelle par défaut des postes en [DHCP](https://www.windows8facile.fr/tag/dhcp/). Ainsi, pas besoin de configurer chaque PC pour qu’il puisse aller sur internet.
![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/images/DHCP14.jpg)


9. L’option suivante, **Nom de domaine et serveurs DNS**, doit être préremplie avec le nom du domaine et l’adresse IP du serveur principal. Laisser ainsi et cliquer sur **Suivant**.

10. S’il y a nécessité d’indiquer un serveur **WINS** (du temps de Windows NT 4.0, avant Active Directory), sinon laisser vide et **Suivant**.

11. Valider « **Oui, je veux activer cette étendue maintenant** » pour commencer à utiliser le serveur DHCP.

12. Dérouler IPv4, Etendue [] pour voir l’étendue créée (Pool d’adresses), les Baux (c’est-à-dire la liste des postes clients qui recevront une adresse IP automatique), les Réservations et Options précédemment configurées.

- Installation et Configuration Serveur **DNS** et **Active directory**

- Installation DNS

1. Aller dans *Start* > *Server Manager*  
![alt text](file:///c%3A/Users/bugch/Images/DNS1.jpg)

2. Aller dans *Manage* > *Add roles and Features*  
![alt text](file:///c%3A/Users/bugch/Images/DNS2.jpg)

3. Dans *Installation type* > *Role-based of feature-based installation* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/DNS3.jpg)

4. Dans *Server Selection* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/DNS4.jpg)

5. Dans *Server Roles*, on coche *DNS Server* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/DNS5.jpg)

6. Cliquer sur *Add Features*  
![alt text](file:///c%3A/Users/bugch/Images/DNS6.jpg)

7. Dans *Feature* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/DNS7.jpg)

8. Dans *DNS Server* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/DNS8.jpg)

9. Enfin, dans *Confirm Installation selections* > *Install*.  
![alt text](file:///c%3A/Users/bugch/Images/DNS9.jpg)

  - Configuration DNS  

1. Aller dans *Start* > *Server Manager*  
![alt text](file:///c%3A/Users/bugch/Images/DNS1.jpg)

2. Clic-droit sur le serveur et sélectionner *DNS Manager*  
![alt text](file:///c%3A/Users/bugch/Images/DNS%20manage.jpg)

3. Ouvrir l’arborescence du serveur jusqu'à voir "*Forward Lookup Zones*", clic-droit dessus et sélectionner *New Zone*  
![alt text](file:///c%3A/Users/bugch/Images/DNS_fw%20newzone.jpg)

4. Dans *New Zone Wizard* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/DNS_fw1.jpg)

5. Dans *Zone Type* > *Primary Zone* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/DNS_fw2.jpg)

6. Dans *Zone Name*, entrer le nom du domaine (EcoTechSolutions.com) > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/DNS_fw3.jpg)

7. Dans *Zone File* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/DNS_fw4.jpg)

8. Dans *Dynamic Update* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/DNS_fw5.jpg)

9. Enfin, cliquer sur *Finish*  
![alt text](file:///c%3A/Users/bugch/Images/DNS_fw6.jpg)

10. Ouvrir l’arborescence du serveur jusqu'à voir "*EcoTechSolutions.com*", clic-droit dessus et sélectionner *New Host (A or AAAA)*  
![alt text](file:///c%3A/Users/bugch/Images/PTR1.jpg)

11. Dans *New Host* entrer l'adresse IP du serveur (10.10.8.2) dans *IP Adrress* et cochez *Create associated pointer (PTR) record* > *Add Host*  
![alt text](file:///c%3A/Users/bugch/Images/PTR2.jpg)

12. Ouvrir l’arborescence du serveur jusqu'à voir "*Reverse Lookup Zones*", clic-droit dessus et sélectionner *New Zone*  
![alt text](file:///c%3A/Users/bugch/Images/DNS_rw%20newzone.jpg)

13. Dans *New Zone Wizard* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/DNS_rw1.jpg)

14. Dans *Zone Type* > *Primary Zone* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/DNS_rw2.jpg)

15. Dans *Reverse Lookup Zone Name* > *IPv4 Reverse Lookup Zone* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/DNS_rw3.jpg)

16. Dans *Reverse Lookup Zone Name* > *Network ID*, entrer les 3 premiers octets de l'adresse IP en inversé (8.10.10) > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/DNS_rw4.jpg)

17. Dans *Zone File* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/DNS_rw5.jpg)

18. Dans *Dynamic Update* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/DNS_rw6.jpg)

19. Enfin, cliquer sur *Finish*  
![alt text](file:///c%3A/Users/bugch/Images/DNS_rw7.jpg)

  - Installation Active Directory

1. Aller dans *Start* > *Server Manager*  
![alt text](file:///c%3A/Users/bugch/Images/AD1.jpg)

2. Aller dans *Manage* > *Add roles and Features*  
![alt text](file:///c%3A/Users/bugch/Images/AD2.jpg)

3. Dans *Installation type* > *Role-based of feature-based installation* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/AD3.jpg)

4. Dans *Server Selection* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/AD4.jpg)

5. Dans *Server Roles*, on coche *Active Directory Domain Services* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/AD5.jpg)

6. Cliquer sur *Add Features*  
![alt text](file:///c%3A/Users/bugch/Images/AD6.jpg)

7. Dans *AD DS* > *Next*
![alt text](file:///c%3A/Users/bugch/Images/AD7.jpg)

8. Enfin, dans *Confirm Installation selections* > *Install*.  
![alt text](file:///c%3A/Users/bugch/Images/AD8.jpg)

  - Configuration Active Directory

1. Aller dans *Start* > *Server Manager*  
![alt text](file:///c%3A/Users/bugch/Images/AD1.jpg)

2. Aller sur le drapeau et cliquer sur *Promote this server to a domain controller*  
![alt text](file:///c%3A/Users/bugch/Images/AD9.jpg)

3. Dans *Deployement Configuration*, sélectionner *Add a new forest* et saisir le nom du domaine (EcoTechSolutions.com) > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/AD10.jpg)

4. Dans *Domain Controller Options*, saisir le mot de passe et le confirmer > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/AD11.jpg)

5. Dans *DNS Options* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/AD12.jpg)

6. Dans *Additional Options* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/AD13.jpg)

7. Dans *Path* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/AD14.jpg)

8. Dans *Review Options* > *Next*  
![alt text](file:///c%3A/Users/bugch/Images/AD15.jpg)

9. Dans *Prerequisites Check* > *Install*  
![alt text](file:///c%3A/Users/bugch/Images/AD16.jpg)

10 . Pour confirmer l'installation, le serveur redémarrera.  

## **FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration**
