# Gestion de projet / suivi de tâches avec **Redmine**

## Sommaire

1) Installation de Redmine

2) Configuration de Redmine

## Installation

Nous avons déployé un template Turnkey sur Proxmox afin de disposer des outils nécessaires à l'installation de Redmine. Premièrement, nous devons définir les mots de passe pour la base de données et pour l'administrateur.

![](/S15/ressource/redmine/redmine1.png)

Ensuite nous rentrons l'adresse mail de l'admin

![](/S15/ressource/redmine/redmine2.png)

Puis nous allons "skip" les deux prochains encadrés

![](/S15/ressource/redmine/redmine3.png)

![](/S15/ressource/redmine/redmine4.png)

Ensuite, nous lançons l'installation.

![](/S15/ressource/redmine/redmine5.png)

Normalement, nous devrions obtenir l'interface suivante

![](/S15/ressource/redmine/redmine6.png)

## Configuration

Nous allons maintenant nous connecter à l'interface web de Redmine à l'aide du compte administrateur.

- identifiant : admin
- mot de passe : Azerty1*

Une fois sur la page d'administration de Redmine, nous cliquons sur le menu "Administration" situé en haut à gauche de l'écran.

Maintenant, nous allons pouvoir synchroniser notre annuaire Active Directory dans la section "Authentification LDAP".

![](/S15/ressource/redmine/redmine9.png)

Puis, nous cliquons sur "Nouveau mode d'authentification"

![](/S15/ressource/redmine/redmine10.png)

Nous remplissons les champs avec les informations appropriées, comme indiqué ci-dessous, puis nous cliquons sur le bouton "Sauvegarder" pour enregistrer les modifications.

![](/S15/ressource/redmine/redmine7.png)

À présent, nous pouvons effectuer un test pour vérifier si tout fonctionne correctement.

![](/S15/ressource/redmine/redmine8.png)

Maintenant, nous allons ajouter de nouveaux utilisateurs.

Pour ce faire, nous nous rendons dans la section "Utilisateurs" du menu d'administration, puis nous cliquons sur le bouton "Nouvel utilisateur".

![](/S15/ressource/redmine/redmine11.png)

En saisissant les identifiants enregistrés dans l'annuaire Active Directory, nous pouvons retrouver l'utilisateur ciblé.

![](/S15/ressource/redmine/redmine12.png)

![](/S15/ressource/redmine/redmine14.png)

Maintenant nous allons voir comment créer un projet

![](/S15/ressource/redmine/redmine15.png)

cliquons "nouveau projet"

![](/S15/ressource/redmine/redmine16.png)

Remplisson le projet

![](/S15/ressource/redmine/redmine17.png)

Ajoutons des membres 

![](/S15/ressource/redmine/redmine18.png)

"nouveau membre"

![](/S15/ressource/redmine/redmine19.png)

Sélectionnons les utilisateurs concernés en cochant les cases correspondantes.

![](/S15/ressource/redmine/redmine20.png)

![](/S15/ressource/redmine/redmine21.png)

Maintenant, nous allons voir comment créer un forum.

Pour ce faire, nous nous rendons dans la section "Configuration" du menu d'administration, puis nous cliquons sur le bouton "Nouveau forum". Nous entrons ensuite les informations requises dans les champs appropriés, puis nous cliquons sur le bouton "Créer" pour créer le forum.

![](/S15/ressource/redmine/redmine22.png)

![](/S15/ressource/redmine/redmine23.png)

![](/S15/ressource/redmine/redmine24.png)