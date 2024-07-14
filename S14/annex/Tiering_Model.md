# Objectif personnalisé : Mise en place du Tiering Model

## Sommaire

1) Première approche du Tiering Model

2) Approche avancée

3) Approche confirmée

## Première approche du Tiering Model

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

## Approche avancée

Dans notre cas, avec une seule forêt et une OU France contenant l'ensemble de notre société, voici la structure de hiérarchisation :

### Tier 0 : Forêt et Domaine

OU = EcoT_Tier0
Placé au même niveau que la le contrôleur de domaine
Contient:
Contrôleurs de domaine
Serveurs de gestion privilégiés (bastions)
Rôles: Administrateurs de forêt et de domaine

---

### Tier 1 : Unités d'organisation critiques

OU: EcoT_Tier1
Contient:
OU Admin (comptes administrateurs locaux)
OU Secure (comptes à privilèges élevés)
OU User (comptes utilisateurs standard)
OU Computer (ordinateurs)
Rôles: Administrateurs de domaine et administrateurs locaux privilégiés

Mise en place de GPO(Group Policy Object)

Configuration des audits pour le Tier 1

Nom de la GPO : GPO_Tier1AUdit

Objectif : Suivre les activités administratives critiques, les modifications de configuration, et les accès aux ressources pour détecter et réagir aux comportements anormaux ou non conformes.

Étapes :

  - Naviguer vers la configuration de l’audit avancé :
        Allez à : Computer Configuration > Policies > Windows Settings > Security Settings > Advanced Audit Policy Configuration.

Configurations recommandées :

  - Audit account logon events :
        Success, Failure : Auditez les événements de connexion aux comptes pour détecter les tentatives de connexion réussies et échouées sur les serveurs et ressources Tier 1.

  - Audit logon events :
        Success, Failure : Auditez les événements de connexion pour surveiller les connexions locales et à distance réussies et échouées sur les serveurs Tier 1.

  - Audit object access :
        Success, Failure : Auditez les accès aux objets pour identifier les tentatives d'accès réussies et échouées aux fichiers, dossiers, et autres objets critiques sur les serveurs Tier 1.

  - Audit process tracking :
        Success, Failure : Auditez les événements liés à la création et à la fin des processus pour surveiller les activités des applications et détecter les comportements suspects sur les serveurs Tier 1.

  - Audit policy change :
        Success, Failure : Auditez les modifications des politiques de sécurité pour surveiller les changements non autorisés sur les serveurs et ressources Tier 1.

  - Audit privilege use :
        Success, Failure : Auditez l'utilisation des privilèges pour surveiller les actions nécessitant des droits élevés sur les serveurs Tier 1.

  - Audit system events :
        Success, Failure : Auditez les événements système critiques, comme les démarrages, les arrêts et les redémarrages des systèmes Tier 1.

Configuration des Mots de passe pour le Tier 1

Nom de la GPO : GPO_Tier1MDP

Configuration des politiques de mot de passe pour le Tier 1

Étapes :

  - Ouvrir la console de gestion des stratégies de groupe (GPMC) :
        Tapez gpmc.msc dans le menu Démarrer et appuyez sur Entrée pour ouvrir la console de gestion des stratégies de groupe.

  - Créer ou modifier une GPO :
        Créez une nouvelle GPO dédiée aux comptes Tier 1 ou modifiez une GPO existante applicable aux OU contenant les comptes et ressources Tier 1.

  - Naviguer vers les politiques de mot de passe :
        Allez à : Computer Configuration > Policies > Windows Settings > Security Settings > Account Policies > Password Policy.

Configurations recommandées :

  - Password must meet complexity requirements :
        Activez cette option pour exiger des mots de passe complexes.
        Un mot de passe complexe doit contenir des caractères de trois des quatre catégories suivantes : majuscules, minuscules, chiffres, et symboles.

  - Minimum password length :
        Définissez la longueur minimale du mot de passe à 12 caractères. Cela augmente la difficulté de craquer les mots de passe par force brute.

  - Maximum password age :
        Définissez la durée maximale pendant laquelle un mot de passe peut être utilisé à 60 jours. Cela force les utilisateurs à changer régulièrement leurs mots de passe, limitant la fenêtre d'exposition d'un mot de passe compromis.

  - Minimum password age :
        Définissez la durée minimale pendant laquelle un mot de passe doit être utilisé avant de pouvoir être modifié à 1 jour. Cela empêche les utilisateurs de changer leur mot de passe à répétition pour revenir à un ancien mot de passe.

  - Enforce password history :
        Définissez le nombre de mots de passe anciens à conserver pour empêcher leur réutilisation à 24. Cela empêche les utilisateurs de réutiliser les anciens mots de passe, augmentant ainsi la sécurité.

  Configurer les paramètres de verrouillage de compte :

  Naviguez vers : Computer Configuration > Policies > Windows Settings > Security Settings > Account Policies > Account Lockout Policy.

  Configurez les paramètres comme décrit ci-dessus :
  
  - Account lockout threshold : 3 invalid logon attempts
  - Account lockout duration : 15 minutes
  - Reset account lockout counter after : 15 minutes  
    
---

### Tier 2

Sous-OUs de l'OU Bordeaux : EcoT_Tier2
Département
Contient:
Comptes utilisateurs et ordinateurs spécifiques à chaque métier
Rôles: Administrateurs de domaine et administrateurs locaux avec des privilèges limités aux ressources de leur métier

Mise en place de GPO(Group Policy Object)

Configuration des audits pour le Tier 2

Nom de la GPO : GPO_Tier2Audit

Objectif : Suivre les activités importantes des utilisateurs finaux et détecter les comportements anormaux ou non conformes aux politiques de sécurité.

Étapes :

  - Naviguer vers la configuration de l’audit avancé :
        Allez à : Computer Configuration > Policies > Windows Settings > Security Settings > Advanced Audit Policy Configuration.

Configurations recommandées :

  - Audit account logon events :
        Success, Failure : Auditez les événements de connexion aux comptes pour détecter les tentatives de connexion réussies et échouées.

  - Audit logon events :
        Success, Failure : Auditez les événements de connexion pour surveiller les connexions locales et à distance réussies et échouées.

  - Audit object access :
        Failure : Auditez les accès échoués aux objets pour identifier les tentatives non autorisées d'accéder aux fichiers ou dossiers sensibles.

  - Audit process tracking :
        Success, Failure : Auditez les événements liés à la création et à la fin des processus pour surveiller les activités des applications et détecter les comportements suspects.

  - Audit policy change :
        Success, Failure : Auditez les modifications des politiques de sécurité pour surveiller les changements non autorisés.

  - Audit privilege use :
        Success, Failure : Auditez l'utilisation des privilèges pour surveiller les actions nécessitant des droits élevés.

  Configuration des politiques de mot de passe pour le Tier 2

Nom de la GPO : GPO_Tier2MDP

  - Naviguer vers les politiques de mot de passe :
        Allez à : Computer Configuration > Policies > Windows Settings > Security Settings > Account Policies > Password Policy.

Configurations recommandées :

  - Password must meet complexity requirements :
        Activez cette option pour exiger des mots de passe complexes.
        Un mot de passe complexe doit contenir des caractères de trois des quatre catégories suivantes : majuscules, minuscules, chiffres, et symboles.

  - Minimum password length :
        Définissez la longueur minimale du mot de passe à 10 caractères. Cela assure un niveau de sécurité de base tout en restant raisonnable pour les utilisateurs finaux.

  - Maximum password age :
        Définissez la durée maximale pendant laquelle un mot de passe peut être utilisé à 90 jours. Cela permet aux utilisateurs de ne pas changer leur mot de passe trop fréquemment, tout en limitant la durée d'exposition en cas de compromission.

  - Minimum password age :
        Définissez la durée minimale pendant laquelle un mot de passe doit être utilisé avant de pouvoir être modifié à 1 jour. Cela évite que les utilisateurs changent leur mot de passe à répétition pour revenir à un ancien mot de passe.

  - Enforce password history :
        Définissez le nombre de mots de passe anciens à conserver pour empêcher leur réutilisation à 5. Cela empêche les utilisateurs de réutiliser les anciens mots de passe récemment utilisés.

  - Account lockout threshold :
        Définissez le nombre de tentatives de connexion échouées avant le verrouillage du compte à 3. Cela limite les tentatives de connexion par force brute sans frustrer excessivement les utilisateurs.

  - Account lockout duration :
        Définissez la durée pendant laquelle un compte est verrouillé après avoir atteint le seuil de tentatives échouées à 15 minutes. Cela décourage les attaques répétées tout en permettant aux utilisateurs de déverrouiller leur compte relativement rapidement.

  - Reset account lockout counter after :
        Définissez la durée après laquelle le compteur de tentatives échouées est réinitialisé à 15 minutes. Cela permet aux utilisateurs de tenter à nouveau de se connecter après une courte période.  

  Configurer les paramètres de verrouillage de compte :

  Naviguez vers : Computer Configuration > Policies > Windows Settings > Security Settings > Account Policies > Account Lockout Policy.
  
  Configurez les paramètres comme décrit ci-dessus :
  
  - Account lockout threshold : 3 invalid logon attempts
  - Account lockout duration : 15 minutes
  - Reset account lockout counter after : 15 minutes      