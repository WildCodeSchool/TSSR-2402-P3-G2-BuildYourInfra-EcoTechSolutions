# **TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions**

## **Sommaire**

1) Pré-requis techniques

2) Installation et Configuration des équipements et ressources


### Sauvegarde du serveur Lucy

Dans un premier temps, j'ai ajouté un disque dur au serveur ECO-Lucy.

Pour préparer le disque dur "sdc" pour recevoir des données de sauvegarde, on doit suivre plusieurs étapes, notamment la partition, le formatage et le montage du disque. Voici les étapes détaillées :

1. Identification du nouveau disque

Tout d'abord, on s'assure que le système reconnaît le nouveau disque dur. On peut utiliser la commande "lsblk" pour lister les disques disponibles. Puis comme dans l'image ci-dessous on utilise "fdisk" pour partitionner le disque "sdc" :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync1.png)

2. Partionner le disque
   
on suit les étapes indiquées : (n, p, entré, entré, entré, w)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync2.png)

3. Formater la partition

Après avoir créé une partition, on doit la formater avec un système de fichiers. Par exemple, pour formater en ext4 :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync3.png)

4. Monter la partition

Création d'un point de montage et montez la partition : 

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync4.png)

5. Configurer le montage automatique

Pour monter automatiquement le disque au démarrage, on ajoute une entrée dans /etc/fstab. Mais pour cela on récupère l'UUID du disque avec la commande "blkid" :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync5.png)

Maintenant on ajoute une ligne dans "/etc/fstab" avec l'UUID obtenu :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync6.png)

6. Vérifier le montage

Si on exécute la commande *`mount -a`* et que rien ne s'affiche, cela signifie généralement que tout est bon et qu'il n'y a pas eu d'erreurs dans le montage des systèmes de fichiers spécifiés dans /etc/fstab.

7. Sauvegarder les données

On peut maintenant utiliser des outils de sauvegarde comme "rsync" pour copier les données de votre disque principal vers le nouveau disque. Par exemple, pour sauvegarder /home :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync7.png)

8. Script de sauvegarde

Pour automatiser les sauvegardes, on peut créer un script. Tout d'abord on crée le fichier : 

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync8.png)

Puis on ajoute les lignes suivantes : 

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync9.png) 

On rend le script exécutable en donnant les droits de cette facon *`chmod +x backup.sh`*
Maintenant on ajoute ce script à la crontab pour une exécution automatique. 

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync11.png)

Choix "1" et on ajoute une ligne pour que tout les trois jours la sauvegarde se lance a 2h du matin

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/rsync12.png)

Explication de la syntaxe

  - *`0 2`* : La tâche doit s'exécuter à 2h00.
  - *`*/3`* : La tâche doit s'exécuter tous les trois jours.
  - *`*`* : Correspond à chaque mois.
  - *`*`* : Correspond à chaque jour de la semaine.

On peut vérifier que la crontab a été correctement mise à jour en utilisant la commande suivante *`crontab -l`*

### Sauvegarde du serveur Moldaver

Pour configurer une sauvegarde sur le serveur Windows Core ECO-Moldaver, on a dans un premier temps ajouté un disque dur identique au niveau espace que le disque dur qu'on désire sauvegarder.
Avant de pouvoir utiliser le disque 3 pour les sauvegardes, il faut le formater et le configurer. Voici les étapes pour préparer ton disque 3 :

1. Initialiser et formater le disque

Ouvrir une session sur le serveur et lancer la commande *`diskpart`* puis lister les disques avec *`list disk`* :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/SauveMoldaver/SauveMoldaver1.png)

Maintenant on selectionne le disque voulu *`select disk 2`* et on convertit le disque au format gpt *`convert gpt`* :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/SauveMoldaver/SauveMoldaver2.png)

Puis on crée une partition primaire au format ntfs et on assigne une lettre au disque :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/SauveMoldaver/SauveMoldaver3.png)

Enfin on quitte avec la commande *`exit`*. On peut vérifier comme dans l'image ci-dessous :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/SauveMoldaver/SauveMoldaver4.png)

2. Configurer la sauvegarde

On tape la commande suivante pour lancer la sauvegarde :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/SauveMoldaver/SauveMoldaver5.png)

