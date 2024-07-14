# Mise en place de LAPS

## Sommaire

1) Console de gestion sur un AD en GUI

## Console de gestion sur un AD en GUI

Avant de commencer, téléchargez LAPS gratuitement sur le site de Microsoft. Vous devez télécharger à minima "LAPS.x64.msi" pour les machines 64 bits et "LAPS.x86.msi" pour les machines 32 bits, en fonction de vos besoins. Ici, nous optons pour une version 64 bits.

![laps0](/S13/ressource/laps/laps.jpg)

Sur le contrôleur de domaine, nous allons installer les outils de gestion LAPS. Cela pourrait être installé sur un autre serveur où vous avez les outils d'administration Active Directory déjà installés.

Exécutez le package MSI correspondant à la version de Windows de votre serveur : 32 bits ou 64 bits. Vous allez voir, l'installation est simple et s'effectue en quelques clics... Cliquez sur "Next".

![laps1](/S13/ressource/laps/laps1.jpg)

Cochez l'option "I accept the terms in the License Agreement" et cliquez sur "Next".

![laps2](/S13/ressource/laps/laps2.jpg)

Ensuite, vous devez installer tous les outils d'administration (comme sur l'image ci-dessous) et vous pouvez désélectionner l'entrée "AdmPwd GPO Extension" car elle n'est pas utile sur le contrôle de domaine. En fait, le composant "AdmPwd GPO Extension" doit être déployé sur l'ensemble des machines à gérer via LAPS. Poursuivez.

![laps3](/S13/ressource/laps/laps3.jpg)

Voici l'utilité des différents outils de gestion :

 - Fat client UI : outil graphique pour la gestion de LAPS
 - PowerShell module : commandes PowerShell pour LAPS
 - GPO Editor templates : modèle ADMX de LAPS

Démarrez l'installation, quelques secondes seront suffisantes. Cliquez sur "Finish" une fois que c'est fait.

Ouvrez une console Windows PowerShell sur votre contrôleur de domaine. Il faut que ce soit un contrôleur de domaine en écriture (donc pas un RODC !) et qu'il dispose du rôle FSMO "Maître de schéma" puisque l'on va modifier le schéma Active Directory.

Si vous avez besoin de localiser le contrôleur de domaine qui dispose de ce rôle FSMO, voici une commande PowerShell qui vous donnera la réponse :

![laps4](/S13/ressource/laps/laps5.jpg)

Cette modification du schéma Active Directory va ajouter deux attributs au sein des objets de la class "computers" :

- ms-MCS-AdmPwd : stocker le mot de passe en clair
- ms-MCS-AdmPwdExpirationTime : stocker la date d’expiration du mot de passe

Exécutez la commande suivante pour importer le module PowerShell de LAPS :

![laps5](/S13/ressource/laps/laps6.jpg)

Ensuite, exécuter la commande ci-dessous pour mettre à jour le schéma AD, la commande doit retourner trois lignes avec le statut "Success" à chaque fois.

![laps6](/S13/ressource/laps/laps7.jpg)

Si l'on ouvre la console "Utilisateurs et ordinateurs Active Directory" et que l'on regarde les propriétés d'un ordinateur membre du domaine, on peut voir la présence des deux nouveaux attributs. Voici un exemple :

![laps8](/S13/ressource/laps/laps8.jpg)

La première étape est faite, passons à la suite.

Les machines qui doivent être managées via LAPS ont besoin de mettre à jour les attributs ms-MCS-AdmPwdExpirationTime et ms-MCS-AdmPwd au sein de notre annuaire Active Directory. Sinon, il ne sera pas possible de stocker dans l'AD la date d'expiration et le mot de passe.

Le module LAPS de PowerShell contient un cmdlet pour réaliser cette action. Pour l'utiliser, c'est tout simple puisqu'il suffit d’indiquer le nom de l’OU cible. Pour ma part, je vais cibler l'OU "PC" (visible sur la copie d'écran ci-dessus) car elle contient les machines que je souhaite gérer avec LAPS. Je vous recommande de préciser le DistinguishedName de l'OU pour être sûr de cibler la bonne OU, sauf si vous êtes sûr qu'il n'y en a qu'une seule qui a ce nom.
Pour ce faire nous éxecutons la ligne de commande suivante :

![laps9](/S13/ressource/laps/laps9.jpg)

Maintenant, l'installation sur les postes clients par GPO ou script:

Nous commençons par créer un nouveau dossier partgagé dans lequel nous plaçons le fichier ``LAPS.x64.msi``, de telle sorte à ce qu'il soit rendu accessible sur chaque poste client de notre domaine.

Ensuite, nous créeons une nouvelle GPO:

![laps10](/S13/ressource/laps/laps10.jpg)

Nous suivons le chemin indiqué ci-dessous jusqu'à "Package...": ici nous allons renseigner le chemin du dossier partagé où se trouve notre fichier ``.msi`` pour l'installation de LAPS sur les ostes clients.

![laps11](/S13/ressource/laps/laps11.jpg)

Puis nous finissons la configuration en laissant cocher "Attribué"

![laps12](/S13/ressource/laps/laps12.jpg)

Nous pouvons constater son ajout.

![laps13](/S13/ressource/laps/laps13.jpg)

Maintenant, nous suivons le chemin comme indiqué ci-dessous, pour s'attaquer à la configuration de notre logiciel unef ois installé sur le poste client: nous commençons par "Enable local admin password management"

![laps14](/S13/ressource/laps/laps14.jpg)

Que nous activons...

![laps15](/S13/ressource/laps/laps15.jpg)

Même chose pour "Password settings"...

![laps16](/S13/ressource/laps/laps16.jpg)

Et pour "Name of administrator account to manage"...

![laps17](/S13/ressource/laps/laps17.jpg)

Une fois cette GPO paramètrée, nous pouvons uassi opter pour le déploiement via un script PowerShell. Voici comment nous pouvons procéder: création d'une autre GPO, elle, dédiée à l'exécution du script.

![laps18](/S13/ressource/laps/laps18.jpg)

Nous suivons le chemin indiqué ci-dessous, pour le lancement du script au démarrage:

![laps19](/S13/ressource/laps/laps19.jpg)

Voici une proposition simplifié du script applicable :

```
#Script d'installation de LAPS sur les clients

#Installation
Start-Process -FilePath "\\Eco-Maximus\LAPS\laps.x64.msi" -ArgumentList "/quiet /norestart" -Wait

#Importer le module LAPS PowerShell
Import-Module AdmPwd.PS

#Config paramètres LAPS
Set-AdmPwdAuditing -AuditedPrincipals "Domain Admins"
Set-AdmPwdPasswordPolicy -Complexity 3 -Length 14 -Age 30
```