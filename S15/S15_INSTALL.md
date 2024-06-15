# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## **Sommaire**

1) Pré-requis techniques

2) Installation et Configuration des équipements et ressources





### Objectifs Personnalisés
1. Tiering Model
2. VM Pentest

Nous allons mettre en place un serveur de test d'intrusion avec Kali Linux dans l'infrastructure de ecotechsolutions, car cela présente plusieurs avantages et utilités, principalement axés sur l'amélioration de la sécurité et la préparation face aux cybermenaces. Voici quelques-unes des principales utilités :
a. Détection des vulnérabilités

  Identifications des failles : Un serveur Kali Linux permet de réaliser des tests de pénétration pour identifier les failles de sécurité potentielles dans les systèmes, les applications et le réseau.
  Évaluation des risques : En découvrant les vulnérabilités, l'entreprise peut évaluer les risques associés et prioriser les correctifs.

b. Amélioration de la sécurité proactive

  Renforcement de la sécurité : Les résultats des tests d'intrusion peuvent être utilisés pour renforcer les défenses de l'entreprise en appliquant des correctifs, des mises à jour et en améliorant les configurations de sécurité.
  Préparation aux attaques : Simuler des attaques permet de mieux comprendre comment les systèmes réagissent face à des menaces réelles, permettant de développer des stratégies de défense plus robustes.

c. Conformité réglementaire

  Respect des normes : De nombreuses normes de sécurité, telles que PCI-DSS, ISO 27001 et HIPAA, exigent des tests réguliers de sécurité. L'utilisation de Kali Linux pour ces tests aide l'entreprise à se conformer à ces exigences.
  Audit et rapports : Les tests d'intrusion peuvent fournir des rapports détaillés nécessaires pour les audits de sécurité et démontrer la conformité aux régulateurs.

e. Formation et sensibilisation

  Éducation des équipes : Un serveur Kali Linux peut être utilisé pour former les équipes de sécurité et les administrateurs système à identifier et à répondre aux menaces. C'est un outil précieux pour l'éducation continue en cybersécurité.
  Sensibilisation : En réalisant des tests d'intrusion internes, les employés prennent conscience des risques et de l'importance des pratiques de sécurité.

f. Détection des intrusions

  Simulations d'attaques : Les outils de Kali Linux permettent de simuler des attaques réalistes, aidant à tester et à améliorer les systèmes de détection d'intrusion (IDS) et les systèmes de prévention d'intrusion (IPS).
  Réaction aux incidents : Tester les réponses aux incidents dans un environnement contrôlé aide à améliorer les procédures de réponse aux incidents.

g. Gestion des correctifs

  Priorisation des correctifs : En identifiant les vulnérabilités critiques grâce aux tests d'intrusion, l'entreprise peut prioriser les correctifs et les mises à jour, optimisant ainsi l'utilisation des ressources.

h. Amélioration continue

  Cycle de rétroaction : Les résultats des tests d'intrusion fournissent un retour d'information continu sur l'état de la sécurité de l'infrastructure, permettant une amélioration constante des mesures de sécurité.

**Conclusion**

Mettre en place un serveur de test d'intrusion avec Kali Linux dans l'infrastructure de l'entreprise est une démarche proactive essentielle pour améliorer la sécurité globale, se préparer aux cyberattaques, se conformer aux réglementations et former les équipes de sécurité. Cela permet non seulement de détecter et de corriger les failles de sécurité, mais aussi de renforcer la posture de sécurité de l'entreprise de manière continue et évolutive.

#### Installation du système d'exploitation Kali linux

Une fois la VM lancée, après l'avoir créée et ajouté l'ISO d'installation de Kali Linux, nous devrions tomber sur la fenêtre ci-dessous. Nous choisissons alors l'option **'graphical install'**.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali1.png)

Après avoir choisi la langue de la machine, la géographie de notre emplacement et la langue du clavier en français, nous allons donner un nom à la machine.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali2.png)

Maintenant, nous allons entrer le nom de notre domaine **'ecotechsolutions.fr'** pour l'intégrer à celui-ci.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali3.png)

Puis, il nous demandera si nous voulons configurer la route du réseau et ajouter un DNS. Nous ne rentrons rien dans cette partie pour le moment, donc nous tapons **'Entrée'**. Ensuite, nous entrons le nom complet de l'utilisateur. Nous inscrivons **'wilder'** et validons deux fois. Enfin, nous entrons et confirmons le mot de passe **'Azerty1*'**.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali4.png)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali5.png)

Nous sélectionnons **'Assisté - utiliser un disque entier'**.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali6.png)

Puis, nous validons le premier choix.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali7.png)

Nous répondons **'OUI'** pour confirmer les changements sur les disques.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali8.png)

Nous laissons les cases cochées par défaut.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali9.png)

Nous validons l'installation du programme de démarrage GRUB et sélectionnons le disque principal.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali10.png)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali11.png)

Nous validons **'Continuer'** pour redémarrer.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali12.png)

Une fois redémarré, nous entrons les identifiants.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali13.png)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali14.png) 

Nous pouvons constater l'écran d'accueil et, en haut à gauche, la barre de recherche où se trouvent les outils nécessaires pour l'utilisation que nous avons choisie. Ensuite, nous pouvons passer à la configuration.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali19.png)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali20.png)

#### Configuration de Kali linux

Dans un premier temps, nous avons configuré l'adresse IP, la passerelle et le DNS de la machine virtuelle.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali16.png)

Puis, nous avons défini un mot de passe pour le compte root.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali15.png)

Ensuite, nous avons lancé la mise à jour du système et des applications.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali17.png)

Nous lançons la commande suivante qui va nous permettre d'installer tous les paquets nécessaires pour effectuer des tests de pénétration et d'évaluer la sécurité des systèmes d'information et des réseaux.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/kali18.png)

#### Outils Kali Linux

##### Nmap

1. Introduction :

Nmap est un scanner de ports libre créé par Fyodor et distribué par Insecure.org. Il est conçu pour détecter les ports ouverts, identifier les services hébergés et obtenir des informations sur le système d'exploitation d'un ordinateur distant.

2. Utilisation :

Dans un premier temps, on retrouve l'outil dans la barre de recherche à gauche de l'écran.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/Kali_nmap/kali_nmap0.png)

Une fois la console ouverte, nous pouvons effectuer une recherche dans le réseau choisi ou une plage de réseau. Bien sûr, il existe plusieurs moyens d'établir des scans.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/Kali_nmap/kali_nmap1.png)

ou

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/Kali_nmap/kali_nmap2.png)

Nous pouvons voir plusieurs adresses IP s'afficher, appartenant au réseau ciblé 10.10.8.0/24, ainsi que les ports ouverts de chaque machine.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/Kali_nmap/kali_nmap3.png)

Il existe un script prédéfini dans Nmap, accessible via une commande, qui permet aux utilisateurs d'exécuter un scan de vulnérabilités. Cela est donc très pratique pour s'assurer que notre système est à jour et non vulnérable.

Voici une commande pour lancer un script prédéfini :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/Kali_nmap/kali_nmap4.png)

Nous pouvons remarquer que nous avons obtenu davantage d'informations sur l'adresse IP ciblée et les vulnérabilités :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/Kali_nmap/kali_nmap5.png)

Nous pouvons lancer un script par défaut pour obtenir le nom, l'adresse MAC et le domaine de la machine.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/Kali_nmap/kali_nmap6.png)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S15/annexe/kali_inst/Kali_nmap/kali_nmap7.png)

Cette sortie de nmap montre que l'hôte 10.10.8.100 a les ports 3389 (RDP) et 5357 ouverts, avec des certificats SSL associés au service RDP et des informations détaillées sur l'intégration Active Directory de l'hôte. Les informations sur l'adresse MAC et la résolution DNS de l'hôte sont également fournies. Ces données peuvent être utiles pour comprendre la configuration réseau de l'hôte, vérifier les certificats SSL, et diagnostiquer les services exposés et leur sécurité.

**Voici une liste des options Nmap**

| Options         | Commandes                                                                                  |
|:---------------:|:------------------------------------------------------------------------------------------:|
| --exclude       | Exclure des hôtes du scan                                                                  |
| -n              | Désactiver la résolution DNS                                                               |
| --open          | Afficher que les ports ouverts                                                             |
| -oN             | Enregistrer le résultat du scan dans un fichier au format texte                            |
| -oX             | Enregistrer le résultat du scan dans un fichier au format XML                              |
| -p              | Spécifier les ports réseaux à scanner                                                      |
| -Pn             | Désactiver la découverte d’hôte                                                            |
| -r              | Analyser les ports consécutivement                                                         |
| -sT             | Faire un scan de port TCP                                                                  |
| -sU             | Faire un scan de port UDP                                                                  |
| -sV             | Trouver les versions du service                                                            |
| --script        | Utilise un script interne à nmap pour scan de vulnérabilité, bruteforce, etc                |
| -v              | Mode bavard                                                                                |
| -vv             | Mode très bavard                                                                           |
| -A              | Activer la détection du système d'exploitation, le scan de version et les scripts par défaut|
| -O              | Détecter le système d'exploitation                                                         |
| -sC             | Exécuter les scripts par défaut                                                            |
| -sP             | Faire un ping scan                                                                         |
| -F              | Faire un scan rapide (seulement les ports les plus courants)                               |
| -T<0-5>         | Définir le niveau d'agressivité du scan (par exemple, -T4 pour un scan plus rapide)         |
| -iL             | Lire les hôtes à scanner à partir d'un fichier                                             |
| --reason        | Afficher la raison pour laquelle un port est dans un état particulier                      |
| --version-intensity <niveau> | Régler l'intensité de la détection de version (de 0 à 9)                         |
| -oG             | Enregistrer le résultat du scan dans un fichier au format Grepable                         |
| -oA             | Enregistrer le résultat du scan dans tous les formats principaux (N, X, G)                 |
| -6              | Activer le scan IPv6                                                                       |


3) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## **Pré-requis techniques**

## **Installation et Configuration des équipements et ressources**

## **FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration**
