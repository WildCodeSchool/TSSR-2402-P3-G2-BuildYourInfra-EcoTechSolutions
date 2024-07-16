# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## Sommaire

1) Contexte

1) Pré-requis techniques

2) Installation et Configuration des équipements et ressources

3) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## Contexte

```
# 1. Objectifs

1. SÉCURITÉ - Utilisation d'un IDS/IPS et d'une machine d'attaque
	1. Utilisation de **SNORT** :
		1. Installé sur une VM dédiée Ubuntu ou Debian
		2. Les attaques doivent être visible
	2. Utilisation de la suite logiciel METASPLOIT pour effectuer des attaques vers des éléments de l'infrastructure réseaux
		1. Installée sur une VM dédiée :
			1. À partir d'une distribution, comme **KALI** sur laquelle elle est déjà présente
			2. À partir d'une installation complète sur une VM Ubuntu
			3. Voir **Contexte** plus bas pour les attaques possible
2. [OBLIGATOIRE] COMPTE-RENDU DE FIN DE PROJET 3
	1. Mise à jour du schéma d'infrastructure
		1. Contient uniquement les éléments complètements fonctionnels
		2. Étiquetages selon nomenclature, avec une vision **claire** de la schématisation :
			1. Nom des différents nœuds
			2. Adresse IP, masque
			3. Fonction
	2. Tableau de synthèse des matériels (format markdown)
		1. Nom des machines
		2. Type (VM ou CT)
		3. OS
		4. Fonction
		5. Adresse IP, masque
		6. Nombre de disques, et par disque :
			1. Taille totale (en Go)
			2. Espace libre (en Go)
			3. Espace libre (en %)
		7. RAM :
			1. Taille totale (En Go)
			2. Taille utilisée, en moyenne (en %)
	3. Tableau de synthèse de la documentation (format markdown)
		1. Nom des machines
		2. Logiciel ou appliance
		3. Statut de la documentation d'installation :
			1. A jour
			2. A mettre à jour (indication de la raison de la non mise à jour)
			3. Non-utilisable (indication de la raison)
			4. Inexistante (indication de la raison de la non-existence de la documentation)
		4. Statut de la documentation d'utilisation :
			1. A jour
			2. A mettre à jour (indication de la raison de la non mise à jour)
			3. Non-utilisable (indication de la raison)
			4. Inexistante (indication de la raison de la non-existence de la documentation)

# 2. Contexte

- Finalisation des objectifs de projets
- L'infrastructure réseau ne change plus à la fin de ce sprint
- Attaques possibles à tester :

| Attaque                                     | Cible                                                      | Outils Alternatifs |
| ------------------------------------------- | ---------------------------------------------------------- | ------------------ |
| Scan de Ports                               | N'importe quelle machine avec des ports ouverts            | Nmap               |
| Escalade de Privilèges                      | Windows 10                                                 | -                  |
| Attaques par Force Brute                    | Serveur Debian (avec SSH activé)                           | Medusa             |
| Attaque Man-in-the-Middle (MITM)            | Windows ou Linux                                           | Wireshark          |
| Exploitation de Serveur Web Apache Tomcat   | Serveur Linux avec Apache Tomcat                           | -                  |
| Attaques de Réinitialisation de Session TCP | Serveur Linux Debian ou Windows (avec services TCP actifs) | hping3             |
| Attaques FTP par Injection de Commande      | Serveur Linux Debian ou Windows (avec vsFTPd 2.3.4)        | -                  |
```

## Pré-requis techniques

## Installation et Configuration des équipements et ressources
  
### Scan de ports avec NMAP
  
Nmap (Network Mapper) est un outil open-source utilisé pour la découverte de réseaux et les audits de sécurité. Il est couramment utilisé par les administrateurs système et les professionnels de la sécurité pour :

 - Découverte de Réseau : Identifier les hôtes actifs sur un réseau, les services qu'ils proposent, ainsi que les ports ouverts.
 - Audit de Sécurité : Détecter les vulnérabilités potentielles sur des machines et des réseaux, et vérifier les configurations de sécurité.
 - Inventaire de Réseau : Recueillir des informations détaillées sur les dispositifs et les services présents sur un réseau.
  
Nous nous servons de notre machine Kali, sur laquelle est pré-installé nmap (sinon ``sudo apt install nmap``)
  
Nous appelons le logiciel dans un terminal : ``nmap ip_machine_locale``
  
![nmap](./ressource/nmap.jpg)
  
Nous commençons par scanner un réseau donné pour obtenir les adresses des hôtes connectés :
  
```
#options -sP ou -sn pour découvrir les hôtes actifs; * pour 0-255
nmap -sP 10.10.8.*
```
  
