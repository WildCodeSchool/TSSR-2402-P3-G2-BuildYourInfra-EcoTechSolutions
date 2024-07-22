# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

##  **Sommaire**

1) Présentation du Projet et Objectifs finaux

2) Mise en contexte

3) Présentation des membres du groupe et rôles par Sprint

4) Choix techniques et contraintes

5) Difficultés rencontrées

6) Solutions et/ou alternatives trouvées pour palier aux problèmes

7) Next-step : Améliorations possibles envisagées

8) Conclusion

## **1. Présentation du Projet et Objectifs finaux**

Le Projet **_BuildYourInfra_** consiste, en partant de bases minimalistes, à créer une Infrastructure complète pour l'entreprise **_EcoTech Solutions_**.

Le projet est découpé en sprint d'une semaine et s'étalera sur 11 semaines.
Une présentation de l'avancement du projet sera donnée à chaque fin de sprint, avec une démonstration (dans le cas où cela est possible).
Le projet devra être finalisé et rendu pour le 25 juillet 2024, une présentation exceptionnelle aura lieu ce jour durant le _Demo Day_.

Les objectifs du projet seront évolutifs, et correspondront aux besoins de **_EcoTech Solutions_**.

Les objectifs seront donnés par sprint, ils devront être catégoriser par priorité à chaque début de sprint :
* Objectif principal : il doit être impérativement atteint à la fin du sprint.
* Objectif secondaire : il doit être reporté sur le sprint suivant si il n'est pas achevé, sa priorité sera alors ré-évaluée.
* Objectif optionnel : pas de priorité avérée, mais il devra être réalisé d'ici à la fin du projet.

La documentation jointe au Projet est constituée de différents fichiers (au format markdown), ainsi que d'un dossier dans lequel seront placés toutes les annexes.

Un dépôt GitHub a été créé à cet effet : [TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions)

Seront insérés dans le dépôt :
* un fichier README.md : documentation générale du projet.
* Un dossier Sxx par semaine de sprint contenant :
    * un fichier INSTALL.md par sprint (avec la nomenclature Sxx_INSTALL.md) : documentation administrateur.
    * un fichier USER_GUIDE.md par sprint (avec la nomenclature Sxx_USER_GUIDE.md) : documentation utilisateur.
    * un dossier _annex_ où seront placés le détail de la documentation administrateur et utilisateur
    * un dossier _ressource_ où seront placés toutes les images, scripts et autres supports.


## **2. Mise en contexte**

Notre société **_DANA-teC_** a été mandatée par l'entreprise **_EcoTech Solutions_** pour répondre à ses besoins en termes d'infrastructure réseau.

![](/S09/ressource/Ecotech_Logo.png)

**_EcoTech Solutions_**, basée à Bordeaux, est spécialisée dans le développement de solutions IoT (Internet des objets) pour la gestion intelligente de l'énergie et des ressources. En partenariat avec le gouvernement et les entreprises du secteur de l'énergie, elle déploie des systèmes de surveillance et de contrôle avancés pour optimiser l'utilisation des ressources naturelles, réduire les émissions de carbone et promouvoir la durabilité environnementale. Son expertise technologique et son engagement envers l'innovation en font un acteur clé dans la transition vers une économie verte.

Nous devons ainsi aider à la mise en place d'une infrastructure réseau complète, qui respectera les valeurs de **_EcoTech Solutions_**.

Cette infrastructure respectera également les [bonnes pratiques de la cybersécurité pour les TPE/TME](https://cyber.gouv.fr/publications/la-cybersecurite-pour-les-tpepme-en-treize-questions) publiées par l'ANSSI.

## **3. Présentation des membres du groupe et rôles par Sprint**

Le groupe du Projet **_BuildYourInfra_** est composé de :
* **Ahmed Ben Rebai**
* **Charles Caulier**
* **Damien Legay**
* **Anthony Javault**
* **Nicolas Maggiori**

### **S09 - Semaine du 23 au 30 Avril 2024**

|PO|SM|
|:-:|:-:|
|Ahmed Ben Rebai|Nicolas Maggiori|

Activités et répartitions des tâches

|                Tâches                 | Ahmed Ben Rebai | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :-------------: | :----------: | :-------------: | :--------------: |
|          Nomenclature de nom          |        x        |                 |              |        x        |        x         |
|          Listing du matériel          |                 |                 |      x       |        x        |        x         |
|        Plan d'adressage réseau        |        x        |                 |      x       |                 |        x         |
|      Plan schématique du réseau       |        x        |                 |      x       |                 |                  |
|         Création VM Serveurs          |                 |        x        |              |                 |        x         |
|           Création domaine            |                 |        x        |              |                 |                  |
|              Création OU              |                 |        x        |              |                 |                  |
|         Création Groups/Users         |                 |        x        |              |                 |                  |
|          Intégration dans AD          |                 |                 |              |                 |                  |
|        Préparation Scripts PS         |                 |                 |              |        x        |                  |
|             Documentation             |                 |        x        |      x       |        x        |        x         |
|    Préparation slides Présentation    |                 |                 |      x       |        x        |                  |
|             Présentation              |        x        |        x        |      x       |        x        |        x         |

### **S10 - Semaine du 13 au 17 Mai 2024**

|PO|SM|
|:-:|:-:|
|Anthony Javault|Damien Legay|

Activités et répartitions des tâches

|                Tâches                 | Ahmed Ben Rebai | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :-------------: | :----------: | :-------------: | :--------------: |
|    Serveur Maximus : DHCP/DNS/AD-DS   |        x        |                 |      x       |                 |                  |
|     Serveur Moldaver : AD en core     |                 |        x        |              |                 |        x         |
|      Création du Client de test       |                 |                 |      x       |                 |                  |
| Réplication entre Maximus et Moldaver |                 |        x        |      x       |                 |        x         |
|      Gestion de l'arborescence AD     |        x        |        x        |      x       |        x        |        x         |
|             Documentation             |                 |                 |              |        x        |                  |
|    Préparation slides Présentation    |                 |                 |      x       |                 |                  |
|             Présentation              |        x        |        x        |      x       |        x        |        x         |

### **S11 - Semaine du 21 au 24 Mai 2024**

|PO|SM|
|:-:|:-:|
|Charles Caulier|Ahmed Ben Rebai|

Activités et répartitions des tâches

|                Tâches                 | Ahmed Ben Rebai | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :-------------: | :----------: | :-------------: | :--------------: |
|      Création d'un serveur SSH        |                 |                 |              |        x        |                  |
|      Création d'un serveur GLPI       |                 |                 |              |                 |        x         |
|    Mise en place de GPO de Sécurité   |                 |                 |              |                 |                  |
|     Mise en place de GPO standard     |        x        |                 |              |                 |                  |
|      Automatisation AD par Script     |                 |        x        |      x       |        x        |                  |
|             Documentation             |        x        |                 |      x       |        x        |        x         |
|    Préparation slides Présentation    |                 |                 |              |                 |                  |
|             Présentation              |        x        |        x        |      x       |        x        |        x         |

### **S12 - Semaine du 27 au 31 Mai 2024**

|PO|SM|
|:-:|:-:|
|Nicolas Maggiori|Anthony Javault|

Activités et répartitions des tâches

|                Tâches                 | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :----------: | :-------------: | :--------------: |
|               FIREWALL                |                 |      x       |                 |       x          |
|           Gestion ID de VM            |                 |      x       |                 |                  |
|       Règles de bonnes pratiques      |                 |              |                 |       x          |
|       Mise en place du "Deny All"     |                 |              |                 |       x          |
|              Routeur Vyos             |        x        |              |       x         |                  |
|   Gestion de la télémétrie par GPO    |                 |              |                 |                  |
|          Automatisation GLPI          |        x        |              |                 |                  |
|             Documentation             |        x        |      x       |        x        |        x         |
|    Préparation slides Présentation    |                 |              |                 |                  |
|             Présentation              |        x        |      x       |        x        |        x         |

### **S13 - Semaine du 3 au 7 Juin 2024**

|PO|SM|
|:-:|:-:|
|Damien Legay|Charles Caulier|

Activités et répartitions des tâches

|                Tâches                 | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :----------: | :-------------: | :--------------: |
|      Gestion de la Télémétrie         |                 |              |                 |        x         |
|          Dossiers Partagés            |        x        |      x       |                 |                  |
|    Serveur GLPI (Synchro AD & Parc)   |                 |      x       |                 |                  |
|           Stockage Avancé             |                 |      x       |        x        |        x         |
|             Sauvegarde                |                 |              |                 |        x         |
|                LAPS                   |                 |              |                 |        x         |
|  Déplacement des machines dans l'AD   |                 |              |        x        |                  |
| Restriction utilisation des machines  |                 |              |                 |        x         |
|             Documentation             |        x        |      x       |        x        |        x         |
|    Préparation slides Présentation    |        x        |      x       |        x        |        x         |
|             Présentation              |        x        |      x       |        x        |        x         |

### **S14 - Semaine du 10 au 14 Juin 2024**

|PO|SM|
|:-:|:-:|
|Damien Legay|Nicolas Maggiori|

Activités et répartitions des tâches

|                Tâches                 | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :----------: | :-------------: | :--------------: |
|     Supervision Prometeus Grafana     |                 |              |                 |        x         |
|        Journalisation CMTrace         |        x        |              |        x        |                  |
|   AD : Intégration des utilisateurs   |                 |      x       |        x        |                  |
|             Documentation             |        x        |      x       |        x        |        x         |
|    Préparation slides Présentation    |        x        |      x       |        x        |        x         |
|             Présentation              |        x        |      x       |        x        |        x         |

### **S15 - Semaine du 17 au 21 Juin 2024**

|PO|SM|
|:-:|:-:|
|Charles Caulier|Damien Legay|

Activités et répartitions des tâches

|                Tâches                 | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :----------: | :-------------: | :--------------: |
|            Messagerie                 |        x        |              |                 |        x         |
|        Sécurité : Bitwarden           |                 |              |        x        |                  |
|             Redmine                   |                 |      x       |                 |                  |
|          Tiering model                |                 |      x       |                 |                  |
|         Test vulnérabilité            |                 |      x       |                 |                  |
|            Guacamole                  |                 |              |                 |        x         |
|            Documentation              |        x        |      x       |        x        |        x         |
|    Préparation slides Présentation    |        x        |      x       |        x        |        x         |
|            Présentation               |        x        |      x       |        x        |        x         |

### **S16 - Semaine du 24 au 28 Juin 2024**

|PO|SM|
|:-:|:-:|
|Nicolas Maggiori|Anthony Javault|

Activités et répartitions des tâches

|                Tâches                 | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :----------: | :-------------: | :--------------: |
|           Sécurité : WSUS             |                 |      x       |                 |                  |
|           AD - Rôles FSMO             |        x        |              |                 |                  |
|       Partenariat BILLU - VPN         |                 |              |        x        |                  |
|     Partenariat BILLU - Firewall      |                 |              |                 |        x         |
|             Documentation             |        x        |      x       |        x        |        x         |
|    Préparation slides Présentation    |        x        |      x       |        x        |        x         |
|             Présentation              |        x        |      x       |        x        |        x         |

### **S17 - Semaine du 1 au 05 Juillet 2024**

|PO|SM|
|:-:|:-:|
|Damien Legay|Charles Caulier|

Activités et répartitions des tâches

|                Tâches                 | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :----------: | :-------------: | :--------------: |
|                VoIP                   |                 |              |        x        |                  |
|             Serveur Web               |                 |              |                 |        x         |
|       Partenariat BILLU - AD          |                 |      x       |                 |                  |
|   Partenariat BILLU - Supervision     |                 |              |                 |        x         |
|     Partenariat BILLU - Stockage      |        x        |              |                 |                  |
|               Ansible                 |                 |      x       |                 |                  |
|             Documentation             |        x        |      x       |        x        |        x         |
|    Préparation slides Présentation    |        x        |      x       |        x        |        x         |
|             Présentation              |        x        |      x       |        x        |        x         |

### **S18 - Semaine du 8 au 12 Juillet 2024**

|PO|SM|
|:-:|:-:|
|Charles Caulier|Nicolas Maggiori|

Activités et répartitions des tâches

|                Tâches                 | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :----------: | :-------------: | :--------------: |
|      Plan de Reprise d'Activité       |        x        |              |        x        |        x         |
|              BloodHound               |                 |              |                 |        x         |
|              PingCastle               |        x        |              |                 |                  |
|         Partenariat - OpenVPN         |                 |              |        x        |                  |
|             Documentation             |        x        |              |        x        |        x         |
|    Préparation slides Présentation    |        x        |              |        x        |        x         |
|             Présentation              |        x        |              |        x        |        x         |

### **S19 - Semaine du 15 au 19 Juillet 2024**

|PO|SM|
|:-:|:-:|
|Nicolas Maggiori|Damien Legay|

Activités et répartitions des tâches

|                Tâches                 | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :----------: | :-------------: | :--------------: |
|  Utilisation d'une machine d'attaque  |        x        |              |                 |        x         |
|                 Snort                 |                 |              |                 |                  |
|     Compte-rendu de fin de projet     |                 |              |        x        |                  |
|                                       |                 |              |                 |                  |
|             Documentation             |        x        |      x       |        x        |        x         |
|    Préparation slides Présentation    |        x        |      x       |        x        |        x         |
|             Présentation              |        x        |      x       |        x        |        x         |

### **S20 - Semaine du 22 au 26 Juilet 2024**

|PO|SM|
|:-:|:-:|
|||

Activités et répartitions des tâches

|                Tâches                 | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :----------: | :-------------: | :--------------: |
|                Demo Day               |        x        |      x       |        x        |        x         |
|                                       |                 |              |                 |                  |
|             Documentation             |        x        |      x       |        x        |        x         |
|    Préparation slides Présentation    |        x        |      x       |        x        |        x         |
|             Présentation              |        x        |      x       |        x        |        x         |

## **4. Choix techniques et contraintes**

### Les matériels et leurs rôles

1) **ECO-Maximus**
    * Template : `Windows Server 2022` / Type : `VM`.
    * Configuration IP : `10.10.8.100/25` / Passerelle : `10.10.255.254` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 100GO` (Système + Dossiers Partagés) / `1 HDD 100GO` (RAID1) / `1 HDD 100Go` (Backup).
    * Processeur : `2`.
    * RAM : `8Go`.
    * Fonction : `DHCP` / `DNS` / `ADDS`.

2) **ECO-Moldaver**
    * Template : `Windows Server 2022 Core` / Type : `VM`.
    * Configuration IP : `10.10.8.120/25` / Passerelle : `10.10.255.254` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 32Go` (Système) / `1 HDD 32GO` (RAID1).
    * Processeur : `2`.
    * RAM : `2Go`.
    * Fonction : `DNS` / `ADDS`.

3) **ECO-Titus**
    * Template : `Windows Server 2022 Core` / Type : `VM`.
    * Configuration IP : `10.10.8.121/25` / Passerelle : `10.10.255.254` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 32Go` (Système) / `1 HDD 32GO` (RAID1).
    * Processeur : `2`.
    * RAM : `2Go`.
    * Fonction : `DNS` / `ADDS`.

4) **ECO-Lucy**
    * Template : `Debian 12` / Type : `VM`.
    * Configuration IP : `10.10.8.50/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 32GO` (Système) / `1 HDD 32GO` (RAID1) / `1 HDD 32Go` (Backup).
    * Processeur : `2`.
    * RAM : `8Go`.
    * Fonction : `SSH` / `GLPI`.

5) **ECO-FW-01**
    * Template : `PFSense` / Type : `VM`.
    * Configuration IP (WAN) : `10.0.0.3/24` / Carte réseau : `vmbr1`.
    * Configuration IP (LAN) : `10.10.255.254/16` / Carte réseau : `vmbr6`.
    * Configuration IP (DMZ) : `10.11.0.1/16` / Carte réseau : `vmbr7`.
    * Configuration IP (LANv2) : `10.20.255.254/16` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 6GO` (Système).
    * Processeur : `1`.
    * RAM : `2Go`.
    * Fonction : `PFSense`.

6) **ECO-ROOT-01**
    * Template : `Vyos` / Type : `VM`.
    * Configuration IP : `10.10.8.10/29` / Carte réseau : `vmbr6`.
    * Configuration IP : `10.10.8.254/25` / Carte réseau : `vmbr6`.
    * Configuration IP : `10.10.9.126/25` / Carte réseau : `vmbr6`.
    * Configuration IP : `10.10.11.126/25` / Carte réseau : `vmbr6`.
    * Configuration IP : `10.10.11.254/25` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 4GO` (Système).
    * Processeur : `1`.
    * RAM : `1Go`.
    * Fonction : `Vyos`.

7) **ECO-ROOT-02**
    * Template : `Vyos` / Type : `VM`.
    * Configuration IP : `10.10.8.20/29` / Carte réseau : `vmbr6`.
    * Configuration IP : `10.10.9.254/25` / Carte réseau : `vmbr6`.
    * Configuration IP : `10.10.10.126/25` / Carte réseau : `vmbr6`.
    * Configuration IP : `10.10.10.254/25` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 4GO` (Système).
    * Processeur : `1`.
    * RAM : `1Go`.
    * Fonction : `Vyos`.

8) **ECO-ROOT-03**
    * Template : `Vyos` / Type : `VM`.
    * Configuration IP : `10.10.8.30/16` / Carte réseau : `vmbr6`.
    * Configuration IP : `10.10.8.126/25` / Carte réseau : `vmbr6`.
    * Configuration IP : `10.10.8.11/29` / Carte réseau : `vmbr6`.
    * Configuration IP : `10.10.8.21/29` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 4GO` (Système).
    * Processeur : `1`.
    * RAM : `1Go`.
    * Fonction : `Vyos`.

9) **CanigouGrafana**
    * Template : `CT Debian 12` / Type `CT`.
    * Configuration IP : `10.10.8.113/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 25Go` (Système).
    * Processeur : `2`.
    * RAM : `512Mo`.
    * Fonction : `Grafana`.

10) **TychoProm**
    * Template : `CT Debian 12` / Type `CT`.
    * Configuration IP : `10.10.8.114/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 20Go` (Système).
    * Processeur : `2`.
    * RAM : `512Mo`.
    * Fonction : `Prometheus`.

11) **IanMail**
    * Template : `CT Debian 12` / Type `CT`.
    * Configuration IP : `10.10.8.116/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 20Go` (Système).
    * Processeur : `1`.
    * RAM : `2Go`.
    * Fonction : `IRedMail`.

12) **Tandy**
    * Template : `CT Debian 12` / Type `CT`.
    * Configuration IP : `10.10.8.118/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 30Go` (Système).
    * Processeur : `2`.
    * RAM : `3Go`.
    * Fonction : `Redmine`.

13) **ECO-KaliTest**
    * Template : `Kali Linux` / Type `VM`.
    * Configuration IP : `10.10.200.50/16` / Passerelle : `10.0.8.100` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 100Go` (Système).
    * Processeur : `4`.
    * RAM : `4Go`.
    * Fonction : `Pentest KaliLinux`.

