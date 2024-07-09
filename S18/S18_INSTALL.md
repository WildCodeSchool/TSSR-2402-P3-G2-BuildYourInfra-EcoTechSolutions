# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## **Sommaire**

1) Pré-requis techniques

2) Installation et Configuration des équipements et ressources
  
### Utilisation du logiciel *BloodHound* : détection des vulnérabilités
  
L'installation de BloodHound nécessite plusieurs pré-requis :

   -  la BDD neo4j
   -  une "sonde" pour extraire les informations depuis notre serveur AD principal avec *SharpHound*
  
Nativement nous avons accès au logiciel **BloodHound** depuis notre machine Kali Linux, ainsi qu'à la base de données **neo4j**.
Si toutefois ce n'était pas le cas, nous nous rendrions sur https://www.kali.org/tools/bloodhound/ pour la documentation concernant l'installation de BloodHound, et sur https://github.com/BloodHoundAD/SharpHound/releases pour celle concernant SharpHound (la sonde).
  
Une fois la confirmation de la bonne installation, depuis le terminal de Kali, nous démarrons la console neo4j :
  
![blood1](./ressources/blood1.jpg)
  
Une fois ceci réalisé, nous pouvons accèder à l'interface web de neo4j pour se connecter : http://localhost:7474/ (par défaut login/mot de passe : neo4j/neo4j)
  
![blood4](./ressources/blood2.jpg)
  
Après d'être authentifié, nous changeons le mot de passe par défaut pour un nouveau (ici Azerty1*). Nous en aurons besoin pour s'authentifier sur l'interface de BloodHound.
  
![blood2](./ressources/blood3.jpg)
  
Ainsi, nous pouvons accèder directement à l'interface de l'application BloodHound depuis notre Bureau avec le nouveau mot de passe précédemment rentré.
  
![blood3](./ressources/blood4.jpg)
  


1) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## **Pré-requis techniques**

## **Installation et Configuration des équipements et ressources**

## **FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration**