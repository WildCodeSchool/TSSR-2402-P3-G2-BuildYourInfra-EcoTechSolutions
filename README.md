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
* un fichier INSTALL.md par sprint (avec la nomenclature Sxx_INSTALL.md) : documentation administrateur.
* un fichier USER_GUIDE.md par sprint (avec la nomenclature Sxx_USER_GUIDE.md) : documentation utilisateur.
* un dossier _ressource_ où seront placés toutes les annexes (images, scripts,...).

## **2. Mise en contexte**

Notre société **_DANA-teC_** a été mandatée par l'entreprise **_EcoTech Solutions_** pour répondre à ses besoins en termes d'infrastructure réseau.

![](./ressource/S09/images/Ecotech_Logo.png)

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
| Création & configuration Serveur GLPI |                 |                 |              |                 |        x         |
|  Création des GPO de Sécurité         |                 |                 |      x       |                 |                  |
|  Création des GPO Standard            |       x         |                 |              |                 |                  |
|  Création VM Debian sur le domaine AD et accessible en SSH |     |    x   |              |                 |                  |
|  Scripting Automatisation pour l'AD   |                 |        x        |      x       |        x        |                  |
|  Intégration des données dans l'AD    |                 |                 |              |                 |                  |
|             Documentation             |                 |                 |              |                 |                  |
|    Préparation slides Présentation    |                 |                 |              |                 |                  |
|             Présentation              |        x        |        x        |      x       |        x        |        x         |

### **S12 - Semaine du 27 au 31 Mai 2024**

|PO|SM|
|:-:|:-:|
|||

Activités et répartitions des tâches

|                Tâches                 | Ahmed Ben Rebai | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :-------------: | :----------: | :-------------: | :--------------: |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|             Documentation             |                 |                 |              |                 |                  |
|    Préparation slides Présentation    |                 |                 |              |                 |                  |
|             Présentation              |        x        |        x        |      x       |        x        |        x         |

### **S13 - Semaine du 3 au 7 Juin 2024**

|PO|SM|
|:-:|:-:|
|||

Activités et répartitions des tâches

|                Tâches                 | Ahmed Ben Rebai | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :-------------: | :----------: | :-------------: | :--------------: |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|             Documentation             |                 |                 |              |                 |                  |
|    Préparation slides Présentation    |                 |                 |              |                 |                  |
|             Présentation              |        x        |        x        |      x       |        x        |        x         |

### **S14 - Semaine du 10 au 14 Juin 2024**

|PO|SM|
|:-:|:-:|
|||

Activités et répartitions des tâches

|                Tâches                 | Ahmed Ben Rebai | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :-------------: | :----------: | :-------------: | :--------------: |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|             Documentation             |                 |                 |              |                 |                  |
|    Préparation slides Présentation    |                 |                 |              |                 |                  |
|             Présentation              |        x        |        x        |      x       |        x        |        x         |

### **S15 - Semaine du 17 au 21 Juin 2024**

|PO|SM|
|:-:|:-:|
|||

Activités et répartitions des tâches

|                Tâches                 | Ahmed Ben Rebai | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :-------------: | :----------: | :-------------: | :--------------: |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|             Documentation             |                 |                 |              |                 |                  |
|    Préparation slides Présentation    |                 |                 |              |                 |                  |
|             Présentation              |        x        |        x        |      x       |        x        |        x         |

### **S16 - Semaine du 24 au 28 Juin 2024**

|PO|SM|
|:-:|:-:|
|||

Activités et répartitions des tâches

|                Tâches                 | Ahmed Ben Rebai | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :-------------: | :----------: | :-------------: | :--------------: |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|             Documentation             |                 |                 |              |                 |                  |
|    Préparation slides Présentation    |                 |                 |              |                 |                  |
|             Présentation              |        x        |        x        |      x       |        x        |        x         |

### **S17 - Semaine du 1 au 05 Juillet 2024**

|PO|SM|
|:-:|:-:|
|||

Activités et répartitions des tâches

|                Tâches                 | Ahmed Ben Rebai | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :-------------: | :----------: | :-------------: | :--------------: |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|             Documentation             |                 |                 |              |                 |                  |
|    Préparation slides Présentation    |                 |                 |              |                 |                  |
|             Présentation              |        x        |        x        |      x       |        x        |        x         |

### **S18 - Semaine du 8 au 12 Juillet 2024**

|PO|SM|
|:-:|:-:|
|||

Activités et répartitions des tâches

|                Tâches                 | Ahmed Ben Rebai | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :-------------: | :----------: | :-------------: | :--------------: |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|             Documentation             |                 |                 |              |                 |                  |
|    Préparation slides Présentation    |                 |                 |              |                 |                  |
|             Présentation              |        x        |        x        |      x       |        x        |        x         |

### **S19 - Semaine du 15 au 19 Juillet 2024**

|PO|SM|
|:-:|:-:|
|||

Activités et répartitions des tâches

|                Tâches                 | Ahmed Ben Rebai | Charles Caulier | Damien Legay | Anthony Javault | Nicolas Maggiori |
| :-----------------------------------: | :-------------: | :-------------: | :----------: | :-------------: | :--------------: |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|                                       |                 |                 |              |                 |                  |
|             Documentation             |                 |                 |              |                 |                  |
|    Préparation slides Présentation    |                 |                 |              |                 |                  |
|             Présentation              |        x        |        x        |      x       |        x        |        x         |

## **4. Choix techniques et contraintes**

## **5. Difficultés rencontrées**

## **6. Solutions et/ou alternatives trouvées pour palier aux problèmes**

## **7. Next-step : Améliorations possibles envisagées**

## **8. Conclusion**
