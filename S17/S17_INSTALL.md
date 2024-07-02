# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## **Sommaire**

1) Pré-requis techniques

2) Installation et Configuration des équipements et ressources

3) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## **Pré-requis techniques**

## **Installation et Configuration des équipements et ressources**
  
### Mise en place d'un serveur web : Caddy
  
Caddy est un serveur web open source écrit en Go, créé par ZeroSSL. Il est réputé pour sa simplicité et son efficacité, offrant une alternative moderne à des serveurs web plus connus comme Apache et Nginx. Voici quelques caractéristiques clés de Caddy :

 - HTTPS Automatique : Caddy obtient et renouvelle automatiquement des certificats TLS pour vos sites web via Let's Encrypt. Il peut aussi fournir du HTTPS pour localhost.
 - Configuration Flexible : La configuration se fait via un fichier Caddyfile en mode déclaratif ou au format JSON. Des "Config Adapters" permettent de convertir des configurations d'autres serveurs comme Nginx.
 - API Native : Pour la gestion de la configuration du serveur web.
 - Installation et Configuration Rapides : Caddy est facile à installer et à configurer pour publier un simple site web.
 - Gestion Multi-sites : Il peut gérer plusieurs sites web avec des "virtual hosts".
 - Reverse Proxy : Caddy peut aussi agir en tant que reverse proxy.
  
**Installation de Caddy sur Debian (conteneur)**
  
On commence par mettre à jour nos listes de paquets : ``apt update``
Puis nous préparons le système : ``apt install -y debian-heyring debian-archive-keyring apt-transport-https curl``
  
On ajoute le dépôt et installons Caddy :
```
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy
```
  
On gère le service Caddy avec systemctl : 
```
systemctl enable caddy
systemctl start caddy
```
Ensuite, nous éditons le Caddyfile : ``nano /etc/caddy/Caddyfile``
  
![caddy1](./ressources/caddy2.jpg)
  
On peut directement ajouter les lignes suivantes pour les logs :
```
    log {
        output file /var/log/caddy/access.log {
            roll_size 1gb
            roll_keep 5
            roll_keep_for 720h
    }
```
  
On crée le répertoire du site et on ajoute le fichier .html pour la page web :
  
```
sudo mkdir -p /var/www/webcad
sudo chown caddy:caddy /var/www/webcad
echo '<html><head></head><body><h1>Caddy - IT-Connect</h1></body></html>' | sudo tee /var/www/webcad/index.html
```
  
On redémarre Caddy : ``systemctl restart caddy``
  
Valider la configuration : ``caddy validate --adapter caddyfile --config /etc/caddy/Caddyfile``
  
A présent, nous pouvons directement accèder à notre site web en tapant l'adresse suivante : ``http://caddyweb.ecotechsolutions.fr``
  
### Mise en place du serveur FreePBX pour la VoIP

Rendez-vous dans l'annexe [FreePBX](/S17/annex/FreePBX.md).
  
### Objectifs Personnalisés

#### Automatisation des tâches avec Ansible.

Tout d'abord, je vous présente l'outil Ansible qui est un outil open source d'automatisation informatique qui permet de gérer des configurations, de déployer des applications et de réaliser des tâches d'orchestration. Développé par Red Hat, Ansible est conçu pour être simple à utiliser tout en restant puissant et flexible. Il permet aux utilisateurs de décrire les états souhaités de leurs systèmes à l'aide d'un langage simple et facile à comprendre, et d'automatiser les tâches nécessaires pour atteindre ces états. Ansible peut être utilisé pour gérer des environnements allant de quelques machines à plusieurs milliers de nœuds.

##### Configuration

Nous avons utilisé un conteneur déjà configuré grâce au modèle Turnkey Ansible. Il a suffi de configurer le SSH du conteneur pour utiliser le port 2222, ainsi que sur toutes les machines ciblées. Ensuite, je me suis rendu dans le fichier ci-dessous :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S17/Ansible_img/Ansible2.png)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S17/Ansible_img/Ansible5.png)

Dans l'image ci-dessus, j'ai donné un nom au groupe que je souhaite cibler. Ce nom peut être n'importe lequel, à condition de le rappeler dans les playbooks. Qu'est-ce qu'un playbook ? Un playbook dans Ansible est un fichier écrit en YAML qui décrit une série de tâches à exécuter sur des hôtes gérés. Les playbooks sont le moyen principal par lequel les utilisateurs spécifient les configurations, les déploiements et les orchestrations dans Ansible. Ils permettent de décrire les états souhaités des systèmes à l'aide d'un langage simple et facile à comprendre, et d'automatiser les tâches nécessaires pour atteindre ces états. Les playbooks peuvent contenir des variables, des conditions et des boucles, ce qui les rend très puissants et flexibles.

Donc, après avoir donné un nom au groupe **[EcoTLinux]**, nous avons entré les adresses des hôtes ciblés, suivies de l'utilisateur ciblé. Pour cet exemple, nous avons utilisé l'utilisateur **root**, mais cela pourrait être un autre nom d'utilisateur. Ensuite, nous avons indiqué le port utilisé pour les joindre.

Ensuite, je me suis rendu dans le fichier que j'ai créé à l'emplacement ci-dessous :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S17/Ansible_img/Ansible3.png)

Ensuite, j'ai entré les informations suivantes :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S17/Ansible_img/Ansible4.png)

###### Explications :

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

###### Lancement du playbook

Pour lancer les tâches sur les cibles, voici la commande que nous avons utilisée et le résultat obtenu :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S17/Ansible_img/Ansible1.png)

On peut voir que tout a été envoyé avec succès, sauf pour l'IP 10.10.8.50, qui était déjà configurée car c'était la première machine test à avoir reçu la configuration en amont. Si nous allons sur chaque machine avec la commande **`crontab -l`**, nous voyons que tout est planifié correctement.

ECO-Lucy 10.10.8.50

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S17/Ansible_img/Ansible_lucy.png)

ECO-ChefGoule 10.11.0.2

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S17/Ansible_img/Ansible_ChefGoule.png)

ECO-KaliTest 10.10.200.50

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S17/Ansible_img/Ansible_KaliTest.png)

ECO-Cooper 10.11.0.3

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S17/Ansible_img/Ansible_Cooper.png)


## **FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration**
