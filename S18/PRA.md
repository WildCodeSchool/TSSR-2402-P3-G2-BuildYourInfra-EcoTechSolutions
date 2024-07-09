# PRA (Plan de Reprise d'Activité)

## 1. Évaluation :

INFRASTRUCTURE RÉSEAU HS !

Suite à un problème électrique certains éléments de l'infrastructure ne fonctionnent plus.
Le MCO (*Maintient en Condition Opérationnelle*) n'est plus valide.

En conséquence, Le **PRA** est considéré comme objectif **obligatoire** et prioritaires sur les autres objectifs.

### a. Identification des élément critiques HS

| Matériel | Adresse IP | Rôle / Fonction | État | Priorité |
|:-:|:-:|:-:|:-:|:-:|
| ECO-Moldaver | 10.10.8.120/16 | Serveur Windows Core - Réplication ADDS / DC - Rôle FSMO | Hors Service | Critical |
| ECO-Titus | 10.10.8.121/16 | Serveur Windows Core - Replication ADDS / DC - Rôle FSMO | Hors Service | Critical |
| ECO-ROOT-01 | 5 cartes réseaux | Routeur Vyos | Hors Service | High |
| ECO-LP-001 | DHCP | Client Windows 10 Pro | Hors Service | Medium |
| ECO-LP-002 | DHCP | Client Windows 10 Pro | Hors Service | Medium |
| IanMail | 10.10.8.116/16 | CT IRedMail | Dysfonctionnel | High |

### b. Documentation des dommages subies

* Les deux Serveurs ECO-Moldaver et ECO-Titus ont subi d'importants dommages et sont de ce fait inutilisables. Ces serveurs étant nécessaires au bon fonctionnement de l'infrastructure, ils seront la priorité principale du PRA.

* Le Router Vyos ECO-ROOT-01 n'a pas supporté le problème électrique, il est par conséquent inutilisable, son remplacement est nécessaire avec une priorité _Elevée_.

* Deux ordinateurs Client ECO-LP-001 et ECO-LP-002 sont désormais inutilisables, leur remplacement est nécessaire avec une pririté _Moyenne_.

* Le Container IanMail n'est plus connecté au réseau, sa carte réseau a grillé, le remplacement de celle-ci est nécessaire avec une priorité _Elevée_.

## 2. Identification : 

### a. Priorisation des services à rétablir en priorité

| Niveau | Priorité | Action |
| :-: | :-: | :-: |
| 1 | Critical | Remplacement des 2 Serveurs ECO-Moldaver et ECO-Titus |
| 2 | High | Remplacement du Routeur manquant - Configuration pour le Container Mail |
| 3 | Medium | Remplacement des 2 oridnateurs Client |

### b. Listing des tâches pour chaque priorisation

Priorité **Critical** :

* Réinstallation des 2 Serveurs sur la base du template Windows Core fourni.
* Facilitation avec le script _Scrit_serverCore.ps1_ (pensez à adapter le fichier de configuration _Config_Server_Core.csv_).
* Récupération du rôle Active Directory Domain Services sur les 2 serveurs pour la Réplication.
* Récupération du status Domain Controller pour les 2 Serveurs.
* Partage des rôles FSMO : PDC sur ECO-Titus, RID Master sur ECO-Moldaver, ECO-Maximus conserve les autres rôles.
* Vérification du bon fonctionnement.

Priorité **High** :

* Réinstallation du Routeur sur la base du template Vyos fourni.
* Ajout de 5 cartes réseaux correspondant aux 5 interfaces nécessaires.
* Configuration des interfaces réseaux.
* Configuration du Routage Réseau.
* Vérification du bon fonctionnement

Priorité **High** :

* Remplacement de la carté réseau défectueuse sur IanMail
* Redémarrage du service
* Vérification du bon fonctionnement.

Priorité **Medium** : 

* Remplacement des 2 ordinateurs Client.
* Réinsertion des Clients dans le domaine.
* Vérification du bon fonctionnement.
* Vérification de l'application des GPO.

## 3. Réparation :

### a. Réparation des éléments

| Matériel | Adresse IP | Rôle / Fonction | État | Date |
|:-:|:-:|:-:|:-:|:-:|
| ECO-Moldaver | 10.10.8.120/16 | Serveur Windows Core - Réplication ADDS / DC - Rôle FSMO | Opérationnel | 08/07/2024 |
| ECO-Titus | 10.10.8.121/16 | Serveur Windows Core - Replication ADDS / DC - Rôle FSMO | Opérationnel | 08/07/2024 |
| ECO-ROOT-01 | 5 cartes réseaux | Routeur Vyos | Opérationnel | 08/07/2024 |
| ECO-LP-001 | DHCP | Client Windows 10 Pro | Opérationnel | 08/07/2024 |
| ECO-LP-002 | DHCP | Client Windows 10 Pro | Opérationnel | 08/07/2024 |
| IanMail | 10.10.8.116/16 | CT IRedMail | Opérationnel | 08/07/2024 |

### b. Vérification que le statut de chaque élément est opérationnel

La réactivité de notre équipe et la documentation mise en place depuis le début du projet ont participé au retour rapide à la normale.

L'infrastructure est de nouveau opérationnelle, mais une surveillance est nécessaire, afin de déterminer si un point a été omis ou non.

## 4. Documentation :

### a. Création de document si non-existant

### b. Mise à jour des documents si ce n'était pas le cas

La documenation disponible sur le dépôt GitHub est dans l'ensemble complète, il est toutefois difficile de retrouver un point en particulier, il sera probablement nécessaire de procéder à un référencement (type index).

