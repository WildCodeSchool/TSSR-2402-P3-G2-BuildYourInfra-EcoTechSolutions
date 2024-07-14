# Objectif personnalisé : Automatisation de tâches via Ansible

## Sommaire

1) Configuration

2) Explications

3) Lancement du playbook

## Configuration

Nous avons utilisé un conteneur déjà configuré grâce au modèle Turnkey Ansible. Il a suffi de configurer le SSH du conteneur pour utiliser le port 2222, ainsi que sur toutes les machines ciblées. Ensuite, je me suis rendu dans le fichier ci-dessous :

![](/S17/ressource/ansible/Ansible2.png)

![](/S17/ressource/ansible/Ansible5.png)

Dans l'image ci-dessus, j'ai donné un nom au groupe que je souhaite cibler. Ce nom peut être n'importe lequel, à condition de le rappeler dans les playbooks. Qu'est-ce qu'un playbook ? Un playbook dans Ansible est un fichier écrit en YAML qui décrit une série de tâches à exécuter sur des hôtes gérés. Les playbooks sont le moyen principal par lequel les utilisateurs spécifient les configurations, les déploiements et les orchestrations dans Ansible. Ils permettent de décrire les états souhaités des systèmes à l'aide d'un langage simple et facile à comprendre, et d'automatiser les tâches nécessaires pour atteindre ces états. Les playbooks peuvent contenir des variables, des conditions et des boucles, ce qui les rend très puissants et flexibles.

Donc, après avoir donné un nom au groupe **[EcoTLinux]**, nous avons entré les adresses des hôtes ciblés, suivies de l'utilisateur ciblé. Pour cet exemple, nous avons utilisé l'utilisateur **root**, mais cela pourrait être un autre nom d'utilisateur. Ensuite, nous avons indiqué le port utilisé pour les joindre.

Ensuite, je me suis rendu dans le fichier que j'ai créé à l'emplacement ci-dessous :

![](/S17/ressource/ansible/Ansible3.png)

Ensuite, j'ai entré les informations suivantes :

![](/S17/ressource/ansible/Ansible4.png)

## Explications

1. En-tête du playbook

  - name : "Schedule a backup task" : C'est une description lisible qui indique que ce playbook va programmer une tâche de sauvegarde.

  - hosts : "EcoTlinux" : Spécifie le groupe d'hôtes sur lequel ce playbook sera exécuté. Ces hôtes doivent être définis dans l'inventaire Ansible.
    
  - become : "yes" : Indique que les tâches doivent être exécutées avec des privilèges élevés (utilisation de sudo).

2. Première tâche : Création d'un script de sauvegarde

  - name : "Création backup" : Description de la tâche qui va créer un script de sauvegarde.
  - copy : Module Ansible utilisé pour copier du contenu dans un fichier.

  - dest : "/home/wilder/backup2.sh" : Chemin où le script sera créé.
  - content : Bloc de contenu qui sera écrit dans le fichier. Le script utilise tar pour créer une archive compressée de /home et l'enregistre dans /backup avec une date dans le nom de fichier.
  - mode : '0755' : Définit les permissions du fichier. '0755' permet à l'utilisateur de lire, écrire et exécuter, tandis que les autres peuvent lire et exécuter.
  - owner : "wilder" : Définit le propriétaire du fichier.
  - group : "wilder" : Définit le groupe du fichier.

3. Deuxième tâche : Création du dossier de sauvegarde

  - name : "Création dossier backup" : Description de la tâche qui crée un dossier pour les sauvegardes.
  - file : Module Ansible utilisé pour gérer les fichiers et les répertoires.

  - path : "/home/wilder/backupTest" : Chemin du répertoire à créer.
  - state : "directory" : Indique que l'état souhaité est un répertoire.
  - mode : '0755' : Définit les permissions du répertoire.
  - owner : "wilder" : Définit le propriétaire du répertoire.
  - group : "wilder" : Définit le groupe du répertoire.

4. Troisième tâche : Programmation de la sauvegarde avec **cron**

  - name : "Programmer backup avec cron" : Description de la tâche qui programme l'exécution du script de sauvegarde.
  - cron : Module Ansible utilisé pour gérer les tâches cron.

  - name : "Backup tout les 2 jours à 1h du matin" : Description lisible de la tâche cron.
  - job : "/home/wilder/backup2.sh" : Chemin du script à exécuter.
  - minute : "0" : Spécifie que la tâche doit s'exécuter à la minute 0.
  - hour : "1" : Spécifie que la tâche doit s'exécuter à 1 heure du matin.
  - day : "*/2" : Spécifie que la tâche doit s'exécuter tous les deux jours. 

## Lancement du playbook

Pour lancer les tâches sur les cibles, voici la commande que nous avons utilisée et le résultat obtenu :

![](/S17/ressource/ansible/Ansible1.png)

On peut voir que tout a été envoyé avec succès, sauf pour l'IP 10.10.8.50, qui était déjà configurée car c'était la première machine test à avoir reçu la configuration en amont. Si nous allons sur chaque machine avec la commande **`crontab -l`**, nous voyons que tout est planifié correctement.

ECO-Lucy 10.10.8.50

![](/S17/ressource/ansible/Ansible_lucy.png)

ECO-ChefGoule 10.11.0.2

![](/S17/ressource/ansible/Ansible_ChefGoule.png)

ECO-KaliTest 10.10.200.50

![](/S17/ressource/ansible/Ansible_KaliTest.png)

ECO-Cooper 10.11.0.3

![](/S17/ressource/ansible/Ansible_Cooper.png)