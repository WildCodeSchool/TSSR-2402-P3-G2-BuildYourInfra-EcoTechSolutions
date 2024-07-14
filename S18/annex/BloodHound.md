# Détection de vulnérabilités AD avec BloodHound

## Sommaire

1) Installation de BloodHound

## Installation de BloodHound

L'installation de BloodHound nécessite plusieurs pré-requis :

   -  la BDD neo4j
   -  une "sonde" pour extraire les informations depuis notre serveur AD principal avec *SharpHound*
  
Nativement nous avons accès au logiciel **BloodHound** depuis notre machine Kali Linux, ainsi qu'à la base de données **neo4j**.
Si toutefois ce n'était pas le cas, nous nous rendrions sur https://www.kali.org/tools/bloodhound/ pour la documentation concernant l'installation de BloodHound, et sur https://github.com/BloodHoundAD/SharpHound/releases pour celle concernant SharpHound (la sonde).
  
Une fois la confirmation de la bonne installation, depuis le terminal de Kali, nous démarrons la console neo4j :
  
![blood1](/S18/ressource/bloodhound/blood1.jpg)
  
Une fois ceci réalisé, nous pouvons accèder à l'interface web de neo4j pour se connecter : http://localhost:7474/ (par défaut login/mot de passe : neo4j/neo4j)
  
![blood4](/S18/ressource/bloodhound/blood2.jpg)
  
Après d'être authentifié, nous changeons le mot de passe par défaut pour un nouveau (ici Azerty1*). Nous en aurons besoin pour s'authentifier sur l'interface de BloodHound.
  
![blood2](/S18/ressource/bloodhound/blood3.jpg)
  
Ainsi, nous pouvons accèder directement à l'interface de l'application BloodHound depuis notre Bureau avec le nouveau mot de passe précédemment rentré.
  
![blood3](/S18/ressource/bloodhound/blood4.jpg)
  
Alors, il a fallu installer la fameuse "sonde" permettant d'exporter les données vers notre application BloodHound.
Pour ce faire, depuis le lien ci-dessus pour télécharger **SharpHound**, nous l'installons sur notre serveur principal : ECO-Maximus. Nous décompressons l'archive et depuis le terminal PowerShell, nous exécutons le fichier exécutable de SharpHound : nous obtenons alors un nouveau dossier dans lequel nous retrouvons plusieurs fichiers *.json qui constituent les différentes données que nous allons alors exportées dans BloodHound sur la machine Kali Linux de notre domaine.
Nous avons choisi de passer par le logiciel WinSCP pour transférer ce dossier du serveur vers la machine Kali Linux.
Ne reste plus qu'à glisser/déposer chaque fichier dans la fenêtre *Import Graph* de l'interface de BloodHound pour récupérer les informations.
Nous avons alors cet écran devant nous :
  
![blood5](/S18/ressource/bloodhound/blood5.jpg)