14) **ECO-ChefGoule**
    * Template : `Debian 12` / Type `VM`.
    * Configuration IP : `10.11.0.2/16` / Passerelle : `10.11.0.1` / Carte réseau : `vmbr7`.
    * Hard Disk : `1 HDD 16Go` (Système).
    * Processeur : `2`.
    * RAM : `4Go`.
    * Fonction : `Apache Guacamole`.

15) **KatjaBit**
    * Template : `CT Debian 12` / Type `CT`.
    * Configuration IP : `10.10.8.117/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 25Go` (Système).
    * Processeur : `4`.
    * RAM : `4Go`.
    * Fonction : `Bitwarden`.

16) **ECO-Dane**
    * Template : `RedHat` / Type : `VM`.
    * Configuration IP : `10.10.8.51/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 32Go` (Système).
    * Processeur : `2`.
    * RAM : `4Go`.
    * Fonction : `FreePBX`.

17) **PorcaMiseria**
    * Template : `CT Debian 12` / Type : `CT`.
    * Configuration IP : `10.11.0.8/16` / Passerelle : `10.11.0.1` / Carte réseau : `vmbr7`.
    * Hard Disk : `1 HDD 8Go` (Système).
    * Processeur : `2`.
    * RAM : `2Go`.
    * Fonction : `Apache`.

18) **MacLeanAnsi**
    * Template : `CT Debian 12` / Type : `CT`.
    * Configuration IP : `10.10.8.104/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 32Go` (Système).
    * Processeur : `2`.
    * RAM : `4Go`.
    * Fonction : `Ansible`.

19) **ECO-Puntu**
    * Template : `VM Unbuntu 24.04` / Type : `VM`.
    * Configuration IP : `10.10.8.55/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 32Go` (Système).
    * Processeur : `1`.
    * RAM : `4Go`.
    * Fonction : `Snort`.

20) **ECO-LP-001**
    * Template : `VM Windows 10` / Type : `VM`.
    * Configuration IP : `10.10.8.3/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 50Go` (Système).
    * Processeur : `2`.
    * RAM : `4Go`.
    * Fonction : `Client`.

21) **ECO-LP-002**
    * Template : `VM Windows 10` / Type : `VM`.
    * Configuration IP : `10.10.8.7/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 50Go` (Système).
    * Processeur : `2`.
    * RAM : `4Go`.
    * Fonction : `Client`.

22) **ECO-Biscotto**
    * Template : `VM Unbuntu 24.04` / Type : `VM`.
    * Configuration IP : `10.10.8.56/25` / Passerelle : `10.10.8.100` / Carte réseau : `vmbr6`.
    * Hard Disk : `1 HDD 32Go` (Système).
    * Processeur : `1`.
    * RAM : `4Go`.
    * Fonction : `Snort`.

## **5. Difficultés rencontrées**

## **6. Solutions et/ou alternatives trouvées pour palier aux problèmes**

## **7. Next-step : Améliorations possibles envisagées**

## **8. Conclusion**

Vous trouverez le compte-rendu de fin de projet en annexe [Report](./S20/annex/Report.md) comprenant le schéma de l'infrastructure mis à jour, ainsi qu'un tableau de synthèse sur les matériels et un sur la documentation.