![nmap1](./ressource/nmap2.jpg)
  
Nous pouvons tester les ports ouverts ainsi que les services en écoute et leur version :
  
```
nmap -sV 10.10.8.5
```
![nmap2](./ressource/nmap3.jpg)
  
On peut déterminer l'OS de l'hôte cible puis effacer la trâce du scan avec l'option -sS :
  
![nmap3](./ressource/nmap4.jpg)
  
Nous pouvons aussi tester des ports spécifiques...
  
![nmap4](./ressource/nmap5.jpg)
  
...ou même tester une plage de ports donnée :
  
![nmap5](./ressource/nmap7.jpg)
  
  
### Attaque Man-in-the-Middle (MITM)
  
L'attaque de type Man-in-the-Middle (MiTM) est une forme de cyberattaque où un attaquant intercepte et éventuellement altère la communication entre deux parties qui croient communiquer directement entre elles.
  
Ettercap est un outil de cybersécurité open-source utilisé pour effectuer des attaques de type Man-in-the-Middle (MiTM) et pour surveiller les réseaux. Voici une brève description de cet outil :

Fonctionnalités principales :
 - Interception de données : Ettercap permet de capturer et d'analyser le trafic réseau en temps réel.
 - ARP Spoofing : Cet outil peut usurper des adresses IP et intercepter les communications entre les hôtes sur un réseau local.
 - Analyse de protocole : Ettercap est capable d'interpréter et d'afficher les données de nombreux protocoles réseau, facilitant l'analyse.
 - Injection de paquets : L'outil peut injecter des paquets dans une communication active, permettant des attaques comme l'insertion de commandes ou de données.

Modes d'utilisation :
 - Sniffing passif : Capture du trafic sans interférence, utile pour la surveillance.
 - Sniffing actif : Interception et modification du trafic, permettant des attaques MiTM.

Interfaces :
 - Interface graphique : Offre une interface utilisateur graphique pour une utilisation plus intuitive.
 - Interface en ligne de commande : Pour les utilisateurs avancés qui préfèrent un contrôle direct et scriptable.

Plateformes supportées : Ettercap fonctionne sur diverses plateformes, y compris Linux, Windows, et macOS.
  
Nous utilisons ici notre machine Kali, et ciblons notre serveur principal Maximus.
  
Ettercap en graphique n'était pas directement installé sur la machine Kali, nous avons donc lançé la commande suivante : ``sudo apt install ettercap-graphical``
  
Nous ouvrons alors le logiciel **Ettercap** depuis le menu d'acceuil de la machine Kali.
  
![etter](./ressource/etter2.jpg)
  
On clic sur la loupe en haut à gauche pour lancer un scan du réseau :
  
![etter1](./ressource/etter3.jpg)
  
Nous avons pu détecter la présence des hôtes actifs sur le réseau en cliquant sur la loupe dans le quart en haut à gauche de la fenêtre :
  
![etter2](./ressource/etter4.jpg)
  
On clic sur l'hôte qui nous intéresse : ECO-Maximus.
Puis *Add to Target1*.
  
![etter3](./ressource/etter5.jpg)
  
En haut à droite de la fenêtre, nous cliquons sur la petite 'planète' > **ARP poisoning** > on laisse cocher Sniff remote connections.
  
![etter4](./ressource/etter6.jpg)  ![etter5](./ressource/etter7.jpg)
  
Le récapitulatif s'affiche alors dans la fenêtre du bas.
  
![etter5](./ressource/etter8.jpg)
  
En parallèle, sur la machine Maximus, on se rend sur l'URL : http://testphp.vulnweb.com/login.php (site pour tester des login et plusieurs autres paramètres PHP).
On y rentre le login/mot de passe indiqué pour le test : test/test.
Puis de retour sur le logiciel **Ettercap**, on observe dans la moitié inférieur de la fenêtre l'apparition en clair du login et du mot de passe utilisés sur le site web depuis Maximus !
  
![etter6](./ressource/etter9.jpg)
  

### Attaques par Force Brute sur serveur Debian avec SSH activé : Medusa
  
Nous nous servons de notre machine Kali Linux (10.10.200.50), pour simuler une attaque sur notre machine Debian Lucy (10.10.8.50).
Le logiciel Medusa est installé sur la machine Kali.
Son utilisation requiert deux pré-requis pour ce type d'utilisation : 
 - un fichier *users.txt* dans lequel nous pouvons placer à la main un certain nombre de noms d'utilisateurs que nous souhaitons "tester"
 - un fichier *passwords.txt* dans lequel nous trouvons les mots de passe pouvant correspondre aux noms d'utilisateurs du fichier précédent
