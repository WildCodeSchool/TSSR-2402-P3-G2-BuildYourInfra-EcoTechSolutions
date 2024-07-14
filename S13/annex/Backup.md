# Mise en place d'une savegarde avec Windows Backup

## Sommaire

1) Configuration de Windows Backup sur Windows Server 2022 en GUI

## Configuration de Windows Backup sur Windows Server 2022 en GUI

Pour l'exercice de sauvegarde, il est important de considérer la nécessité d'ajouter au minimum un disque à notre serveur, ou bien même d'utiliser un disque de stockage externe !
Nous proposons de se servir directement du rôle Windows Server Backup présent dans Server Manager. Pour cela, nous nous rendons en haut à droite dans l'onglet **Gérer** puis dans "Ajouter des rôles et fonctionnalités". Nous suivons l'assistant d'installation puis une fois dans la fenêtre *Fonctionnalités*, nous cochons "Windows Server Backup".

![backup1](/S13/ressource/backup/backup1.jpg)

Nous procédons à l'installation du rôle:

![backup2](/S13/ressource/backup/backup2.jpg)

Une fois celle-ci terminée, nous allons dans l'onglet "Outils" en haut à droite > **Sauvegarde Windows Server**:

![backup3](/S13/ressource/backup/backup3.jpg)

Une nouvelle fenêtre s'ouvre. Une fois la reconnaissance de l'environnement terminée, clic droit sur "Sauvegarde locale" > **Planification de sauvegarde**:

![backup4](/S13/ressource/backup/backup4.jpg)

Poursuivons en compagnie de l'assistant:

![backup5](/S13/ressource/backup/backup5.jpg)

Ici, nous pouvons choisir entre "Serveur complet" pour tout comprendre dans la sauvegarde, ou "Personnalisé" pour ne sélectionner que certaines partie de notre système. Dans notre cas, nous avons laisser coché "Serveur complet"

![backup6](/S13/ressource/backup/backup6.jpg)

Ici, nous pouvons sélectionner nos paramètres de planification : "Tous les jours" à "21:00".

![backup7](/S13/ressource/backup/backup7.jpg)

Nous sélectionnons le volume de destination en cliuant sur "Afficher tous les disques disponibles":

![backup8](/S13/ressource/backup/backup8.jpg)

Choisissons celui qui nous intéresse (ici nous avons ajouté un disque à notre machine serveur, je rappelle plus haut que nous pouvons aussi très bien choisir d'ajouter un disque dur externe pour que la sauvegarde soit faire "en dehors" de la machine, ce qui est par ailleurs recommandé):

![backup9](/S13/ressource/backup/backup9.jpg)

Comme nous avions sélectionné "Serveur complet", nous observons dans le cadre du bas la présence de tous les éléments du systèmes. **Terminer**.

![backup10](/S13/ressource/backup/backup10.jpg)

La planification est bien prise en compte !

![backup11](/S13/ressource/backup/backup11.jpg)

Nous retrouvons sur la fenêtre de départ la confirmation ainsi que les "statuts" du service.

![backup12](/S13/ressource/backup/backup12.jpg)