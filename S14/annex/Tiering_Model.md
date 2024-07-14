# Objectif personnalisé : Mise en place du Tiering Model

## Sommaire

1) 

2) 

##

Dans un premier temps, nous avons créé des OU(unité d’organisation) : 

![](/S14/ressource/admin_tier/AdminTier1.png)

Ensuite, nous avons créé des groupes ainsi que des comptes spécifiques et nominatifs pour les employés du département DSI.

![](/S14/ressource/admin_tier/AdminTier2.png)

Par la suite, nous avons commencé à créer des GPO (Group Policy Objects) pour chaque niveau avec des règles spécifiques :

![](/S14/ressource/admin_tier/AdminTier3.png)

Listes des règles : 

1. Tier 0 :

- Stratégie de Mot de Passe :

    - Longueur minimale du mot de passe : 15 caractères
    - Complexité du mot de passe : activée
    - Historique des mots de passe : 24 derniers mots de passe
    - Durée de vie maximale du mot de passe : 60 jours
    - Durée de vie minimale du mot de passe : 1 jour

- Stratégie de Verrouillage de Compte :

    - Seuil de verrouillage de compte : 5 tentatives échouées
    - Durée du verrouillage de compte : 30 minutes
    - Réinitialiser le compteur de verrouillage de compte après : 30 minutes

- Configurez les paramètres d'audit comme suit :

     - Audit des accès aux objets :
        Réussite et Échec

     - Audit des changements de politique d’audit :
        Réussite et Échec

     - Audit des modifications de compte d’utilisateur :
        Réussite et Échec

     - Audit des événements de connexion :
        Réussite et Échec

     - Audit des événements de déconnexion :
        Réussite

     - Audit des événements d'accès au service d'annuaire (si applicable) :
        Réussite et Échec

     - Audit des privilèges d'utilisateur :
        Réussite et Échec

2. Tier 1 :

  - Stratégie de Mot de Passe :

     - Longueur minimale du mot de passe : 12 caractères
     - Complexité du mot de passe : activée
     - Historique des mots de passe : 12 derniers mots de passe
     - Durée de vie maximale du mot de passe : 90 jours
     - Durée de vie minimale du mot de passe : 1 jour

  - Stratégie de Verrouillage de Compte :

     - Seuil de verrouillage de compte : 6 tentatives échouées
     - Durée du verrouillage de compte : 15 minutes
     - Réinitialiser le compteur de verrouillage de compte après : 15 minutes

  - Stratégie d’Audit :

     - Audit de connexion réussie et échouée
     - Audit des modifications de compte d’utilisateur réussies et échouées

3. Tier 2 (Accès administrateur à des systèmes moins critiques) :

  - Stratégie de Mot de Passe :

     - Longueur minimale du mot de passe : 10 caractères
     - Complexité du mot de passe : activée
     - Historique des mots de passe : 6 derniers mots de passe
     - Durée de vie maximale du mot de passe : 180 jours
     - Durée de vie minimale du mot de passe : 1 jour

  - Stratégie de Verrouillage de Compte :

     - Seuil de verrouillage de compte : 8 tentatives échouées
     - Durée du verrouillage de compte : 10 minutes
     - Réinitialiser le compteur de verrouillage de compte après : 10 minutes

  - Stratégie d’Audit :

     - Audit de connexion réussie et échouée

**Bien sûr, nous n'avons pas encore terminé la mise en place de cela. Nous commençons petit à petit à établir de bonnes pratiques dans l'Active Directory pour maximiser la sécurité du domaine.**