Pour remplir ces fichiers, nous pouvons utiliser un script (python par exemple), les inscrire directement à la main (dans notre cas, nous avons ajouter **wilder**, **Administrator**... et en mots de passe correspondants **Azerty1***, **Azerty2***, **Azerty3***), ou encore cloner directement des repo GitHub listant un grand nombre de possibilités connues.
  
Alors, nous pouvons lancer la commande Medusa avec la syntaxe suivante :
  
```
#-h pour l'adresse cible, -U pour appeler le fichier txt users, -P pour appeler le fichier txt des password  
 et -M pour le module. -n pourrait être utilisé ici pour spécifier le port cible (qui pourrait être 2222...)

medusa -h 10.10.8.50 -U user.txt -P password.txt -M ssh
```  
  
Nous obtenons la sortie suivante :
  
![medusa1](./ressource/medusa1.jpg)
  
Nous observons le résultat positif sur la troisième ligne plus haut : ``ACCOUNT FOUND...``
L'attaque par Force Brute a fonctionné.
  
  
### Attaques de Réinitialisation de Session TCP | Serveur Linux Debian ou Windows (avec services TCP actifs) | hping3
  
Hping3 est un outil de ligne de commande open-source utilisé pour la génération et l'analyse de paquets TCP/IP. Il est souvent utilisé pour les tests de sécurité des réseaux, le dépannage, et l'enseignement des concepts de protocoles réseau. Hping3 est capable de créer des paquets TCP, UDP, ICMP et RAW-IP, et de manipuler presque tous les champs de ces paquets, ce qui en fait un outil très flexible et puissant.
  
Nous utilisons notre machine Kali, sur laquelle est présent **hping3**. Nous ciblons notre machine Lucy pour l'attaque.
  
![hping31](./ressource/hping31.jpg)
  
**sudo** : car requiert l'élévation de privilèges
**-R** : ajoute le drapeau RST au paquet TCP, utilisé pour réinitialiséer une connexion TCP active
**-S** : ajouter le drapeau SYN (Synchronize) au paquet TCP, utilisé pour initier une connexion TCP
**-a** : introduit l'adresse IP source à utiliser dans l'envoi du paquet, et permet de masquer l'IP réelle de l'expéditeur
**-p** : spécifie le port de destination du paquet 
**-s** : spécifie le port source du paquet 
**--rst** : équivalente à **-R**, utilisée pour renforcer l'intention de réinitialisation
  
L'attaque se déroule puis s'arrête. On remarque alors que Lucy ne répond plus !
  
![hping3](./ressource/hping32.jpg)
  
Puis nous la stoppons :
  
![hping3](./ressource/hping33.jpg)
  
  
### Attaques FTP par Injection de Commande | Serveur Linux Debian ou Windows (avec vsFTPd 2.3.4)
  
Les attaques FTP par injection de commande exploitent des vulnérabilités dans les serveurs FTP, tels que vsFTPd 2.3.4 utilisés sur Linux Debian ou Windows. Ce type d'attaque permet à un attaquant d'injecter des commandes malveillantes via des requêtes FTP afin de prendre le contrôle du serveur ou d'accéder à des informations sensibles.
  
Nous utilisons notre machine Kali, depuis laquelle nous simulons une attaque FTP par injection de commandes sur notre machine Debian ChefGoule (Apache Guacamole).
Pré-requis : nous installons le service ftp (``apt install vsftpd``, modifions son ``/etc/vsftpd.conf`` pour le le rendre vulnérable et effacer la configuration de sécurité...) et nous assurons que le port 21 est bien ouvert. Ce que nous confirmons depuis la machine Kali :

![ftp1](./ressource/ftp1.jpg)
  
Alors, nous pouvons tenter d'établir une connexion avce le serveur ftp :

![ftp2](./ressource/ftp5.jpg)
  
Il nous est demandé de rentrer un nom. Nous donnons *ftp* car il s'agit de l'utilisateur par défaut crée lors de la configuration du service ftp sur le serveur distant. Le mot de passe par défaut est laissé vide, donc **Entrée** lorsqu'il nous est demandé.

Une fois connecté au serveur FTP, nous pouvons essayer d'exécuter des commandes susceptibles d'exploiter une injection de commandes, si une vulnérabilité est connue, comme plus haut : 
  
```
ftp> ls   #Nous listons les répertoires/fichiers 'à disposition'
ftp> cd   #Pour accéder au répertoire souhaité
ftp> get nom_fichier    #Pour télécharger le fichier souhaité depuis le serveur ftp distant
ftp> quit   #Pour sortir de la session ftp en cours
```
  
Nous vérifions alors que le 'prélèvement' du fichier s'est bien déroulé :
  
![ftp3](./ressource/ftp4.jpg)
  



## FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration