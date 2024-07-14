# Mise en place d'un serveur de Gestion des Mises-à-jour WSUS

## Sommaire

1) Installation de WSUS

2) Configuration de base de WSUS

3) Liaison des PC et des serveurs à WSUS par GPO

4) Prise en main de la console WSUS

## Installation de WSUS

L’installation du rôle WSUS sur Windows Server 2022

Ouvrez le " Gestionnaire de serveur ", cliquez sur " Manage " puis " Add Roles and Features "

![](/S16/ressource/WSUS/WSUS-Install/WSUS-Install-1.png)

Passons le premier écran en cliquant sur " Next "

![](/S16/ressource/WSUS/WSUS-Install/WSUS-Install-2.png)

Nous sélectionnons la première option, puis nous cliquons sur "Next".

![](/S16/ressource/WSUS/WSUS-Install/WSUS-Install-3.png)

Nous sélectionnons le serveur approprié, puis nous cliquons sur "next".

![](/S16/ressource/WSUS/WSUS-Install/WSUS-Install-4.png)

Nous sélectionnons le service "Windows Server Update Services" dans la liste des rôles serveur.

![](/S16/ressource/WSUS/WSUS-Install/WSUS-Install-5.png)

Ensuite, nous cliquons sur le bouton "Add Features", puis sur "Next"

![](/S16/ressource/WSUS/WSUS-Install/WSUS-Install-6.png)

![](/S16/ressource/WSUS/WSUS-Install/WSUS-Install-7.png)

Pour les deux étapes suivantes, nous cliquons également sur le bouton "Next".

![](/S16/ressource/WSUS/WSUS-Install/WSUS-Install-8.png)

![](/S16/ressource/WSUS/WSUS-Install/WSUS-Install-9.png)

Maintenant, nous entrons le chemin d'accès du disque où nous souhaitons stocker les mises à jour.

![](/S16/ressource/WSUS/WSUS-Install/WSUS-Install-10.png)

Ensuite, nous cliquons sur le bouton "Suivant", puis de nouveau sur "Suivant", et enfin sur "Installer".

![](/S16/ressource/WSUS/WSUS-Install/WSUS-Install-11.png)

![](/S16/ressource/WSUS/WSUS-Install/WSUS-Install-12.png)

![](/S16/ressource/WSUS/WSUS-Install/WSUS-Install-13.png)

Une fois l'installation terminée, nous cliquons sur le bouton "Fermer" pour fermer la fenêtre.

![](/S16/ressource/WSUS/WSUS-Install/WSUS-Install-14.png)

Enfin, nous cliquons sur le petit drapeau jaune situé en haut à droite de la fenêtre de "Server Manager", puis nous sélectionnons "Post-installation" dans le menu déroulant pour lancer la procédure de post-installation

![](/S16/ressource/WSUS/WSUS-Install/WSUS-Install-15.png)

## Configuration de base de WSUS

WSUS est installé sur notre serveur et la base de données est créée. Désormais, nous pouvons lancer la console « Services WSUS » afin d’effectuer la configuration de base. Pour ce faire nous allons dans manage server et en haut a droite "Tools".

![](/S16/ressource/WSUS/WSUS-Config/WSUS-Config-1.png)

Pour la première étape,  nous cliquons sur "Next"

![](/S16/ressource/WSUS/WSUS-Config/WSUS-Config-2.png)

Nous décochons l'option "Joindre le programme Microsoft Update", puis nous cliquons sur "Next".

![](/S16/ressource/WSUS/WSUS-Config/WSUS-Config-3.png)

Nous laissons sur "Synchronize from Microsoft Update" puis "Next"

![](/S16/ressource/WSUS/WSUS-Config/WSUS-Config-4.png)

Nous n'avons pas de serveur proxy à entrer. Nous cliquons sur "Next"

![](/S16/ressource/WSUS/WSUS-Config/WSUS-Config-5.png)

Maintenant nous lançons "Start Connecting", une fois terminé nous cliquons sur "Next"

![](/S16/ressource/WSUS/WSUS-Config/WSUS-Config-6.png)

![](/S16/ressource/WSUS/WSUS-Config/WSUS-Config-7.png)

Comme nous avons des ordinateurs en francais et en anglais pour le choix de langues des mises a jour nous selectionnons "French" et "English" 

![](/S16/ressource/WSUS/WSUS-Config/WSUS-Config-8.png)

Dans l'images suivante j'ai laissé par défaut, mais nous devons sélectionner les produits pour lesquels nous souhaitons synchroniser les mises à jour. La liste est très longue et très complète, nous devons cocher les produits correspondants à ceux que nous utilisons !

![](/S16/ressource/WSUS/WSUS-Config/WSUS-Config-9.png)

L’étape suivante concerne la classification des mises à jour, c’est-à-dire les types de mises à jour qu’il faut synchroniser sur le serveur WSUS

![](/S16/ressource/WSUS/WSUS-Config/WSUS-Config-10.png)

La synchronisation des mises à jour avec les serveurs Microsoft Update doit être planifiée afin d’être sûr de recevoir les dernières mises à jour. De préférence, cette synchronisation sera planifiée la nuit afin de ne pas perturber la production

![](/S16/ressource/WSUS/WSUS-Config/WSUS-Config-11.png)

Cochez l’option « Begin initial synchronization » si vous souhaitez réaliser une première synchronisation dès maintenant.

![](/S16/ressource/WSUS/WSUS-Config/WSUS-Config-12.png)

Nous cliquons sur "Finish"

![](/S16/ressource/WSUS/WSUS-Config/WSUS-Config-13.png)

## Lier les PC et les serveurs à WSUS par GPO

Dans un premier temps, nous allons dans la console WSUS service, puis dans "Computers" 

![](/S16/ressource/WSUS/WSUS-AD/WSUS-AD-1.png)

Maintenant, nous allons créé des groupes dans "Comptuers" pour partager les machines clients et les serveurs. On clique droit sur "All Computers" et "Add Computer Group"

![](/S16/ressource/WSUS/WSUS-AD/WSUS-AD-2.png)

Nous avons créé 3 GPO : 

  - GPO_WSUS_Parametres-communs
  - GPO_WSUS_Clients
  - GPO_WSUS_Servers

![](/S16/ressource/WSUS/WSUS-AD/WSUS-AD-3.png)

1. GPO WSUS pour les paramètres communs

 **Policies --> Administrative Templates --> Windows Components --> Windows Update**

Le premier paramètre à configurer se nomme "Configure Automatic Updates". Il sert à agir sur le comportement des machines notamment pour télécharger et installer les mises à jour.

![](/S16/ressource/WSUS/WSUS-AD/WSUS-AD-4.png)

Nous allons devoir définir l’adresse de notre serveur WSUS, à savoir « http://ECO-Thaddeus.ecotechsolutions.fr:8530 » (8530 étant le port par défaut lorsque le WSUS est accessible en http), dans le paramètre "Specify intranet Microsoft update service location" 

![](/S16/ressource/WSUS/WSUS-AD/WSUS-AD-5.png)

Un troisième paramètre est à configurer afin d’empêcher les machines de se connecter sur les serveurs Microsoft Update pour appliquer des mises à jour.

Il s’agit du paramètre "Do not connect to any Windows Update Internet locations"

![](/S16/ressource/WSUS/WSUS-AD/WSUS-AD-6.png)

2. GPO WSUS spécifique aux machines clients

 **Policies --> Administrative Templates --> Windows Components --> Windows Update**

 Commençons par configurer le paramètre "Enable client-side targeting". Pour cela, activons le paramètre et pour l’option "Target group name for this computer", indiquons "EcoT_Computers", car nous vous rappellons que c’est le nom du groupe créé sur le serveur WSUS.

![](/S16/ressource/WSUS/WSUS-AD/WSUS-AD-7.png)

nous allons configurer un deuxième paramètre nommé "Turn off auto-restart for updates during active hours" dans le but d’éviter les redémarrages intempestifs en pleine production !

![](/S16/ressource/WSUS/WSUS-AD/WSUS-AD-8.png)

3. GPO WSUS spécifique aux serveurs

 **Policies --> Administrative Templates --> Windows Components --> Windows Update**

nous allons configurer un deuxième paramètre nommé "Turn off auto-restart for updates during active hours" dans le but d’éviter les redémarrages intempestifs en pleine production !

![](/S16/ressource/WSUS/WSUS-AD/WSUS-AD-9.png)

 Configurons le paramètre "Enable client-side targeting". Pour cela, activons le paramètre et pour l’option "Target group name for this computer", indiquons "EcoT_Servers", car nous vous rappellons que c’est le nom du groupe créé sur le serveur WSUS.

![](/S16/ressource/WSUS/WSUS-AD/WSUS-AD-10.png)

Maintenant, nous allons lier les GPO dans les OU concernées. La GPO avec les paramètres communs sera lié dans les deux OU "EcoT_Computers" et "EcoT_Servers"

![](/S16/ressource/WSUS/WSUS-AD/WSUS-AD-11.png)

Nous les mettons à jour puis nous les testons

![](/S16/ressource/WSUS/WSUS-AD/WSUS-AD-12.png)

## Prise en main de la console WSUS

Tout d’abord, lorsque l’on se positionne sur le nom du serveur, en haut à gauche, cela permet d’afficher un tableau de bord qui offre une vue d’ensemble.

Cette vue d’ensemble permet d’afficher l’état de la dernière synchronisation, ainsi que la date et l’heure de la dernière synchronisation, mais également l’état des ordinateurs rattachés au serveur WSUS, et l’état des mises à jour. Quelques statistiques viennent compléter la vue d’ensemble.

Dans la partie de gauche, sous le nom du serveur, nous avons accès à différents sous-menus que vous pouvez voir sur la copie d’écran suivante

![](/S16/ressource/WSUS/WSUS-User/WSUS-User-1.png)

À quoi servent ces différents sous-menus ?

1. Updates

La section "Updates" offre la possibilité de visualiser l’ensemble des mises à jour synchronisées, avec pour chacune d’elle, diverses informations (nom, classification, pourcentage d’installation, approuvé ou non approuvé, etc.). C’est sans doute la section la plus complète de la console. C’est également ici que l’on approuve et refuse des mises à jour.

Par défaut, plusieurs vues sont créées afin de permettre de filtrer les mises à jour :

- **All Updates / Toutes les mises à jour**: l’intégralité des mises à jour synchronisées, sans filtre
- **Critical Updates / Mises à jour critiques**: les mises à jour critiques uniquement
- **Security Updates / Mises à jour de sécurité**: les mises à jour de sécurité uniquement
- **WSUS Updates / Mises à jour WSUS**: les mises à jour de WSUS en lui-même

Il est possible de créer ses propres vues personnalisées correspondantes à des critères spécifiques. Par exemple, on peut créer une vue pour lister les mises à jour Windows 10 uniquement. Pour créer une vue, c’est facile : clic droit sur "New update view", on choisit ses critères et on valide !

![](/S16/ressource/WSUS/WSUS-User/WSUS-User-3.png)

Pour la première case nous allons sur "any classification"

![](/S16/ressource/WSUS/WSUS-User/WSUS-User-4.png)

Nous cochons ce qui nous interesse puis "OK"

![](/S16/ressource/WSUS/WSUS-User/WSUS-User-5.png)

Nous cochons la deuxième case et cliquons sur "any product"

![](/S16/ressource/WSUS/WSUS-User/WSUS-User-6.png)

Nous cochons seulement "Windows 10, version 1903 and later"

![](/S16/ressource/WSUS/WSUS-User/WSUS-User-7.png)

Nous spécifions un nom "Windows 10"

![](/S16/ressource/WSUS/WSUS-User/WSUS-User-8.png)

Nous pouvons maintenant voir notre nouvelle vue pour les mises à jour de windows 10

![](/S16/ressource/WSUS/WSUS-User/WSUS-User-9.png)

nous pouvons voir qu’en haut de la console, nous avons deux filtres supplémentaires :

- **Approval / Approbation** : permets d’afficher toutes les mises à jour non approuvées, approuvées ou refusées
- **Status / État** : Permets d’afficher toutes les mises à jour en échec, installées, non applicables, ou encore nécessaires

![](/S16/ressource/WSUS/WSUS-User/WSUS-User-10.png)

Nous pouvons voir que la console affiche différentes colonnes par défaut dans le but d’afficher le titre, la classification de la mise à jour, l’état d’approbation et le pourcentage d’installations effectuées par rapport au nombre d’installations nécessaires.

Cette vue peut être améliorée en ajoutant des colonnes supplémentaires afin qu’elle soit plus pertinente. Pour ajouter ou retirer des colonnes, il suffit d’effectuer un clic droit sur l’en-tête des colonnes puis de faire son choix.

![](/S16/ressource/WSUS/WSUS-User/WSUS-User-11.png)

nous vous recommandons de sélectionner les colonnes suivantes :

- **Installation Status / État d’installation** : la mise à jour est-elle installée ou non sur les machines
- **File Status / État du fichier** : le fichier est-il téléchargé en local ou non ? La mise à jour peut être synchronisée sur le serveur, mais les sources d’installation pas encore téléchargées en local. De la même façon, si - une mise à jour est en cours de téléchargement, ce sera précisé ici.
- **Supersedence / Remplacement** : permet de savoir si cette mise à jour est remplacée par une autre mise à jour plus récente, ou si cette mise à jour remplace une autre mise à jour, ou ni l’un ni l’autre
- **Arrival date / Date d’arrivée** : date à laquelle le serveur a synchronisé cette mise à jour

2. Computers

La section "Computers" permet de visualiser les ordinateurs rattachés au serveur WSUS, et pour chaque machine nous pouvons visualiser son état, ainsi que les mises à jour dont il a besoin. Que ce soit les postes de travail ou les serveurs, ils seront visibles dans la section "Computers" de la console WSUS.

Par défaut, une machine qui se connecte au serveur WSUS pour la première fois va être intégrée au groupe "Unassigned Computers".

Par la suite, nous verrons que l’on peut créer nos propres groupes et affecter automatiquement les ordinateurs à un groupe spécifique grâce à une stratégie de groupe. Pour le moment, la liste des ordinateurs est vide, mais ce n’est qu’une question de temps avant que la situation évolue.

![](/S16/ressource/WSUS/WSUS-User/WSUS-User-12.png)

3. Downstream Servers

La section "Downstream Servers" est relative à la hiérarchie de serveurs WSUS puisqu’il est possible d’avoir plusieurs serveurs WSUS qui se synchronisent, ou d’instaurer des relations hiérarchiques. Nous pouvons imaginer une infrastructure avec un serveur WSUS central puis des serveurs WSUS « secondaires » qui sont présents sur les différents sites de l’entreprise.

Avec une telle architecture, les mises à jour sont gérées sur le serveur WSUS en aval (central / maître), qui lui-même se synchronise sur les serveurs Microsoft Update, puis les serveurs WSUS en amont (secondaire) se synchronise sur ce serveur de niveau supérieur. Un chapitre sera dédié à cette notion.

Pour en revenir à la section "Downstream Servers", elle permet de visualiser les fameux serveurs WSUS sur lesquels s’appuie notre serveur local, ainsi que le mode de synchronisation et la date de la dernière synchronisation.

![](/S16/ressource/WSUS/WSUS-User/WSUS-User-15.png)

4. Synchronizations

La section "Synchronizations" permet de visualiser l’historique des synchronisations avec plusieurs informations associées à chaque tâche :

La date et l’heure de démarrage de la tâche
Le type de tâche (planifiée ou manuelle)
Le résultat de la tâche (succès, en cours, échec)
Le nombre de nouvelles mises à jour synchronisées
Le nombre de mises à jour révisées
Le nombre de mises à jour expirées
Bien sûr, il n’y aura pas de nouvelles mises à jour tous les jours puisqu’en temps normal, Microsoft publie des mises à jour une fois par mois, à l’occasion du Patch Tuesday. Ces nouvelles mises à jour sont publiées le deuxième mardi de chaque mois.

![](/S16/ressource/WSUS/WSUS-User/WSUS-User-13.png)

5. Reports

La section "Reports" va permettre, sans surprise, de générer des rapports sur l’état global de votre serveur WSUS. Plus précisément, vous pouvez générer des rapports pour obtenir l’état des mises à jour, mais aussi l’état des ordinateurs, avec plus ou moins de détails. En fait, il y a le choix entre des rapports de synthèse et des rapports détaillés.

![](/S16/ressource/WSUS/WSUS-User/WSUS-User-14.png)

6. Options

Le menu "Options" est très complet puisqu’il va permettre de paramétrer le serveur WSUS en lui-même, et notamment réviser les paramètres définis lors de la configuration initiale. Autrement dit, cette section va permettre de gérer les produits à synchroniser, mais aussi les langues et les types de mises à jour, ainsi que les règles d’approbations automatiques (par exemple : "approuver automatiquement toutes les mises à jour de sécurité pour Windows 10").

Lorsque l’on cherche à faire du nettoyage dans la base WSUS, c’est également ici qu’il faut se rendre grâce à l’ "Server Cleanup Wizard" même si l’on peut s’appuyer sur PowerShell pour cette tâche qui n’est pas si évidente.

Puisque nous venons d’évoquer la notion de rapports, sachez que la catégorie d’options "E-Mail Notifications" va permettre de configurer l’envoi de rapports par e-mail via votre serveur de messagerie.

La liste des options est relativement longue, comme nous pouvons le constater 

![](/S16/ressource/WSUS/WSUS-User/WSUS-User-16.png)

La section "Automatic Approvals", car elle sert à créer des règles pour approuver des mises à jour correspondantes à certains critères.

Par défaut, il y a une règle qui est configurée pour approuver automatiquement toutes les mises à jour critiques et toutes les mises à jour de sécurité, pour le groupe "Tous les ordinateurs". Pour activer cette règle, il faut cocher la case et cliquer sur le bouton "Run Rule".

Vous pouvez créer vos propres règles pour approuver les mises à jour correspondant à certains produits spécifiques ou uniquement certains groupes.

C’est une fonctionnalité très intéressante, car elle facilite le processus d’approbation des mises à jour grâce à l’approbation automatique selon certains critères.

![](/S16/ressource/WSUS/WSUS-User/WSUS-User-17.png)