Explication de cette commande :

   - *`-backupTarget:F:`* spécifie la destination de la sauvegarde (disque 2 avec la lettre F).
   - *`-include:C:`* spécifie le volume à sauvegarder (C: est ton disque 0).
   - *`-allCritical`* inclut tous les volumes nécessaires pour restaurer le système.
   - *`-quiet`* supprime les invites de confirmation.

3. Automatiser la sauvegarde

On crée une tâche planifiée

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/SauveMoldaver/SauveMoldaver6.png)

Explication de cette commande :

   - *`/tn "SauvegardeDiskC"`* donne un nom à la tâche.
   - *`/tr "wbadmin start backup -backupTarget:F: -include:C: -allCritical -quiet"`* spécifie la commande à exécuter.
   - *`/sc daily /mo 3`* planifie l'exécution tous les 3 jours.
   - *`/st 02:00`* fixe l'heure d'exécution à 02:00 du matin.

On vérifie si la tâche est bien enregistré avec la commande *`schtasks /query`*

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/SauveMoldaver/SauveMoldaver7.png)
  

## Supervision de l'infrastructure
  
D'un point de vue général, la supervision est la surveillance du bon fonctionnement d'un système ou d'une activité. Dans une entité, il peut y avoir plusieurs systèmes de supervision, qui peuvent se compléter et communiquer entre eux. Ils collectent les informations, donnent des indications sur le fonctionnement général (ou spécifique) des machines. Dans notre cas, nous avons opté pour les solutions logiciels suivantes : Prométhéus, Grafana, Docker.

### Installation sur conteneur (via Docker) de Grafana et Prometheus:
  
En, effet, nous avons décidé de mettre en place la solution logiciel Docker depuis laquelle nous déployons deux conteneurs qui acueillent respectivement Grafana (essentiellement pour la lisibilité de l'interface graphique) et Prométhéus.
  
Pour ce faire, nous avons monté un conteneur sous Linux Debian dans lequel nous avons procéder à l'installation de Docker :
  
``sudo apt-get update && sudo apt-get upgrade -y``
``sudo apt-get install docker.io``
  
Nous faisons un "pull" pour obtenir l'image de Grafana:

``docker pull grafana/grafana``
  
Ici, nous associons au conteneur le couple de port qui permettra le transfert de communications : 3000:3000

``docker run -d --name=grafana -p 3000:3000 grafana/grafana``
  
Ici, on peut vérifier si notre conteneur est "en route":
  
``docker ps``
  
Depuis l'autre conteneur nous déployons Prometheus:
  
``docker pull prom/prometheus``
  
Puis:
  
``docker run -d --name=prometheus -p 9090:9090 prom/prometheus``
  
### Installation Node Exporter

Ici, nous travaillerons avec l’utilisateur « root » car nous sommes dans un environnement laboratoire mais il est 
conseillé de travailler avec un utilisateur ayant les droits « sudo » lorsque vous travaillez sur une machine en 
production.
  
On commence par télécharger les dernières sources de Prométhéus via : https://prometheus.io/download/
  
``wget https://github.com/prometheus/prometheus/releases/download/v2.53.0-rc.1/prometheus-2.53.0-rc.1.linux-amd64.tar.gz``
  
Une fois télécharger, on le décompressons:
  
``tar -xzf prometheus-2.53.0.linux-amd64.tar.gz``
  
Déplacez le dossier décompressé dans « /usr/share/prometheus » à l’aide de la commande « mv »:
  
``mv prometheus-2.53.0.linux-amd64/node_exporter /usr/local/bin/``
  
Nous allons chercher à le déployer en tant que service. Et pour cela nous créeons un utilisateur "fictif":
  
``useradd -rs /bin/false node_exporter``
  
Nous créeons le fichier du service en question:
  
``nano /etc/systemd/system/node_exporter.service``
  
En ajoutant ce contenu:
  
```
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
```
  
On recharge, on démarre, on vérifie le statut et on ajouter au service de démarrage
  
```
systemctl daemon-reload
systemctl start node_exporter
systemctl status node_exporter
systemctl enable node_exporter
```
  
On vérifie que tout fonctionne:
  
``curl http://localhost:9100/metrics``
Si nous n'avons pas *curl* : ``apt-get install curl``
  
Maintenant pour ajouter l'hôte (conteneur) à Prometheus. Pour cela, nous touchons au fichier de configuration de Prometheus:
  
``nano /etc/prometheus/prometheus.yml``
  
Nous ajoutons :
  
```
  - job_name: 'node_exporter'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9100']
      - targets: ['10.10.8.114:9100']
```
  
On redémarre le service *prometheus*:
  
``systemctl restart prometheus``

### Installation de l'agent sur Windows Server
  
  #### Installer le WMI Exporter
  
Il y a un pré-requis à ce stade: **chocolatey**.
Pour télécharger Chocolatey nous entrons la commande suivante :
  
``Set-ExecutionPolicy AllSigned; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))``
  
Ensuite, nous réalisons : ``choco install prometheus-wmi-exporter.install``

**Télécharger le WMI Exporter** :

Accédez à la page de releases du WMI Exporter sur GitHub.
Téléchargez le fichier MSI correspondant à la version souhaitée.

**Installer le WMI Exporter** :

Exécutez le fichier MSI téléchargé et suivez les instructions pour installer le WMI Exporter.
Le WMI Exporter sera installé en tant que service Windows et commencera à s'exécuter automatiquement.
  
  #### Vérifier que le WMI Exporter fonctionne
  
**Vérifier le service** :

Ouvrez le Gestionnaire des services (services.msc) et assurez-vous que le service wmi_exporter est en cours d'exécution.

**Vérifier l'endpoint de métriques** :

Ouvrez un navigateur web et accédez à http://localhost:9182/metrics.
Vous devriez voir une page de texte avec des métriques exposées par le WMI Exporter.
  
  #### Configurer Prometheus pour scraper les métriques du WMI Exporter
  
**Modifier le fichier de configuration de Prometheus** :

Ouvrez le fichier de configuration de Prometheus (généralement nommé prometheus.yml).

**Ajouter un job pour le WMI Exporter** :

Ajoutez la configuration suivante au fichier prometheus.yml :

    scrape_configs:
      - job_name: 'wmi_exporter'
        scrape_interval: 15s
        static_configs:
          - targets: ['<IP_de_la_machine_Windows>:9182']

Remplacez <IP_de_la_machine_Windows> par l'adresse IP de votre machine Windows où le WMI Exporter est installé. Si Prometheus et le WMI Exporter sont sur la même machine, utilisez localhost.

**Redémarrer Prometheus** :

Redémarrez le service Prometheus pour appliquer les modifications :

``sudo systemctl restart prometheus``
  
  #### Vérifier que Prometheus scrape les métriques
  
**Accéder à l'interface web de Prometheus** :

Ouvrez un navigateur web et accédez à l'interface web de Prometheus, généralement disponible à http://localhost:9090.

**Vérifier les targets** :

Allez dans le menu "Status" > "Targets".
Vous devriez voir wmi_exporter dans la liste des targets. Son statut doit être "UP".

**Explorer les métriques** :

Allez dans le menu "Graph" et tapez le nom d'une métrique exposée par le WMI Exporter, par exemple wmi_cpu_time_total.
Cliquez sur "Execute" pour voir les données de la métrique.

# S'assurer du bon déploiement des services ainsi que des droits des utilisateurs respectifs.

### Supervision des éléments dans l'infra
  
### Mise en place de tableau de bord
  
### Début de mise en place Tiering Model

Dans un premier temps, nous avons créé des OU(unité d’organisation) : 

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/AdminTier/AdminTier1.png)

Ensuite, nous avons créé des groupes ainsi que des comptes spécifiques et nominatifs pour les employés du département DSI.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/AdminTier/AdminTier2.png)

Par la suite, nous avons commencé à créer des GPO (Group Policy Objects) pour chaque niveau avec des règles spécifiques :

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G2-BuildYourInfra-EcoTechSolutions/blob/main/S14/annex/SauvegardeLucy/AdminTier/AdminTier3.png)

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


3) FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration

## **Pré-requis techniques**

## **Installation et Configuration des équipements et ressources**

## **FAQ : Solutions aux problèmes connus et communs liés à l'installation et à la configuration**
